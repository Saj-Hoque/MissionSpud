extends CenterContainer

@onready var solsCount = $VBoxContainer/sols
@onready var potatoCount = $VBoxContainer/potato
@onready var scrapCount = $VBoxContainer/scrap
@onready var robotsCount = $VBoxContainer/robots
@onready var playerSprite = $AnimatedSprite2D
func _ready():
	solsCount.text = str(TimeSystem.day) + " Sols"
	potatoCount.text = str(Global.totalPotato) + " Potatoes"
	scrapCount.text = str(Global.totalScrap) + " Scrap"
	robotsCount.text = str(Global.totalRobots) + " Robots"
	playerSprite.play()
	
func _on_menu_button_pressed():
	SceneTransition.change_scene("res://Menu/menu.tscn")
