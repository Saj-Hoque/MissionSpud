extends CanvasLayer

@onready var potatoButton = $potatoButton
@onready var scrapButton = $scrapButton
@onready var potatoSection = $potato
@onready var scrapSection = $scrap

@onready var totalUpkeep = $totalUpkeep

@onready var fertilizerButton = $potato/research/fields/Buttons_Price/fertilizer/fertilizerButton
@onready var fertilizerResources = $potato/research/fields/Buttons_Price/fertilizer/Price
@onready var fertilizerPotatoPrice = $potato/research/fields/Buttons_Price/fertilizer/Price/potatoPrice
@onready var fertilizerScrapPrice = $potato/research/fields/Buttons_Price/fertilizer/Price/scrapPrice
@onready var fertilizerImprovementLabel = $potato/research/fields/Description_Improvement/fertilizer/improvement
@onready var fertilizerUpkeepLabel = $potato/research/fields/Buttons_Price/fertilizer/upkeep/upkeepLabel
@onready var fertilizerCurrentUpkeepLabel = $potato/research/fields/Labels/fertilizer/currentUpkeep

@onready var qualityButton = $potato/research/fields/Buttons_Price/quality/qualityButton
@onready var qualityResources = $potato/research/fields/Buttons_Price/quality/Price
@onready var qualityPotatoPrice = $potato/research/fields/Buttons_Price/quality/Price/potatoPrice
@onready var qualityScrapPrice = $potato/research/fields/Buttons_Price/quality/Price/scrapPrice
@onready var qualityImprovementLabel = $potato/research/fields/Description_Improvement/quality/improvement
@onready var qualityUpkeepLabel = $potato/research/fields/Buttons_Price/quality/upkeep/upkeepLabel
@onready var qualityCurrentUpkeepLabel = $potato/research/fields/Labels/quality/currentUpkeep

@onready var growthButton = $potato/research/fields/Buttons_Price/growth/growthButton
@onready var growthResources = $potato/research/fields/Buttons_Price/growth/Price
@onready var growthPotatoPrice = $potato/research/fields/Buttons_Price/growth/Price/potatoPrice
@onready var growthScrapPrice = $potato/research/fields/Buttons_Price/growth/Price/scrapPrice
@onready var growthImprovementLabel = $potato/research/fields/Description_Improvement/growth/improvement
@onready var growthUpkeepLabel = $potato/research/fields/Buttons_Price/growth/upkeep/upkeepLabel
@onready var growthCurrentUpkeepLabel = $potato/research/fields/Labels/growth/currentUpkeep

@onready var boostButton = $scrap/research/fields/Buttons_Price/boost/boostButton
@onready var boostResources = $scrap/research/fields/Buttons_Price/boost/Price
@onready var boostPotatoPrice = $scrap/research/fields/Buttons_Price/boost/Price/potatoPrice
@onready var boostScrapPrice = $scrap/research/fields/Buttons_Price/boost/Price/scrapPrice
@onready var boostImprovementLabel = $scrap/research/fields/Description_Improvement/boost/improvement
@onready var boostUpkeepLabel = $scrap/research/fields/Buttons_Price/boost/upkeep/upkeepLabel
@onready var boostCurrentUpkeepLabel = $scrap/research/fields/Labels/boost/currentUpkeep

@onready var forgeButton = $scrap/research/fields/Buttons_Price/forge/forgeButton
@onready var forgeResources = $scrap/research/fields/Buttons_Price/forge/Price
@onready var forgePotatoPrice = $scrap/research/fields/Buttons_Price/forge/Price/potatoPrice
@onready var forgeScrapPrice = $scrap/research/fields/Buttons_Price/forge/Price/scrapPrice
@onready var forgeImprovementLabel = $scrap/research/fields/Description_Improvement/forge/improvement
@onready var forgeUpkeepLabel = $scrap/research/fields/Buttons_Price/forge/upkeep/upkeepLabel
@onready var forgeCurrentUpkeepLabel = $scrap/research/fields/Labels/forge/currentUpkeep

@onready var turbineButton = $scrap/research/fields/Buttons_Price/turbine/turbineButton
@onready var turbineResources = $scrap/research/fields/Buttons_Price/turbine/Price
@onready var turbinePotatoPrice = $scrap/research/fields/Buttons_Price/turbine/Price/potatoPrice
@onready var turbineScrapPrice = $scrap/research/fields/Buttons_Price/turbine/Price/scrapPrice
@onready var turbineImprovementLabel = $scrap/research/fields/Description_Improvement/turbine/improvement
@onready var turbineUpkeepLabel = $scrap/research/fields/Buttons_Price/turbine/upkeep/upkeepLabel
@onready var turbineCurrentUpkeepLabel = $scrap/research/fields/Labels/turbine/currentUpkeep

var fertilizerLevel = 0
var fertilizerPrice = { 0 : {"potato" : 50,
							 "scrap"  : 50 },
						1 : {"potato" : 350,
							 "scrap"  : 350 },
						2 : {"potato" : 2500,
							 "scrap"  : 2500 }
					  }
var fertilizerImprovements = { 0 : "x 2   ->   x 4",
							   1 : "x 4   ->   x 8",
							   2 : "x 8   ->   x 16",
							   3 : "x 16"
							 }
var fertilizerImprovementValues = { 0 : 2,
							   		1 : 3,
							   		2 : 4,
							   		3 : 5	
								  }
var fertilizerUpkeep = { 0 : "Upkeep	    +10",
						 1 : "Upkeep	    +70",
						 2 : "Upkeep	    +500"
					   }
var fertilizerUpkeepValues = { 0 : 10,
							   1 : 70, 
							   2 : 500
							 }
var fertilizerCurrentUpkeep = { 0 : "+0",
								1 : "+10", 
								2 : "+70",
								3 : "+500"
							  }


var qualityLevel = 0
var qualityPrice = { 0 : {"potato" : 100,
						  "scrap"  : 100 },
					 1 : {"potato" : 700,
						  "scrap"  : 700 },
					 2 : {"potato" : 3500,
						  "scrap"  : 3500 }
				   }
var qualityImprovements = { 0 : "1   ->   2",
							1 : "2   ->   3",
							2 : "3   ->   4",
							3 : "4"
						  }
var qualityImprovementValues = { 0 : 1,
						   		 1 : 2,
						   		 2 : 3,
						   		 3 : 4	
							   }					
var qualityUpkeep = { 0 : "Upkeep	    +20",
					  1 : "Upkeep	    +140",
					  2 : "Upkeep	    +1000"
					}
var qualityUpkeepValues = { 0 : 20,
							1 : 140, 
							2 : 1000
						  }
var qualityCurrentUpkeep = { 0 : "+0",
							 1 : "+20", 
							 2 : "+140",
							 3 : "+1000"
						   }

var growthLevel = 0
var growthPrice = { 0 : {"potato" : 25,
						 "scrap"  : 25 },
					1 : {"potato" : 175,
						 "scrap"  : 175 },
					2 : {"potato" : 1225,
						 "scrap"  : 1225 }
				  }
var growthImprovements = { 0 : "10s   ->   5s",
						   1 : "5s   ->   2.5s",
						   2 : "2.5s   ->   1.25s",
						   3 : "1.25s"
						 }
var growthImprovementValues = { 0 : 10,				# Divided by 2 because plant growth is 2 sprites
						   		1 : 5,
						   		2 : 2.5,
						   		3 : 1.25	
							  }
var growthUpkeep = { 0 : "Upkeep	    +5",
					 1 : "Upkeep	    +35",
					 2 : "Upkeep	    +245"
				   }
var growthUpkeepValues = { 0 : 5,
						   1 : 35, 
						   2 : 245
						 }
var growthCurrentUpkeep = { 0 : "+0",
							1 : "+5", 
							2 : "+35",
							3 : "+245"
						  }

var boostLevel = 0
var boostPrice = { 0 : {"potato" : 25,
							 "scrap"  : 25 },
						1 : {"potato" : 175,
							 "scrap"  : 175 },
						2 : {"potato" : 1300,
							 "scrap"  : 1300 }
					  }
var boostImprovements = { 0 : "x 1   ->   x 2",
						  1 : "x 2   ->   x 4",
						  2 : "x 4   ->   x 8",
						  3 : "x 8"
						}
var boostImprovementValues = { 0 : 1,
					   		   1 : 2,
					   		   2 : 4,
					   		   3 : 8	
							 }						
var boostUpkeep = { 0 : "Upkeep	    +10",
					1 : "Upkeep	    +70",
					2 : "Upkeep	    +500"
				  }
var boostUpkeepValues = { 0 : 10,
						  1 : 70, 
						  2 : 500
						}
var boostCurrentUpkeep = { 0 : "+0",
						   1 : "+10", 
						   2 : "+70",
						   3 : "+500"
						 }

var forgeLevel = 0
var forgePrice = { 0 : {"potato" : 50,
						"scrap"  : 50 },
				   1 : {"potato" : 350,
						"scrap"  : 350 },
				   2 : {"potato" : 2500,
						"scrap"  : 2500 }
				 }
var forgeImprovements = { 0 : "1   ->   2",
						  1 : "2   ->   4",
						  2 : "4   ->   8",
						  3 : "8"
						  }
var forgeImprovementValues = { 0 : 1,
					   		   1 : 2,
					   		   2 : 4,
					   		   3 : 8	
							 }						
var forgeUpkeep = { 0 : "Upkeep	    +30",
					1 : "Upkeep	    +60",
					2 : "Upkeep	    +120"
				  }
var forgeUpkeepValues = { 0 : 30,
						  1 : 60, 
						  2 : 120
						}
var forgeCurrentUpkeep = { 0 : "+0",
						   1 : "+30", 
						   2 : "+90",
						   3 : "+210"
						 }

var turbineLevel = 0
var turbinePrice = { 0 : {"potato" : 20,
						 "scrap"  : 20 },
					1 : {"potato" : 140,
						 "scrap"  : 140 },
					2 : {"potato" : 1600,
						 "scrap"  : 1600 }
				   }
var turbineImprovements = { 0 : "8s   ->   4s",
							1 : "4s   ->   2s",
							2 : "2s   ->   1s",
							3 : "1s"
						  }
var turbineImprovementValues = { 0 : 8,
						   		 1 : 4,
						   		 2 : 2,
						   		 3 : 1	
							   }						
var turbineUpkeep = { 0 : "Upkeep	    +5",
					  1 : "Upkeep	    +30",
					  2 : "Upkeep	    +190"
					}
var turbineUpkeepValues = { 0 : 5,
							1 : 30, 
							2 : 190
						  }
var turbineCurrentUpkeep = { 0 : "+0",
							 1 : "+5", 
							 2 : "+30",
							 3 : "+190"
						   }


func _ready():
	scrapButton.button_pressed = false
	scrapSection.visible = false
	close_shop()
	await get_tree().get_root().ready
	
func _check_if_enough(level, prices, button):
	if level < 3:
		if Global.potatoCount >= prices[level]["potato"] and Global.scrapCount >= prices[level]["scrap"]:
			button.disabled = false
		else:
			button.disabled = true

func _process(delta):

	if visible:
		_check_if_enough(fertilizerLevel, fertilizerPrice, fertilizerButton)
		_check_if_enough(qualityLevel, qualityPrice, qualityButton)
		_check_if_enough(growthLevel, growthPrice, growthButton)
		_check_if_enough(boostLevel, boostPrice, boostButton)
		_check_if_enough(forgeLevel, forgePrice, forgeButton)
		_check_if_enough(turbineLevel, turbinePrice, turbineButton)



func open_shop():
	visible = true
	_update()
	RobotShop.close_shop()
	RobotResearchStation.close_shop()
	
func close_shop():
	visible = false
	
func _on_close_button_pressed():
	close_shop()
	Global.menu_active = false


func _update_values(prices, level, potatoPrice, scrapPrice, impovementLabel, improvement, upkeepLabel, upkeep, currentUpkeepLabel, currentUpkeep):
	if level < 3:
		potatoPrice.text = str(prices[level]["potato"])
		scrapPrice.text = str(prices[level]["scrap"])
		impovementLabel.text = improvement[level]
		upkeepLabel.text = upkeep[level]
		currentUpkeepLabel.text = currentUpkeep[level]
		

func _update():
	_update_values(fertilizerPrice, fertilizerLevel, fertilizerPotatoPrice, fertilizerScrapPrice, fertilizerImprovementLabel, fertilizerImprovements, fertilizerUpkeepLabel, fertilizerUpkeep, fertilizerCurrentUpkeepLabel, fertilizerCurrentUpkeep)
	_update_values(qualityPrice, qualityLevel, qualityPotatoPrice, qualityScrapPrice, qualityImprovementLabel, qualityImprovements, qualityUpkeepLabel, qualityUpkeep, qualityCurrentUpkeepLabel, qualityCurrentUpkeep)
	_update_values(growthPrice, growthLevel, growthPotatoPrice, growthScrapPrice, growthImprovementLabel, growthImprovements, growthUpkeepLabel, growthUpkeep, growthCurrentUpkeepLabel, growthCurrentUpkeep)
	_update_values(boostPrice, boostLevel, boostPotatoPrice, boostScrapPrice, boostImprovementLabel, boostImprovements, boostUpkeepLabel, boostUpkeep, boostCurrentUpkeepLabel, boostCurrentUpkeep)
	_update_values(forgePrice, forgeLevel, forgePotatoPrice, forgeScrapPrice, forgeImprovementLabel, forgeImprovements, forgeUpkeepLabel, forgeUpkeep, forgeCurrentUpkeepLabel, forgeCurrentUpkeep)
	_update_values(turbinePrice, turbineLevel, turbinePotatoPrice, turbineScrapPrice, turbineImprovementLabel, turbineImprovements, turbineUpkeepLabel, turbineUpkeep, turbineCurrentUpkeepLabel, fertilizerCurrentUpkeep)


func _update_global_values(prices, level, upkeepValues, improvementValues):
	Global.potatoCount -= prices[level]["potato"]
	Global.scrapCount -= prices[level]["scrap"]
	Global.upkeep += upkeepValues[level]
	level += 1
	return level

func _update_to_new_button_values(level, upkeep, upkeepValues, upkeepLabel, improvements, improvementLabel, currentUpkeep, currentUpkeepLabel, button, resources):

	if level < 3:
		_update()
		_refresh_upkeep(upkeepValues, level)
	else:
		totalUpkeep.visible = false
		upkeepLabel.visible = false
		currentUpkeepLabel.text = currentUpkeep[level]
		improvementLabel.text = improvements[level]
		button.text = "Maxed out"
		button.disabled = true
		resources.visible = false

func _on_fertilizer_button_pressed():
	fertilizerLevel = _update_global_values(fertilizerPrice, fertilizerLevel, fertilizerUpkeepValues, fertilizerImprovementValues)
	Global.potatoQuantity = fertilizerImprovementValues[fertilizerLevel]
	_update_to_new_button_values(fertilizerLevel, fertilizerUpkeep, fertilizerUpkeepValues, fertilizerUpkeepLabel, fertilizerImprovements, fertilizerImprovementLabel, fertilizerCurrentUpkeep, fertilizerCurrentUpkeepLabel, fertilizerButton, fertilizerResources)

func _on_quality_button_pressed():
	qualityLevel = _update_global_values(qualityPrice, qualityLevel, qualityUpkeepValues, qualityImprovementValues)
	Global.potatoValue = qualityImprovementValues[qualityLevel]
	_update_to_new_button_values(qualityLevel, qualityUpkeep, qualityUpkeepValues, qualityUpkeepLabel, qualityImprovements, qualityImprovementLabel, qualityCurrentUpkeep, qualityCurrentUpkeepLabel, qualityButton, qualityResources)

func _on_growth_button_pressed():
	growthLevel = _update_global_values(growthPrice, growthLevel, growthUpkeepValues, growthImprovementValues)
	Global.potatoTimer = growthImprovementValues[growthLevel]
	_update_to_new_button_values(growthLevel, growthUpkeep, growthUpkeepValues, growthUpkeepLabel, growthImprovements, growthImprovementLabel, growthCurrentUpkeep, growthCurrentUpkeepLabel, growthButton, growthResources)

func _on_boost_button_pressed():
	boostLevel = _update_global_values(boostPrice, boostLevel, boostUpkeepValues, boostImprovementValues)
	Global.scrapQuantity = boostImprovementValues[boostLevel]
	_update_to_new_button_values(boostLevel, boostUpkeep, boostUpkeepValues, boostUpkeepLabel, boostImprovements, boostImprovementLabel, boostCurrentUpkeep, boostCurrentUpkeepLabel, boostButton, boostResources)

func _on_forge_button_pressed():
	forgeLevel = _update_global_values(forgePrice, forgeLevel, forgeUpkeepValues, forgeImprovementValues)
	Global.scrapValue = forgeImprovementValues[forgeLevel]
	_update_to_new_button_values(forgeLevel, forgeUpkeep, forgeUpkeepValues, forgeUpkeepLabel, forgeImprovements, forgeImprovementLabel, forgeCurrentUpkeep, forgeCurrentUpkeepLabel, forgeButton, forgeResources)

func _on_turbine_button_pressed():
	turbineLevel = _update_global_values(turbinePrice, turbineLevel, turbineUpkeepValues, turbineImprovementValues)
	Global.scrapTimer = turbineImprovementValues[turbineLevel]
	_update_to_new_button_values(turbineLevel, turbineUpkeep, turbineUpkeepValues, turbineUpkeepLabel, turbineImprovements, turbineImprovementLabel, turbineCurrentUpkeep, turbineCurrentUpkeepLabel, turbineButton, turbineResources)

func _on_potato_button_pressed():
	scrapButton.button_pressed = false
	scrapSection.visible = false
	potatoSection.visible = true

func _on_scrap_button_pressed():
	potatoButton.button_pressed = false
	potatoSection.visible = false
	scrapSection.visible = true
	
	

func _refresh_upkeep(upkeepValues, level):
	totalUpkeep.text = "Upkeep:\n" + str(Global.upkeep + Global.robot_upkeep) + "   ->   " + str(Global.upkeep + Global.robot_upkeep + upkeepValues[level])
	
func _refresh_upkeep_button(button, upkeepValues, level):
	if not button.disabled:
		totalUpkeep.global_position = button.global_position + button.size + Vector2(10, -60)
		_refresh_upkeep(upkeepValues, level)
		totalUpkeep.visible = true
		
func _on_fertilizer_button_mouse_entered():
	_refresh_upkeep_button(fertilizerButton, fertilizerUpkeepValues, fertilizerLevel)

func _on_fertilizer_button_mouse_exited():
	totalUpkeep.visible = false
	
func _on_quality_button_mouse_entered():
	_refresh_upkeep_button(qualityButton, qualityUpkeepValues, qualityLevel)

func _on_quality_button_mouse_exited():
	totalUpkeep.visible = false

func _on_growth_button_mouse_entered():
	_refresh_upkeep_button(growthButton, growthUpkeepValues, growthLevel)

func _on_growth_button_mouse_exited():
	totalUpkeep.visible = false

func _on_boost_button_mouse_entered():
	_refresh_upkeep_button(boostButton, boostUpkeepValues, boostLevel)

func _on_boost_button_mouse_exited():
	totalUpkeep.visible = false

func _on_forge_button_mouse_entered():
	_refresh_upkeep_button(forgeButton, forgeUpkeepValues, forgeLevel)

func _on_forge_button_mouse_exited():
	totalUpkeep.visible = false

func _on_turbine_button_mouse_entered():
	_refresh_upkeep_button(turbineButton, turbineUpkeepValues, turbineLevel)

func _on_turbine_button_mouse_exited():
	totalUpkeep.visible = false

func reset_feature(level, button, resources, upkeepLabel):
	level = 0
	button.text = "Research"
	button.disabled = false
	resources.visible = true
	upkeepLabel.visible = true
	return level
	
func reset():
	fertilizerLevel = reset_feature(fertilizerLevel, fertilizerButton, fertilizerResources, fertilizerUpkeepLabel)
	qualityLevel = reset_feature(qualityLevel, qualityButton, qualityResources, qualityUpkeepLabel)
	growthLevel = reset_feature(growthLevel, growthButton, growthResources, growthUpkeepLabel)
	boostLevel = reset_feature(boostLevel, boostButton, boostResources, boostUpkeepLabel)
	forgeLevel = reset_feature(forgeLevel, forgeButton, forgeResources, forgeUpkeepLabel)
	turbineLevel = reset_feature(turbineLevel, turbineButton, turbineResources, turbineUpkeepLabel)
	_update()
