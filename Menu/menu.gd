extends Control

func _ready():
	$buttonsMargin/buttons/start.grab_focus()

func _on_start_pressed():
	get_tree().change_scene_to_file("res://World/world.tscn")

func _on_quit_pressed():
	get_tree().quit()
