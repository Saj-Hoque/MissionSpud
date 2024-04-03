extends CharacterBody2D
class_name harvester_robot

signal target_reached

var first_name = Global.names.pick_random()
var status = "Idle"

@export var max_steering = 2.5
@export var speed = 20
@export var accel = 5
@export var avoid_force = 1000
@export var slow_down_radius = 10
@export var upkeep = 5
@export var productivity = 2.5

@onready var timer = $HarvestingTimer
@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D
@onready var selection_area: Area2D = $SelectionArea2D
@onready var highlight_box: Panel = $highlight_box
@onready var raycasts = get_node("Raycasts")

@onready var idle_area = get_node("/root/world/roomMain/idleArea")
@onready var plot = idle_area.plot
var plot_group

@onready var progress = $ProgressBar
var percentage_of_time

@onready var harvesting_noise = $harvesting_noise

var right_click: bool = false
var selected: bool = false

var active: bool = false
var idle:bool = false

var docking:bool = false
var docker_num:int

var plotting:bool = false
var plot_num : int
var harvesting: bool = false
var harvested: bool = false

var target_position = global_position

func _ready():
	instantiate()
	idle_area.robots.push_back(self)
	idle_area.refresh_capacity()

func instantiate():
	speed = Global.harvesterSpeed
	productivity = Global.harvesterProductivity
	timer.wait_time = productivity
	upkeep = Global.harvesterUpkeep

func _process(delta):
	if Global.harvesterProductivity < timer.wait_time:
		if timer.get_time_left() > 0:
			timer.start((timer.get_time_left() / timer.wait_time) * Global.harvesterProductivity)
		else:
			productivity = Global.harvesterProductivity
			timer.wait_time = productivity
			
	if timer.get_time_left() > 0:
		percentage_of_time = ((1 - timer.get_time_left() / timer.get_wait_time()) * 100)
		progress.value = percentage_of_time

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
	reset_harvesting_status()
	undock()
	var index = idle_area.robots.find(self)
	if index != -1:
		idle_area.robots.remove_at(index)
	idle_area.refresh_capacity()
	idle_area = new_idle_area
	plot = idle_area.plot
	if not plot == null:
		plot_group = plot.get_groups()[0]
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

# Plot related methods

func plot_potato_count():
	if not plot == null:
		return get_tree().get_nodes_in_group(plot_group).size()
	return 0
	

func unoccupy_plot():
	plot.change_plot_status_unoccupied(plot_num)
	plotting = false
	
func start_harvesting():
	harvesting = true
	$HarvestingTimer.start()
	progress.visible = true

func reset_harvesting_status():
	$HarvestingTimer.stop()
	progress.visible = false
	harvesting = false
	harvested = false
	if plotting:
		unoccupy_plot()

func _on_harvesting_timer_timeout():
	if timer.wait_time != Global.harvesterProductivity:
		productivity = Global.harvesterProductivity
		timer.wait_time = productivity

	harvested = true
	harvesting_noise.play()
	progress.visible = false

func self_destruct():
	if plotting:
		reset_harvesting_status()
	if docking:
		undock()
	var index = idle_area.robots.find(self)
	if index != -1:
		idle_area.robots.remove_at(index)
	idle_area.refresh_capacity()
	remove_from_group("robots")
	queue_free()
