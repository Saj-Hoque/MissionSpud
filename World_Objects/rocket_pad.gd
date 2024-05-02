extends StaticBody2D

@onready var interactionArea = $interactionArea
@export var action_name : String
@onready var price = $pricePanel
@onready var potatoPrice = $pricePanel/Price/potatoPrice
@onready var scrapPrice = $pricePanel/Price/scrapPrice
@export var y_offset : int

func _ready():
	interactionArea.action_name = action_name
	interactionArea.y_offset = y_offset
	interactionArea.interact = Callable(self, "_on_interact")

func can_buy():
	if Global.potatoCount >= Global.potatoWin and Global.scrapCount >= Global.scrapWin:
		return true
	else:
		return false

func _on_interact():
	var bought = can_buy()
	WinLoseScenario.check_if_won_game(bought)

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



