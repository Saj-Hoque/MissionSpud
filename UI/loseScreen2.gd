extends CenterContainer

@onready var potatoCount = $VBoxContainer/potato
@onready var scrapCount = $VBoxContainer/scrap
@onready var robotsCount = $VBoxContainer/robots
@onready var playerSprite = $AnimatedSprite2D

func _ready():
	potatoCount.text = str(Global.totalPotato) + " Potatoes"
	scrapCount.text = str(Global.totalScrap) + " Scrap"
	robotsCount.text = str(Global.totalRobots) + " Robots"
	playerSprite.play()
	
func _on_menu_button_pressed():
	get_tree().change_scene_to_file("res://Menu/menu.tscn")
