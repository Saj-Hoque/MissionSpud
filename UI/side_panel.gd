extends CanvasLayer

@onready var anim = $Anim
@onready var state = $Panel/State
@onready var first_name = $Panel/Name
var current_robot = null

func appear():
	visible = true
	anim.play("TransIn")
	await anim.animation_finished
	
	
func dissappear():
	anim.play("TransOut")
	await anim.animation_finished
	
func _process(delta):
	if not SelectionManager.current_selection.is_empty() and visible:
		current_robot = SelectionManager.current_selection[0]
		state.text = current_robot.status
		first_name.text = current_robot.first_name


func _on_button_pressed():
	current_robot.self_destruct()
