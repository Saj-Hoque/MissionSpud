extends CanvasLayer

@onready var robots = get_node("/root/world/robots")
@onready var main_hub = get_node("/root/world/roomMain/idleArea")
var planter_scene = preload("res://Robots/Planter/planter.tscn")
var planter_ai_scene = preload("res://ai/Behavior_Trees/planter_ai.tscn")
var harvester_scene = preload("res://Robots/Harvester/harvester.tscn")
var harvester_ai_scene = preload("res://ai/Behavior_Trees/harvester_ai.tscn")
var collector_scene = preload("res://Robots/Collector/collector.tscn")
var collector_ai_scene = preload("res://ai/Behavior_Trees/collector_ai.tscn")
var scavenger_scene = preload("res://Robots/Scavenger/scavenger.tscn")
var scavenger_ai_scene = preload("res://ai/Behavior_Trees/scavenger_ai.tscn")

@onready var timer = $buyTimer
@onready var totalUpkeep = $totalUpkeep

@onready var potatoButton = $potatoSwitch/potatoButton
@onready var scrapButton = $scrapSwitch/scrapButton
@onready var potatoSection = $potato
@onready var scrapSection = $scrap

@onready var planterButton = $potato/BUY/robots/Planter/planterBuyButton
@onready var planterUpkeepLabel = $potato/BUY/robots/Planter/upkeep/upkeepLabel
@onready var planterPotatoLabel = $potato/BUY/robots/Planter/Price/potatoPrice
@onready var planterScrapLabel = $potato/BUY/robots/Planter/Price/scrapPrice

@onready var harvesterButton = $potato/BUY/robots/Harvester/harvesterBuyButton
@onready var harvesterUpkeepLabel = $potato/BUY/robots/Harvester/upkeep/upkeepLabel
@onready var harvesterPotatoLabel = $potato/BUY/robots/Harvester/Price/potatoPrice
@onready var harvesterScrapLabel = $potato/BUY/robots/Harvester/Price/scrapPrice

@onready var collectorButton = $potato/BUY/robots/Collector/collectorBuyButton
@onready var collectorUpkeepLabel = $potato/BUY/robots/Collector/upkeep/upkeepLabel
@onready var collectorPotatoLabel = $potato/BUY/robots/Collector/Price/potatoPrice
@onready var collectorScrapLabel = $potato/BUY/robots/Collector/Price/scrapPrice

@onready var scavengerButton = $scrap/BUY/robots/Scavenger/scavengerBuyButton
@onready var scavengerUpkeepLabel = $scrap/BUY/robots/Scavenger/upkeep/upkeepLabel
@onready var scavengerPotatoLabel = $scrap/BUY/robots/Scavenger/Price/potatoPrice
@onready var scavengerScrapLabel = $scrap/BUY/robots/Scavenger/Price/scrapPrice

var planterPrice = { "potato" : 10,
					 "scrap"  : 10 }

var harvesterPrice = { "potato" : 20,
					   "scrap"  : 20 }

var collectorPrice = { "potato" : 100,
					   "scrap"  : 100 }

var scavengerPrice = { "potato" : 5,
					   "scrap"  : 5 }


var disable_override = false

func _ready():
	close_shop()
	await get_tree().get_root().ready

func _process(delta):
	if robots == null:
		robots = get_node("/root/world/robots")
	if main_hub == null:
		main_hub = get_node("/root/world/roomMain/idleArea")
		if main_hub != null:
			main_hub.areaFull.connect(blocked)
			main_hub.areaFree.connect(unblocked)

	if visible and not disable_override:
		_check_if_enough(planterPrice, planterButton)
		_check_if_enough(harvesterPrice, harvesterButton)
		_check_if_enough(collectorPrice, collectorButton)
		
		_check_if_enough(scavengerPrice, scavengerButton)
	
func open_shop():
	visible = true
	_update()
	if potatoSection.visible:
		potatoButton.grab_focus()
	if scrapSection.visible:
		scrapButton.grab_focus()
	RobotResearchStation.close_shop()
	ResourceResearchStation.close_shop()
	
func close_shop():
	visible = false
	
func _check_if_enough(prices, button):
	if Global.potatoCount >= prices["potato"] and Global.scrapCount >= prices["scrap"]:
		button.disabled = false
	else:
		button.disabled = true	
	
func _update_robot_details(price, potatoLabel, scrapLabel, upkeep, upkeepLabel):
	potatoLabel.text = str(price["potato"])
	scrapLabel.text = str(price["scrap"])
	upkeep = 0 if upkeep < 0 else upkeep
	upkeepLabel.text = "Upkeep	    +" + str(upkeep)

func _update():
	_update_robot_details(planterPrice, planterPotatoLabel, planterScrapLabel, Global.planterUpkeep, planterUpkeepLabel)
	_update_robot_details(harvesterPrice, harvesterPotatoLabel, harvesterScrapLabel, Global.harvesterUpkeep, harvesterUpkeepLabel)
	_update_robot_details(collectorPrice, collectorPotatoLabel, collectorScrapLabel, Global.collectorUpkeep, collectorUpkeepLabel)
	
	_update_robot_details(scavengerPrice, scavengerPotatoLabel, scavengerScrapLabel, Global.scavengerUpkeep, scavengerUpkeepLabel)

func blocked():
	_disable_all_buttons()
	disable_override = true

func unblocked():
	_enable_all_buttons()
	disable_override = false

func _disable_all_buttons():
	planterButton.disabled = true
	harvesterButton.disabled = true
	collectorButton.disabled = true
	
	scavengerButton.disabled = true
	
func _enable_all_buttons():
	planterButton.disabled = false
	harvesterButton.disabled = false
	collectorButton.disabled = false
	
	scavengerButton.disabled = false


func _buy_robot(price, scene, ai_scene):
	Global.potatoCount -= price["potato"]
	Global.scrapCount -= price["scrap"]
	var robot = scene.instantiate()
	var robot_ai = ai_scene.instantiate()
	robot.idle_area = main_hub
	robot.add_child(robot_ai)
	#robot.position = global_position + Vector2(randi_range(-3, 3), randi_range(-3, 3))
	robots.add_child(robot)
	var upkeep = 0 if robot.upkeep < 0 else robot.upkeep
	Global.robot_upkeep += upkeep

func _on_close_button_pressed():
	close_shop()
	Global.menu_active = false

func _on_planter_buy_button_pressed():
	_buy_robot(planterPrice, planter_scene, planter_ai_scene)
	_refresh_upkeep_button(planterButton, Global.planterUpkeep)

func _on_harvester_buy_button_pressed():
	_buy_robot(harvesterPrice, harvester_scene, harvester_ai_scene)
	_refresh_upkeep_button(harvesterButton, Global.harvesterUpkeep)

func _on_collector_buy_button_pressed():
	_buy_robot(collectorPrice, collector_scene, collector_ai_scene)
	_refresh_upkeep_button(collectorButton, Global.collectorUpkeep)

func _on_scavenger_buy_button_pressed():
	_buy_robot(scavengerPrice, scavenger_scene, scavenger_ai_scene)
	_refresh_upkeep_button(scavengerButton, Global.scavengerUpkeep)


func _refresh_upkeep(upkeepValue):
	upkeepValue = 0 if upkeepValue < 0 else upkeepValue
	totalUpkeep.text = "Upkeep:\n" + str(Global.upkeep + Global.robot_upkeep) + "   ->   " + str(Global.upkeep + Global.robot_upkeep + upkeepValue)
	
func _refresh_upkeep_button(button, upkeepValue):
	totalUpkeep.global_position = button.global_position + button.size/2 + Vector2(-40, 45)
	_refresh_upkeep(upkeepValue)
	totalUpkeep.visible = true


func _on_planter_buy_button_mouse_entered():
	_refresh_upkeep_button(planterButton, Global.planterUpkeep)

func _on_planter_buy_button_mouse_exited():
	totalUpkeep.visible = false

func _on_harvester_buy_button_mouse_entered():
	_refresh_upkeep_button(harvesterButton, Global.harvesterUpkeep)

func _on_harvester_buy_button_mouse_exited():
	totalUpkeep.visible = false

func _on_collector_buy_button_mouse_entered():
	_refresh_upkeep_button(collectorButton, Global.collectorUpkeep)

func _on_collector_buy_button_mouse_exited():
	totalUpkeep.visible = false

func _on_scavenger_buy_button_mouse_entered():
	_refresh_upkeep_button(scavengerButton, Global.scavengerUpkeep)

func _on_scavenger_buy_button_mouse_exited():
	totalUpkeep.visible = false

func _on_potato_button_pressed():
	scrapButton.button_pressed = false
	scrapSection.visible = false
	potatoSection.visible = true

func _on_scrap_button_pressed():
	potatoButton.button_pressed = false
	potatoSection.visible = false
	scrapSection.visible = true
