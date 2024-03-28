extends CanvasLayer

func _input(event):
	if event.is_action_pressed("escape") and get_tree().current_scene.name != "menu":
		get_tree().paused = !get_tree().paused
		visible = not visible
		
		#if visible:
			#$buttons/resume.grab_focus()

func _on_resume_pressed():
	get_tree().paused = false
	visible = false

func _on_exit_pressed():
	get_tree().paused = !get_tree().paused
	visible = not visible
	SidePanel.visible = false
	SceneTransition.change_scene("res://Menu/menu.tscn")
