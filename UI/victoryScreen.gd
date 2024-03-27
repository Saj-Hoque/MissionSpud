extends CenterContainer

@onready var solsCount = $VBoxContainer/sols
@onready var potatoCount = $VBoxContainer/potato
@onready var scrapCount = $VBoxContainer/scrap
@onready var robotsCount = $VBoxContainer/robots

func _ready():
	solsCount.text = str(TimeSystem.day) + " Sols"
	potatoCount.text = str(Global.totalPotato) + " Potatoes"
	scrapCount.text = str(Global.totalScrap) + " Scrap"
	robotsCount.text = str(Global.totalRobots) + " Robots"
	
func _on_menu_button_pressed():
	get_tree().change_scene_to_file("res://Menu/menu.tscn")
