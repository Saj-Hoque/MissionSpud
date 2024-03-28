extends Control

func _ready():
	#$buttonsMargin/buttons/start.grab_focus()
	pass

func _on_start_pressed():
	SceneTransition.change_scene("res://World/world.tscn")

func _on_quit_pressed():
	get_tree().quit()
