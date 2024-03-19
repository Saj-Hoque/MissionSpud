extends CanvasLayer

@onready var anim = $Anim
@onready var state = $Panel/State
@onready var first_name = $Panel/Name

func appear():
	visible = true
	anim.play("TransIn")
	await anim.animation_finished
	
	
func dissappear():
	anim.play("TransOut")
	await anim.animation_finished
	
func _process(delta):
	if not SelectionManager.current_selection.is_empty():
		state.text = SelectionManager.current_selection[0].status
		first_name.text = SelectionManager.current_selection[0].first_name

		



