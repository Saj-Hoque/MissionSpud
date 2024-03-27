extends CenterContainer

@onready var upkeepCount = $VBoxContainer/upkeep/upkeepCount

func _ready():
	upkeepCount.text = str(Global.upkeep + Global.robot_upkeep) + " Potatoes"
	
func _on_menu_button_pressed():
	get_tree().change_scene_to_file("res://Menu/menu.tscn")
