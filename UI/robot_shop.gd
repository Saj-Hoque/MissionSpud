extends CanvasLayer

@onready var robots = get_node("/root/world/robots")
@onready var main_hub = get_node("/root/world/MainHub")
var planter_scene = preload("res://Robots/Planter/planter.tscn")
var planter_ai_scene = preload("res://ai/Behavior_Trees/planter_ai.tscn")
var harvester_scene = preload("res://Robots/Harvester/harvester.tscn")
var harvester_ai_scene = preload("res://ai/Behavior_Trees/harvester_ai.tscn")

@onready var timer = $buyTimer

@onready var planterButton = $Panel/BUY/HBoxContainer/Planter/planterBuyButton
@onready var planterUpkeepLabel = $Panel/BUY/HBoxContainer/Planter/upkeep/upkeepLabel
@onready var planterPotatoLabel = $Panel/BUY/HBoxContainer/Planter/Price/potatoPrice
@onready var planterScrapLabel = $Panel/BUY/HBoxContainer/Planter/Price/scrapPrice

@onready var harvesterButton = $Panel/BUY/HBoxContainer/Harvester/harvesterBuyButton
@onready var harvesterUpkeepLabel = $Panel/BUY/HBoxContainer/Harvester/upkeep/upkeepLabel
@onready var harvesterPotatoLabel = $Panel/BUY/HBoxContainer/Harvester/Price/potatoPrice
@onready var harvesterScrapLabel = $Panel/BUY/HBoxContainer/Harvester/Price/scrapPrice

@onready var collectorButton = $Panel/BUY/HBoxContainer/Collector/collectorBuyButton
@onready var collectorUpkeepLabel = $Panel/BUY/HBoxContainer/Collector/upkeep/upkeepLabel
@onready var collectorPotatoLabel = $Panel/BUY/HBoxContainer/Collector/Price/potatoPrice
@onready var collectorScrapLabel = $Panel/BUY/HBoxContainer/Collector/Price/scrapPrice


var planterPrice = { "potato" : 20,
					 "scrap"  : 20 }
var planterUpkeep = 5


var harvesterPrice = { "potato" : 20,
					   "scrap"  : 20 }
var harvesterUpkeep = 5


var collectorPrice = { "potato" : 20,
					   "scrap"  : 20 }
var collectorUpkeep = 5


var disable_override = false

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
	_update()
	
func close_shop():
	visible = false

func update_prices():
	pass

func _update_robot_details(price, potatoLabel, scrapLabel, upkeep, upkeepLabel):
	potatoLabel.text = str(price["potato"])
	scrapLabel.text = str(price["scrap"])
	upkeepLabel.text = "Upkeep	    " + str(upkeep)

func _update():
	_update_robot_details(planterPrice, planterPotatoLabel, planterScrapLabel, planterUpkeep, planterUpkeepLabel)
	_update_robot_details(harvesterPrice, harvesterPotatoLabel, harvesterScrapLabel, harvesterUpkeep, harvesterUpkeepLabel)
	_update_robot_details(collectorPrice, collectorPotatoLabel, collectorScrapLabel, collectorUpkeep, collectorUpkeepLabel)

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

func _buy_robot(price, scene, ai_scene):
	Global.potatoCount -= price["potato"]
	Global.scrapCount -= price["scrap"]
	var robot = scene.instantiate()
	var robot_ai = ai_scene.instantiate()
	robot.idle_area = main_hub
	robot.add_child(robot_ai)
	#robot.position = global_position + Vector2(randi_range(-3, 3), randi_range(-3, 3))
	robots.add_child(robot)
	timer.start()
	_disable_all_buttons()


func _on_planter_buy_button_pressed():
	_buy_robot(planterPrice, planter_scene, planter_ai_scene)


func _on_harvester_buy_button_pressed():
	_buy_robot(harvesterPrice, harvester_scene, harvester_ai_scene)


func _on_collector_buy_button_pressed():
	pass # Replace with function body.


func _on_buy_timer_timeout():
	_enable_all_buttons()


func _on_close_button_pressed():
	close_shop()
