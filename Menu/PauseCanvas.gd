extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("escape"):
		get_tree().paused = !get_tree().paused
		visible = not visible
	pass


func _on_resume_pressed():
	get_tree().paused = false
	visible = false

func _on_save_pressed():
	print("Save is yet to be implemented")
	pass # Replace with function body.

func _on_exit_pressed():
	print("Replace this with change back to title screen")
	get_tree().quit()
