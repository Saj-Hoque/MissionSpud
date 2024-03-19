extends CanvasLayer

@onready var robots = get_node("/root/world/robots")

@onready var planterButton = $Panel/BUY/HBoxContainer/Planter/planterBuyButton
@onready var harvesterButton = $Panel/BUY/HBoxContainer/Harvester/harvesterBuyButton
@onready var collectorButton = $Panel/BUY/HBoxContainer/Collector/collectorBuyButton

var planterPrice = { "potato" : 20,
					 "scrap"  : 20 }
					
var harvesterPrice = { "potato" : 20,
					   "scrap"  : 20 }
					
var collectorPrice = { "potato" : 20,
					   "scrap"  : 20 }

func _ready():
	close_shop()
	await get_tree().get_root().ready
	
func _process(delta):
	
	if visible:
		if Global.potatoCount >= planterPrice["potato"] and Global.scrapCount >= planterPrice["scrap"]:
			planterButton.disabled = false
		else:
			planterButton.disabled = true
		
		if Global.potatoCount >= harvesterPrice["potato"] and Global.scrapCount >= harvesterPrice["scrap"]:
			harvesterButton.disabled = false
		else:
			harvesterButton.disabled = true

		if Global.potatoCount >= collectorPrice["potato"] and Global.scrapCount >= collectorPrice["scrap"]:
			collectorButton.disabled = false
		else:
			collectorButton.disabled = true
			
func open_shop():
	visible = true
	_update_prices()
	
func close_shop():
	visible = false

func _update_prices():
	# update prices based on upgraded price
	pass

func _on_planter_buy_button_pressed():
	pass

func _on_harvester_buy_button_pressed():
	pass

func _on_collector_buy_button_pressed():
	pass # Replace with function body.

func _on_close_button_pressed():
	close_shop()
