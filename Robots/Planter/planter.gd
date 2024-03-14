extends CharacterBody2D

@export var speed = 50
@export var accel = 5
var active: bool = false

@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D

func _unhandled_input(event):
	if event.is_action_pressed("leftClick"):
		navigation_agent.target_position = get_global_mouse_position()
		active = true
		
func _physics_process(delta):
	if active:
		var next_path_pos := navigation_agent.get_next_path_position()
		var direction := global_position.direction_to(next_path_pos).normalized()
		velocity = velocity.lerp(direction * speed, accel * delta)
	else:
		velocity = Vector2.ZERO
		
	move_and_slide()

func enable_npc():
	print("NPC activated")
	navigation_agent.target_position = global_position
	active = true
	
func disable_npc():
	print("NPC disabled")
	active = false

func _on_navigation_agent_2d_target_reached():
	print("Reached target")
	disable_npc()

func _on_navigation_agent_2d_navigation_finished():
	print("Navigation finished")
	disable_npc()
	
	
