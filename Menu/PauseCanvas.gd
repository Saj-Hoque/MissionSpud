extends CanvasLayer

var paused = false

func _input(event):
	if event.is_action_pressed("escape") and get_tree().current_scene.name != "menu" and not Global.menu_active:
		get_tree().paused = !get_tree().paused
		paused = !paused
		visible = not visible
		
		#if visible:
			#$buttons/resume.grab_focus()

func _on_resume_pressed():
	get_tree().paused = false
	paused = false
	visible = false

func _on_exit_pressed():
	Global.running = false
	SelectionManager.reset()
	visible = not visible
	paused = false
	get_tree().paused = !get_tree().paused
	SceneTransition.change_scene("res://Menu/menu.tscn")
	
