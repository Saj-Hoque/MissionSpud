extends CanvasLayer

@onready var anim = $Anim



func appear():
	print(SelectionManager.current_selection)
	visible = true
	anim.play("TransIn")
	await anim.animation_finished
	
	
func dissappear():
	anim.play("TransOut")
	await anim.animation_finished
	

		



