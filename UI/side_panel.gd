extends CanvasLayer

@onready var anim = $Anim
@onready var state = $Panel/State
@onready var first_name = $Panel/Name

var on_screen = false

func appear():
	on_screen = true
	visible = true
	anim.play("TransIn")
	await anim.animation_finished
	
	
func dissappear():
	anim.play("TransOut")
	await anim.animation_finished
	on_screen = false
	
func _process(delta):
	if on_screen and not SelectionManager.current_selection.is_empty():
		state.text = SelectionManager.current_selection[0].status
		first_name.text = SelectionManager.current_selection[0].first_name

		



