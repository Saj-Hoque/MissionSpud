extends Control

func _ready():
	#$buttonsMargin/buttons/start.grab_focus()
	pass

func _on_start_pressed():
	get_tree().change_scene_to_file("res://World/world.tscn")

func _on_load_pressed():
	print("This will be replaced with loading a save")

func _on_quit_pressed():
	get_tree().quit()
