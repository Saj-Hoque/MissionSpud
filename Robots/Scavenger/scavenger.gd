extends CharacterBody2D
class_name scavenger_robot

signal target_reached

var first_name = Global.names.pick_random()
var status = "Idle"

@export var max_steering = 2.5
@export var speed = 50
@export var accel = 5
@export var avoid_force = 1000
@export var slow_down_radius = 10
@export var upkeep = 5
@export var capacity = 2

var carrying = 0

@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D
@onready var selection_area: Area2D = $SelectionArea2D
@onready var highlight_box: Panel = $highlight_box
@onready var raycasts = get_node("Raycasts")

@onready var idle_area = get_node("/root/world/roomMain/idleArea")
@onready var plot = idle_area.plot

@onready var gatherNumbersOrigin = $gatherNumbersOrigin

@onready var gather_noise = $gather_noise

var right_click: bool = false
var selected: bool = false

var active: bool = false
var idle:bool = false

var docking:bool = false
var docker_num:int

var closest_scrap = null

var target_position = global_position

func _ready():
	instantiate()
	idle_area.robots.push_back(self)
	idle_area.refresh_capacity()

func instantiate():
	speed = Global.scavengerSpeed
	capacity = Global.scavengerCapacity
	upkeep = Global.scavengerUpkeep

# Movement related methods

func _physics_process(delta):
	if active:
		var steering = Vector2.ZERO
		steering += seek_steering()
		steering += avoid_obstacles_steering()
		steering = steering.limit_length(max_steering)
		
		velocity += steering
		velocity = velocity.limit_length(speed)
		if ((target_position-position).length()) < slow_down_radius:
			velocity = velocity.limit_length(speed * ((target_position-position).length() / slow_down_radius))
		velocity.lerp(velocity, accel * delta)
		
		move_and_slide()
		
	else:
		velocity = Vector2.ZERO

func seek_steering():
	var next_path_pos = navigation_agent.get_next_path_position()
	var desired_velocity = global_position.direction_to(next_path_pos).normalized() * speed

	return desired_velocity - velocity
	
func avoid_obstacles_steering():
	raycasts.rotation = velocity.angle()
	
	for raycast in raycasts.get_children():
		raycast.target_position.x = velocity.length()
		if raycast.is_colliding():
			var obstacle = raycast.get_collider()
			return (position + velocity - obstacle.position).normalized() * avoid_force
	
	return Vector2.ZERO

func enable_movement():
	navigation_agent.target_position = target_position
	active = true
	
func disable_movement():
	active = false

func _on_navigation_agent_2d_target_reached():
	emit_signal("target_reached")

# Left click related methods

func _on_selection_area_2d_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("leftClick"):
		SelectionManager.register_area(selection_area)

func toggle_select():
	selected = not selected
	highlight_box.visible = not highlight_box.visible
	if selected:
		SidePanel.appear()
	else:
		SidePanel.dissappear()

# Right click related methods
			
func assign_to_new_idle_area(new_idle_area):
	right_click = true
	reset_collecting_status()
	undock()
	var index = idle_area.robots.find(self)
	if index != -1:
		idle_area.robots.remove_at(index)
	idle_area.refresh_capacity()
	idle_area = new_idle_area
	plot = idle_area.plot
	if self not in idle_area.robots:
		idle_area.robots.push_back(self)
	idle_area.refresh_capacity()
	
# Dock related methods
		
func undock():
	idle_area.change_dock_status_unoccupied(docker_num)
	idle_area.update_dock_status_color(docker_num)
	docking = false

func is_in_idle_area():
	if not active and docking: # AND in an idle spot, check this somehow
		idle = true
	else:
		idle = false

# Scavenge related methods

func is_scrap_available():
	for scrap in get_tree().get_nodes_in_group("scraps"):
		if scrap.is_available():
			return 1
	return -1

func find_nearest_scrap():
	var current_distance = 9999999
	var nearest = null
	for scrap in get_tree().get_nodes_in_group("scraps"):
		if not scrap.is_available():
			continue
		var scrap_distance = global_position.distance_to(scrap.global_position)
		if scrap_distance < current_distance:
			current_distance = scrap_distance
			nearest = scrap
	return nearest

func occupy_scrap():
	closest_scrap.occupied()

func unoccupy_scrap():
	if is_instance_valid(closest_scrap):
		closest_scrap.unoccupied()
	else:
		closest_scrap = null
	
func add_to_capacity():
	carrying += 1

func pick_up():
	gather_noise.play(0.4)

func reset_collecting_status():
	unoccupy_scrap()
	
func self_destruct():
	reset_collecting_status()
	if docking:
		undock()
	var index = idle_area.robots.find(self)
	if index != -1:
		idle_area.robots.remove_at(index)
	idle_area.refresh_capacity()
	remove_from_group("robots")
	queue_free()
