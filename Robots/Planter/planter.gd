extends CharacterBody2D

signal target_reached

@export var max_steering = 2.5
@export var speed = 30
@export var accel = 5
@export var avoid_force = 1000

var active: bool = false
var right_click: bool = false
var idle:bool = false
var docked:bool = false

var docker_num:int
var target_position = global_position

@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D
@onready var raycasts = get_node("Raycasts")
		
func _unhandled_input(event):
	if event.is_action_pressed("rightClick"):
		target_position = get_global_mouse_position()
		right_click = true
	

func _physics_process(delta):
	if active:
		var steering = Vector2.ZERO
		steering += seek_steering()
		steering += avoid_obstacles_steering()
		steering = steering.limit_length(max_steering)
		
		velocity += steering
		velocity = velocity.limit_length(speed)
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

func is_in_idle_area():
	if not active and docked: # AND in an idle spot, check this somehow
		idle = true
	else:
		idle = false

func _on_navigation_agent_2d_target_reached():
	emit_signal("target_reached")

func _on_navigation_agent_2d_navigation_finished():
	emit_signal("target_reached")
	
	
