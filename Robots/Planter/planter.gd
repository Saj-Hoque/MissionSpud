extends CharacterBody2D

signal target_reached

@export var speed = 50
@export var accel = 5
var active: bool = false
var right_click: bool = false
var target_position = global_position



@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D

#func _unhandled_input(event):
	#if event.is_action_pressed("rightClick"):
		#navigation_agent.target_position = get_global_mouse_position()
		#active = true

		
func _unhandled_input(event):
	if event.is_action_pressed("rightClick"):
		target_position = get_global_mouse_position()
		right_click = true
	

func _physics_process(delta):
	if active:
		var next_path_pos := navigation_agent.get_next_path_position()
		var direction := global_position.direction_to(next_path_pos).normalized()
		velocity = velocity.lerp(direction * speed, accel * delta)
	else:
		velocity = Vector2.ZERO
		
	move_and_slide()

func enable_movement():
	navigation_agent.target_position = target_position
	active = true
	
func disable_movement():
	active = false
	right_click = false

func _on_navigation_agent_2d_target_reached():
	emit_signal("target_reached")

func _on_navigation_agent_2d_navigation_finished():
	emit_signal("target_reached")
	
	
