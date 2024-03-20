extends CanvasLayer

@onready var robots = get_node("/root/world/robots")
@onready var main_hub = get_node("/root/world/MainHub")
var planter_scene = preload("res://Robots/Planter/planter.tscn")
var planter_ai_scene = preload("res://ai/Behavior_Trees/planter_ai.tscn")
var harvester_scene = preload("res://Robots/Harvester/harvester.tscn")
var harvester_ai_scene = preload("res://ai/Behavior_Trees/harvester_ai.tscn")

@onready var timer = $buyTimer

@onready var planterButton = $Panel/BUY/HBoxContainer/Planter/planterBuyButton
@onready var plantedUpkeepLabel = $Panel/BUY/HBoxContainer/Planter/upkeep/upkeepLabel

@onready var harvesterButton = $Panel/BUY/HBoxContainer/Harvester/harvesterBuyButton
@onready var collectorButton = $Panel/BUY/HBoxContainer/Collector/collectorBuyButton

var disable_override = false

var planterPrice = { "potato" : 20,
					 "scrap"  : 20 }
var planterUpkeepValue = 5
					
var harvesterPrice = { "potato" : 20,
					   "scrap"  : 20 }
					
var collectorPrice = { "potato" : 20,
					   "scrap"  : 20 }

func _ready():
	close_shop()
	await get_tree().get_root().ready
	
func _process(delta):
	if robots == null:
		robots = get_node("/root/world/robots")
	if main_hub == null:
		main_hub = get_node("/root/world/MainHub")
		
	if visible and not disable_override:
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
	#if visible:
		#plantedUpkeepLabel.text = "Upkeep	    " + str()
	pass

func _disable_all_buttons():
	disable_override = true
	planterButton.disabled = true
	harvesterButton.disabled = true
	collectorButton.disabled = true
	
func _enable_all_buttons():
	disable_override = false
	planterButton.disabled = false
	harvesterButton.disabled = false
	collectorButton.disabled = false


func _on_planter_buy_button_pressed():
	Global.potatoCount -= planterPrice["potato"]
	Global.scrapCount -= planterPrice["scrap"]
	var planter = planter_scene.instantiate()
	var planter_ai = planter_ai_scene.instantiate()
	planter.idle_area = main_hub
	planter.add_child(planter_ai)
	#planter.position = global_position + Vector2(randi_range(-3, 3), randi_range(-3, 3))
	robots.add_child(planter)
	timer.start()
	_disable_all_buttons()


func _on_harvester_buy_button_pressed():
	var harvester = harvester_scene.instantiate()
	var harvester_ai = harvester_ai_scene.instantiate()
	harvester.idle_area = main_hub
	harvester.add_child(harvester_ai)
	#harvester.position = global_position + Vector2(randi_range(-3, 3), randi_range(-3, 3))
	robots.add_child(harvester)
	Global.potatoCount -= harvesterPrice["potato"]
	Global.scrapCount -= harvesterPrice["scrap"]
	timer.start()
	_disable_all_buttons()


func _on_collector_buy_button_pressed():
	pass # Replace with function body.


func _on_buy_timer_timeout():
	_enable_all_buttons()


func _on_close_button_pressed():
	close_shop()
