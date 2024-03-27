extends StaticBody2D

@onready var player = get_tree().get_first_node_in_group("player")
@onready var interactionArea = $interactionArea
@export var action_name : String
@onready var price = $pricePanel
@onready var potatoPrice = $pricePanel/Price/potatoPrice
@onready var scrapPrice = $pricePanel/Price/scrapPrice

func _ready():
	interactionArea.action_name = action_name
	interactionArea.interact = Callable(self, "_on_interact")

func _on_interact():
	if Global.potatoCount >= Global.potatoWin and Global.scrapCount >= Global.scrapWin:
		Global.totalRobots = (get_tree().get_nodes_in_group("robots")).size()
		SelectionManager.reset()
		SceneTransition.change_scene("res://UI/victoryScreen.tscn")
	else:
		print("Insufficient Resources")

func _on_interaction_area_body_entered(body):
	if Global.potatoCount < Global.potatoWin:
		potatoPrice.add_theme_color_override("font_color", Color("8b0000"))
	else:
		potatoPrice.add_theme_color_override("font_color", Color("ffffff"))
		
	if Global.scrapCount < Global.scrapWin:
		scrapPrice.add_theme_color_override("font_color", Color("8b0000"))
	else:
		scrapPrice.add_theme_color_override("font_color", Color("ffffff"))		
		
	price.visible = true
	

func _on_interaction_area_body_exited(body):
	price.visible = false



