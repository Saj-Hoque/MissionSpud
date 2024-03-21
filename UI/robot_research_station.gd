extends CanvasLayer

@onready var all_robots = get_tree().get_nodes_in_group("robots")

var greenStyleBox = load("res://UI/green_style_box_flat.tres")

@onready var totalUpkeep = $totalUpkeep

@onready var planterCurrentUpkeep = $Panel/BUY/robots/Planter/Name/currentUpkeep
@onready var planterSpeedButton = $Panel/BUY/robots/Planter/Speed/label_and_build/planterSpeedButton
@onready var planterSpeedLevel1 = $Panel/BUY/robots/Planter/Speed/label_and_build/box/level1
@onready var planterSpeedLevel2 = $Panel/BUY/robots/Planter/Speed/label_and_build/box/level2
@onready var planterSpeedLevel3 = $Panel/BUY/robots/Planter/Speed/label_and_build/box/level3
@onready var planterSpeedPotatoPrice = $Panel/BUY/robots/Planter/Speed/price_and_upkeep/Price/potatoPrice
@onready var planterSpeedScrapPrice = $Panel/BUY/robots/Planter/Speed/price_and_upkeep/Price/scrapPrice
@onready var planterSpeedImprovementLabel = $Panel/BUY/robots/Planter/Speed/description/improvement
@onready var planterSpeedUpkeepLabel = $Panel/BUY/robots/Planter/Speed/price_and_upkeep/upkeep/upkeepLabel
@onready var planterSpeedResources = $Panel/BUY/robots/Planter/Speed/price_and_upkeep

@onready var planterProductivityButton = $Panel/BUY/robots/Planter/Productivity/label_and_build/planterProductivityButton
@onready var planterProductivityLevel1 = $Panel/BUY/robots/Planter/Productivity/label_and_build/box/level1
@onready var planterProductivityLevel2 = $Panel/BUY/robots/Planter/Productivity/label_and_build/box/level2
@onready var planterProductivityLevel3 = $Panel/BUY/robots/Planter/Productivity/label_and_build/box/level3
@onready var planterProductivityPotatoPrice = $Panel/BUY/robots/Planter/Productivity/price_and_upkeep/Price/potatoPrice
@onready var planterProductivityScrapPrice = $Panel/BUY/robots/Planter/Productivity/price_and_upkeep/Price/scrapPrice
@onready var planterProductivityImprovementLabel = $Panel/BUY/robots/Planter/Productivity/description/improvement
@onready var planterProductivityUpkeepLabel = $Panel/BUY/robots/Planter/Productivity/price_and_upkeep/upkeep/upkeepLabel
@onready var planterProductivityResources = $Panel/BUY/robots/Planter/Productivity/price_and_upkeep

@onready var planterPowerButton = $Panel/BUY/robots/Planter/Power_Efficiency/label_and_build/planterPowerButton
@onready var planterPowerLevel1 = $Panel/BUY/robots/Planter/Power_Efficiency/label_and_build/box/level1
@onready var planterPowerLevel2 = $Panel/BUY/robots/Planter/Power_Efficiency/label_and_build/box/level2
@onready var planterPowerLevel3 = $Panel/BUY/robots/Planter/Power_Efficiency/label_and_build/box/level3
@onready var planterPowerPotatoPrice = $Panel/BUY/robots/Planter/Power_Efficiency/price_and_upkeep/Price/potatoPrice
@onready var planterPowerScrapPrice = $Panel/BUY/robots/Planter/Power_Efficiency/price_and_upkeep/Price/scrapPrice
@onready var planterPowerImprovementLabel = $Panel/BUY/robots/Planter/Power_Efficiency/description/improvement
@onready var planterPowerUpkeepLabel = $Panel/BUY/robots/Planter/Power_Efficiency/price_and_upkeep/upkeep/upkeepLabel
@onready var planterPowerResources = $Panel/BUY/robots/Planter/Power_Efficiency/price_and_upkeep




@onready var harvesterCurrentUpkeep = $Panel/BUY/robots/Harvester/Name/currentUpkeep
@onready var harvesterSpeedButton = $Panel/BUY/robots/Harvester/Speed/label_and_build/harvesterSpeedButton
@onready var harvesterSpeedLevel1 = $Panel/BUY/robots/Harvester/Speed/label_and_build/box/level1
@onready var harvesterSpeedLevel2 = $Panel/BUY/robots/Harvester/Speed/label_and_build/box/level2
@onready var harvesterSpeedLevel3 = $Panel/BUY/robots/Harvester/Speed/label_and_build/box/level3
@onready var harvesterSpeedPotatoPrice = $Panel/BUY/robots/Harvester/Speed/price_and_upkeep/Price/potatoPrice
@onready var harvesterSpeedScrapPrice = $Panel/BUY/robots/Harvester/Speed/price_and_upkeep/Price/scrapPrice
@onready var harvesterSpeedImprovementLabel = $Panel/BUY/robots/Harvester/Speed/description/improvement
@onready var harvesterSpeedUpkeepLabel = $Panel/BUY/robots/Harvester/Speed/price_and_upkeep/upkeep/upkeepLabel
@onready var harvesterSpeedResources = $Panel/BUY/robots/Harvester/Speed/price_and_upkeep

@onready var harvesterProductivityButton = $Panel/BUY/robots/Harvester/Productivity/label_and_build/harvesterProductivityButton
@onready var harvesterProductivityLevel1 = $Panel/BUY/robots/Harvester/Productivity/label_and_build/box/level1
@onready var harvesterProductivityLevel2 = $Panel/BUY/robots/Harvester/Productivity/label_and_build/box/level2
@onready var harvesterProductivityLevel3 = $Panel/BUY/robots/Harvester/Productivity/label_and_build/box/level3
@onready var harvesterProductivityPotatoPrice = $Panel/BUY/robots/Harvester/Productivity/price_and_upkeep/Price/potatoPrice
@onready var harvesterProductivityScrapPrice = $Panel/BUY/robots/Harvester/Productivity/price_and_upkeep/Price/scrapPrice
@onready var harvesterProductivityImprovementLabel = $Panel/BUY/robots/Harvester/Productivity/description/improvement
@onready var harvesterProductivityUpkeepLabel = $Panel/BUY/robots/Harvester/Productivity/price_and_upkeep/upkeep/upkeepLabel
@onready var harvesterProductivityResources = $Panel/BUY/robots/Harvester/Productivity/price_and_upkeep

@onready var harvesterPowerButton = $Panel/BUY/robots/Harvester/Power_Efficiency/label_and_build/harvesterPowerButton
@onready var harvesterPowerLevel1 = $Panel/BUY/robots/Harvester/Power_Efficiency/label_and_build/box/level1
@onready var harvesterPowerLevel2 = $Panel/BUY/robots/Harvester/Power_Efficiency/label_and_build/box/level2
@onready var harvesterPowerLevel3 = $Panel/BUY/robots/Harvester/Power_Efficiency/label_and_build/box/level3
@onready var harvesterPowerPotatoPrice = $Panel/BUY/robots/Harvester/Power_Efficiency/price_and_upkeep/Price/potatoPrice
@onready var harvesterPowerScrapPrice = $Panel/BUY/robots/Harvester/Power_Efficiency/price_and_upkeep/Price/scrapPrice
@onready var harvesterPowerImprovementLabel = $Panel/BUY/robots/Harvester/Power_Efficiency/description/improvement
@onready var harvesterPowerUpkeepLabel = $Panel/BUY/robots/Harvester/Power_Efficiency/price_and_upkeep/upkeep/upkeepLabel
@onready var harvesterPowerResources = $Panel/BUY/robots/Harvester/Power_Efficiency/price_and_upkeep


@onready var collectorButton = $Panel/BUY/HBoxContainer/Collector/collectorBuyButton

var planterSpeedLevel = 0
var planterSpeedPrice = { 0 : {"potato" : 40,
							   "scrap"  : 40 },
						  1 : {"potato" : 160,
							   "scrap"  : 160 },
						  2 : {"potato" : 500,
							   "scrap"  : 500 }
						}
var planterSpeedImprovementPrompt = "Enhance robots mobility.    "
var planterSpeedImprovements = { 0 : "30   ->   40 m/s",
								 1 : "40   ->   50 m/s",
								 2 : "50   ->   60 m/s",
								 3 : "60 m/s"
							   }
var planterSpeedImprovementValues = { 0 : 30,
							   		  1 : 40,
							   		  2 : 50,
							   		  3 : 60	
									}
var planterSpeedUpkeep = { 0 : "Upkeep	    +3",
						   1 : "Upkeep	    +6",
						   2 : "Upkeep	    +10"
						 }
var planterSpeedUpkeepValues = { 0 : 3,
								 1 : 6, 
								 2 : 10
							   }

var planterProductivityLevel = 0
var planterProductivityPrice = { 0 : {"potato" : 40,
							   		  "scrap"  : 40 },
						  		 1 : {"potato" : 160,
							   		  "scrap"  : 160 },
						  		 2 : {"potato" : 500,
									  "scrap"  : 500 }
							   }
var planterProductivityImprovementPrompt = "Reduce potato planting time.    "
var planterProductivityImprovements = { 0 : "10   ->   5 s",
								 		1 : "5   ->   2.5 s",
								 		2 : "2.5   ->   1 s",
								 		3 : "1 s"
							   		  }
var planterProductivityImprovementValues = { 0 : 10,
							   		  		 1 : 5,
							   		  		 2 : 2.5,
							   		  		 3 : 1
										   }
var planterProductivityUpkeep = { 0 : "Upkeep	    +3",
						   		  1 : "Upkeep	    +6",
								  2 : "Upkeep	    +10"
								}
var planterProductivityUpkeepValues = { 0 : 3,
										1 : 6, 
										2 : 10
									  }
									
var planterPowerLevel = 0
var planterPowerPrice = { 0 : {"potato" : 40,
							   "scrap"  : 40 },
						  1 : {"potato" : 160,
							   "scrap"  : 160 },
						  2 : {"potato" : 500,
							   "scrap"  : 500 }
						}
var planterPowerImprovementPrompt = "Optimize power usage. Reduce upkeep by up to "
var planterPowerImprovements = { 0 : "5 per robot",
								 1 : "8 per robot",
								 2 : "13 per robot",
								 3 : "Up to -26 per robot"
							   }
var planterPowerUpkeep = { 0 : "Upkeep	    -5",
						   1 : "Upkeep	    -8",
						   2 : "Upkeep	    -13"
						 }
var planterPowerUpkeepValues = { 0 : -5,
								 1 : -8, 
								 2 : -13
							   }

var harvesterSpeedLevel = 0
var harvesterSpeedPrice = { 0 : {"potato" : 40,
							   "scrap"  : 40 },
						  1 : {"potato" : 160,
							   "scrap"  : 160 },
						  2 : {"potato" : 500,
							   "scrap"  : 500 }
						}
var harvesterSpeedImprovementPrompt = "Enhance robots mobility.    "
var harvesterSpeedImprovements = { 0 : "30   ->   40 m/s",
								 1 : "40   ->   50 m/s",
								 2 : "50   ->   60 m/s",
								 3 : "60 m/s"
							   }
var harvesterSpeedImprovementValues = { 0 : 30,
							   		  1 : 40,
							   		  2 : 50,
							   		  3 : 60	
									}
var harvesterSpeedUpkeep = { 0 : "Upkeep	    +3",
						   1 : "Upkeep	    +6",
						   2 : "Upkeep	    +10"
						 }
var harvesterSpeedUpkeepValues = { 0 : 3,
								 1 : 6, 
								 2 : 10
							   }

var harvesterProductivityLevel = 0
var harvesterProductivityPrice = { 0 : {"potato" : 40,
							   		  "scrap"  : 40 },
						  		 1 : {"potato" : 160,
							   		  "scrap"  : 160 },
						  		 2 : {"potato" : 500,
									  "scrap"  : 500 }
							   }
var harvesterProductivityImprovementPrompt = "Reduce potato harvesting time.    "
var harvesterProductivityImprovements = { 0 : "10   ->   5 s",
								 		1 : "5   ->   2.5 s",
								 		2 : "2.5   ->   1 s",
								 		3 : "1 s"
							   		  }
var harvesterProductivityImprovementValues = { 0 : 10,
							   		  		 1 : 5,
							   		  		 2 : 2.5,
							   		  		 3 : 1
										   }
var harvesterProductivityUpkeep = { 0 : "Upkeep	    +3",
						   		  1 : "Upkeep	    +6",
								  2 : "Upkeep	    +10"
								}
var harvesterProductivityUpkeepValues = { 0 : 3,
										1 : 6, 
										2 : 10
									  }
									
var harvesterPowerLevel = 0
var harvesterPowerPrice = { 0 : {"potato" : 40,
							   "scrap"  : 40 },
						  1 : {"potato" : 160,
							   "scrap"  : 160 },
						  2 : {"potato" : 500,
							   "scrap"  : 500 }
						}
var harvesterPowerImprovementPrompt = "Optimize power usage. Reduce upkeep by up to "
var harvesterPowerImprovements = { 0 : "5 per robot",
								 1 : "8 per robot",
								 2 : "13 per robot",
								 3 : "Up to -26 per robot"
							   }
var harvesterPowerUpkeep = { 0 : "Upkeep	    -5",
						   1 : "Upkeep	    -8",
						   2 : "Upkeep	    -13"
						 }
var harvesterPowerUpkeepValues = { 0 : -5,
								 1 : -8, 
								 2 : -13
							   }



func _ready():
	close_shop()
	await get_tree().get_root().ready
	
func open_shop():
	visible = true
	_update()
	
func close_shop():
	visible = false

func _on_close_button_pressed():
	close_shop()
	
	
	
func _check_if_enough(level, prices, button):
	if level < 3:
		if Global.potatoCount >= prices[level]["potato"] and Global.scrapCount >= prices[level]["scrap"]:
			button.disabled = false
		else:
			button.disabled = true	
	
func _process(delta):
	if all_robots == []:
		all_robots = get_tree().get_nodes_in_group("robots")
		recalibrate_robot_upkeep()
		
	if visible:
		_check_if_enough(planterSpeedLevel, planterSpeedPrice, planterSpeedButton)
		_check_if_enough(planterProductivityLevel, planterProductivityPrice, planterProductivityButton)
		_check_if_enough(planterPowerLevel, planterPowerPrice, planterPowerButton)
		
		_check_if_enough(harvesterSpeedLevel, harvesterSpeedPrice, harvesterSpeedButton)
		_check_if_enough(harvesterProductivityLevel, harvesterProductivityPrice, harvesterProductivityButton)
		_check_if_enough(harvesterPowerLevel, harvesterPowerPrice, harvesterPowerButton)
		

func _update_values(prices, level, potatoPrice, scrapPrice, improvementPrompt, impovementLabel, improvement, upkeepLabel, upkeep):
	if level < 3:
		potatoPrice.text = str(prices[level]["potato"])
		scrapPrice.text = str(prices[level]["scrap"])
		impovementLabel.text = improvementPrompt + improvement[level]
		upkeepLabel.text = upkeep[level]
		

func _update():
	_update_values(planterSpeedPrice, planterSpeedLevel, planterSpeedPotatoPrice, planterSpeedScrapPrice, planterSpeedImprovementPrompt, planterSpeedImprovementLabel, planterSpeedImprovements, planterSpeedUpkeepLabel, planterSpeedUpkeep)
	_update_values(planterProductivityPrice, planterProductivityLevel, planterProductivityPotatoPrice, planterProductivityScrapPrice, planterProductivityImprovementPrompt, planterProductivityImprovementLabel, planterProductivityImprovements, planterProductivityUpkeepLabel, planterProductivityUpkeep)
	_update_values(planterPowerPrice, planterPowerLevel, planterPowerPotatoPrice, planterPowerScrapPrice, planterPowerImprovementPrompt, planterPowerImprovementLabel, planterPowerImprovements, planterPowerUpkeepLabel, planterPowerUpkeep)
	
	_update_values(harvesterSpeedPrice, harvesterSpeedLevel, harvesterSpeedPotatoPrice, harvesterSpeedScrapPrice, harvesterSpeedImprovementPrompt, harvesterSpeedImprovementLabel, harvesterSpeedImprovements, harvesterSpeedUpkeepLabel, harvesterSpeedUpkeep)
	_update_values(harvesterProductivityPrice, harvesterProductivityLevel, harvesterProductivityPotatoPrice, harvesterProductivityScrapPrice, harvesterProductivityImprovementPrompt, harvesterProductivityImprovementLabel, harvesterProductivityImprovements, harvesterProductivityUpkeepLabel, harvesterProductivityUpkeep)
	_update_values(harvesterPowerPrice, harvesterPowerLevel, harvesterPowerPotatoPrice, harvesterPowerScrapPrice, harvesterPowerImprovementPrompt, harvesterPowerImprovementLabel, harvesterPowerImprovements, harvesterPowerUpkeepLabel, harvesterPowerUpkeep)

func _update_global_values(robot_type, prices, level):
	Global.potatoCount -= prices[level]["potato"]
	Global.scrapCount -= prices[level]["scrap"]
	recalibrate_robot_upkeep()
	level += 1
	return level

func _update_to_new_button_values(robots, level, upkeep, upkeepValues, upkeepLabel, improvements, improvementLabel, button, resources, levelBox):

	if level < 3:
		_update()
		_refresh_upkeep(robots, upkeepValues, level)
	else:
		totalUpkeep.visible = false
		upkeepLabel.visible = false
		improvementLabel.text = improvements[level]
		button.text = "Maxed out"
		button.disabled = true
		resources.visible = false
	
	levelBox.add_theme_stylebox_override("normal", greenStyleBox)

func _refresh_upkeep(robots, upkeepValues, level):
	var no_change = false
	var upkeep = Global.upkeep + Global.robot_upkeep
	for robot in robots:
		if robot.upkeep <= 0 and upkeepValues[level] < 0:
			no_change = true
			break
		elif robot.upkeep <= 0 and (robot.upkeep + upkeepValues[level]) <= 0:
			no_change = true
			break
		elif robot.upkeep < 0:
			upkeep += robot.upkeep + upkeepValues[level]
		elif (robot.upkeep + upkeepValues[level]) < 0:
			upkeep -= robot.upkeep
		else:
			upkeep += upkeepValues[level]
	
	if not no_change and upkeep <= 0:
		upkeep = Global.upkeep + Global.robot_upkeep
	
	
	totalUpkeep.text = "Upkeep:\n" + str(Global.upkeep + Global.robot_upkeep) + "   ->   " + str(upkeep)
	
func _refresh_upkeep_button(robots, button, upkeepValues, level):
	if not button.disabled:
		totalUpkeep.global_position = button.global_position + button.size + Vector2(10, -60)
		_refresh_upkeep(robots, upkeepValues, level)
		totalUpkeep.visible = true

func recalibrate_robot_upkeep():
	all_robots = get_tree().get_nodes_in_group("robots")
	Global.robot_upkeep = 0
	for robot in all_robots:
		var upkeep = 0 if robot.upkeep < 0 else robot.upkeep
		Global.robot_upkeep += upkeep
	update_current_upkeep_label()

func update_current_upkeep_label():
	planterCurrentUpkeep.text = "+0 (" + str(Global.planterUpkeep) + ")" if Global.planterUpkeep < 0 else "+" + str(Global.planterUpkeep)
	harvesterCurrentUpkeep.text = "+0 (" + str(Global.harvesterUpkeep) + ")" if Global.harvesterUpkeep < 0 else "+" + str(Global.harvesterUpkeep)
	
func update_robot_upkeep(robots, upkeepValues, level):
	var upkeep = upkeepValues[level]
	for robot in robots:
		robot.upkeep += upkeep
	return upkeep
	
func update_robot_speed(robots, improvementValues, level):
	var speed = improvementValues[level]
	for robot in robots:
		robot.speed = speed
	return speed

func update_robot_productivity(robots, improvementValues, level):
	var productivity = improvementValues[level]
	for robot in robots:
		robot.productivity = productivity
		robot.timer.wait_time = productivity
	return productivity

func list_of_robot_type(type):
	all_robots = get_tree().get_nodes_in_group("robots")
	var robots = []
	for robot in all_robots:
		if is_instance_of(robot, type):
			robots.append(robot)
	return robots

func _on_planter_speed_button_pressed():
	var planters = list_of_robot_type(planter_robot)
	Global.planterUpkeep += update_robot_upkeep(planters, planterSpeedUpkeepValues, planterSpeedLevel)
	planterSpeedLevel = _update_global_values("planter", planterSpeedPrice, planterSpeedLevel)
	Global.planterSpeed = update_robot_speed(planters, planterSpeedImprovementValues, planterSpeedLevel)
	
	var levelBox
	if planterSpeedLevel == 1:
		levelBox = planterSpeedLevel1
	elif planterSpeedLevel == 2:
		levelBox = planterSpeedLevel2
	elif planterSpeedLevel == 3:
		levelBox = planterSpeedLevel3
		
	_update_to_new_button_values(planters, planterSpeedLevel, planterSpeedUpkeep, planterSpeedUpkeepValues, planterSpeedUpkeepLabel, planterSpeedImprovements, planterSpeedImprovementLabel, planterSpeedButton, planterSpeedResources, levelBox)

func _on_planter_speed_button_mouse_entered():
	var planters = list_of_robot_type(planter_robot)
	_refresh_upkeep_button(planters, planterSpeedButton, planterSpeedUpkeepValues, planterSpeedLevel)

func _on_planter_speed_button_mouse_exited():
	totalUpkeep.visible = false


func _on_planter_productivity_button_pressed():
	var planters = list_of_robot_type(planter_robot)
	Global.planterUpkeep += update_robot_upkeep(planters, planterProductivityUpkeepValues, planterProductivityLevel)
	planterProductivityLevel = _update_global_values("planter", planterProductivityPrice, planterProductivityLevel)
	Global.planterProductivity = update_robot_productivity(planters, planterProductivityImprovementValues, planterProductivityLevel)
	
	var levelBox
	if planterProductivityLevel == 1:
		levelBox = planterProductivityLevel1
	elif planterProductivityLevel == 2:
		levelBox = planterProductivityLevel2
	elif planterProductivityLevel == 3:
		levelBox = planterProductivityLevel3
		
	_update_to_new_button_values(planters, planterProductivityLevel, planterProductivityUpkeep, planterProductivityUpkeepValues, planterProductivityUpkeepLabel, planterProductivityImprovements, planterProductivityImprovementLabel, planterProductivityButton, planterProductivityResources, levelBox)


func _on_planter_productivity_button_mouse_entered():
	var planters = list_of_robot_type(planter_robot)
	_refresh_upkeep_button(planters, planterProductivityButton, planterProductivityUpkeepValues, planterProductivityLevel)

func _on_planter_productivity_button_mouse_exited():
	totalUpkeep.visible = false


func _on_planter_power_button_pressed():
	var planters = list_of_robot_type(planter_robot)
	Global.planterUpkeep += update_robot_upkeep(planters, planterPowerUpkeepValues, planterPowerLevel)
	planterPowerLevel = _update_global_values("planter", planterPowerPrice, planterPowerLevel)
	
	var levelBox
	if planterPowerLevel == 1:
		levelBox = planterPowerLevel1
	elif planterPowerLevel == 2:
		levelBox = planterPowerLevel2
	elif planterPowerLevel == 3:
		levelBox = planterPowerLevel3
		
	_update_to_new_button_values(planters, planterPowerLevel, planterPowerUpkeep, planterPowerUpkeepValues, planterPowerUpkeepLabel, planterPowerImprovements, planterPowerImprovementLabel, planterPowerButton, planterPowerResources, levelBox)

func _on_planter_power_button_mouse_entered():
	var planters = list_of_robot_type(planter_robot)
	_refresh_upkeep_button(planters, planterPowerButton, planterPowerUpkeepValues, planterPowerLevel)

func _on_planter_power_button_mouse_exited():
	totalUpkeep.visible = false


func _on_harvester_speed_button_pressed():
	var harvesters = list_of_robot_type(harvester_robot)
	Global.harvesterUpkeep += update_robot_upkeep(harvesters, harvesterSpeedUpkeepValues, harvesterSpeedLevel)
	harvesterSpeedLevel = _update_global_values("harvester", harvesterSpeedPrice, harvesterSpeedLevel)
	Global.harvesterSpeed = update_robot_speed(harvesters, harvesterSpeedImprovementValues, harvesterSpeedLevel)
	
	var levelBox
	if harvesterSpeedLevel == 1:
		levelBox = harvesterSpeedLevel1
	elif harvesterSpeedLevel == 2:
		levelBox = harvesterSpeedLevel2
	elif harvesterSpeedLevel == 3:
		levelBox = harvesterSpeedLevel3
		
	_update_to_new_button_values(harvesters, harvesterSpeedLevel, harvesterSpeedUpkeep, harvesterSpeedUpkeepValues, harvesterSpeedUpkeepLabel, harvesterSpeedImprovements, harvesterSpeedImprovementLabel, harvesterSpeedButton, harvesterSpeedResources, levelBox)


func _on_harvester_speed_button_mouse_entered():
	var harvesters = list_of_robot_type(harvester_robot)
	_refresh_upkeep_button(harvesters, harvesterSpeedButton, harvesterSpeedUpkeepValues, harvesterSpeedLevel)


func _on_harvester_speed_button_mouse_exited():
	totalUpkeep.visible = false


func _on_harvester_productivity_button_pressed():
	var harvesters = list_of_robot_type(harvester_robot)
	Global.harvesterUpkeep += update_robot_upkeep(harvesters, harvesterProductivityUpkeepValues, harvesterProductivityLevel)
	harvesterProductivityLevel = _update_global_values("harvester", harvesterProductivityPrice, harvesterProductivityLevel)
	Global.harvesterProductivity = update_robot_productivity(harvesters, harvesterProductivityImprovementValues, harvesterProductivityLevel)
	
	var levelBox
	if harvesterProductivityLevel == 1:
		levelBox = harvesterProductivityLevel1
	elif harvesterProductivityLevel == 2:
		levelBox = harvesterProductivityLevel2
	elif harvesterProductivityLevel == 3:
		levelBox = harvesterProductivityLevel3
		
	_update_to_new_button_values(harvesters, harvesterProductivityLevel, harvesterProductivityUpkeep, harvesterProductivityUpkeepValues, harvesterProductivityUpkeepLabel, harvesterProductivityImprovements, harvesterProductivityImprovementLabel, harvesterProductivityButton, harvesterProductivityResources, levelBox)



func _on_harvester_productivity_button_mouse_entered():
	var harvesters = list_of_robot_type(harvester_robot)
	_refresh_upkeep_button(harvesters, harvesterProductivityButton, harvesterProductivityUpkeepValues, harvesterProductivityLevel)


func _on_harvester_productivity_button_mouse_exited():
	totalUpkeep.visible = false


func _on_harvester_power_button_pressed():
	var harvesters = list_of_robot_type(harvester_robot)
	Global.harvesterUpkeep += update_robot_upkeep(harvesters, harvesterPowerUpkeepValues, harvesterPowerLevel)
	harvesterPowerLevel = _update_global_values("harvester", harvesterPowerPrice, harvesterPowerLevel)
	
	var levelBox
	if harvesterPowerLevel == 1:
		levelBox = harvesterPowerLevel1
	elif harvesterPowerLevel == 2:
		levelBox = harvesterPowerLevel2
	elif harvesterPowerLevel == 3:
		levelBox = harvesterPowerLevel3
		
	_update_to_new_button_values(harvesters, harvesterPowerLevel, harvesterPowerUpkeep, harvesterPowerUpkeepValues, harvesterPowerUpkeepLabel, harvesterPowerImprovements, harvesterPowerImprovementLabel, harvesterPowerButton, harvesterPowerResources, levelBox)


func _on_harvester_power_button_mouse_entered():
	var harvesters = list_of_robot_type(harvester_robot)
	_refresh_upkeep_button(harvesters, harvesterPowerButton, harvesterPowerUpkeepValues, harvesterPowerLevel)


func _on_harvester_power_button_mouse_exited():
	totalUpkeep.visible = false
