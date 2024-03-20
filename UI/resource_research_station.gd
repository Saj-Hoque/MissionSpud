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

@onready var qualityButton = $potato/research/fields/Buttons_Price/quality/qualityButton
@onready var qualityResources = $potato/research/fields/Buttons_Price/quality/Price
@onready var qualityPotatoPrice = $potato/research/fields/Buttons_Price/quality/Price/potatoPrice
@onready var qualityScrapPrice = $potato/research/fields/Buttons_Price/quality/Price/scrapPrice
@onready var qualityImprovementLabel = $potato/research/fields/Description_Improvement/quality/improvement
@onready var qualityUpkeepLabel = $potato/research/fields/Buttons_Price/quality/upkeep/upkeepLabel

@onready var growthButton = $potato/research/fields/Buttons_Price/growth/growthButton
@onready var growthResources = $potato/research/fields/Buttons_Price/growth/Price
@onready var growthPotatoPrice = $potato/research/fields/Buttons_Price/growth/Price/potatoPrice
@onready var growthScrapPrice = $potato/research/fields/Buttons_Price/growth/Price/scrapPrice
@onready var growthImprovementLabel = $potato/research/fields/Description_Improvement/growth/improvement
@onready var growthUpkeepLabel = $potato/research/fields/Buttons_Price/growth/upkeep/upkeepLabel

@onready var boostButton = $scrap/research/fields/Buttons_Price/boost/boostButton
@onready var boostResources = $scrap/research/fields/Buttons_Price/boost/Price
@onready var boostPotatoPrice = $scrap/research/fields/Buttons_Price/boost/Price/potatoPrice
@onready var boostScrapPrice = $scrap/research/fields/Buttons_Price/boost/Price/scrapPrice
@onready var boostImprovementLabel = $scrap/research/fields/Description_Improvement/boost/improvement
@onready var boostUpkeepLabel = $scrap/research/fields/Buttons_Price/boost/upkeep/upkeepLabel

@onready var forgeButton = $scrap/research/fields/Buttons_Price/forge/forgeButton
@onready var forgeResources = $scrap/research/fields/Buttons_Price/forge/Price
@onready var forgePotatoPrice = $scrap/research/fields/Buttons_Price/forge/Price/potatoPrice
@onready var forgeScrapPrice = $scrap/research/fields/Buttons_Price/forge/Price/scrapPrice
@onready var forgeImprovementLabel = $scrap/research/fields/Description_Improvement/forge/improvement
@onready var forgeUpkeepLabel = $scrap/research/fields/Buttons_Price/forge/upkeep/upkeepLabel

@onready var turbineButton = $scrap/research/fields/Buttons_Price/turbine/turbineButton
@onready var turbineResources = $scrap/research/fields/Buttons_Price/turbine/Price
@onready var turbinePotatoPrice = $scrap/research/fields/Buttons_Price/turbine/Price/potatoPrice
@onready var turbineScrapPrice = $scrap/research/fields/Buttons_Price/turbine/Price/scrapPrice
@onready var turbineImprovementLabel = $scrap/research/fields/Description_Improvement/turbine/improvement
@onready var turbineUpkeepLabel = $scrap/research/fields/Buttons_Price/turbine/upkeep/upkeepLabel


var fertilizerLevel = 0
var fertilizerPrice = { 0 : {"potato" : 40,
							 "scrap"  : 40 },
						1 : {"potato" : 160,
							 "scrap"  : 160 },
						2 : {"potato" : 500,
							 "scrap"  : 500 }
					  }
var fertilizerImprovements = { 0 : "x 2   ->   x 4",
							   1 : "x 4   ->   x 8",
							   2 : "x 8   ->   x 16",
							   3 : "x 16"
							 }
var fertilizerImprovementValues = { 0 : 2,
							   		1 : 4,
							   		2 : 8,
							   		3 : 16	
								  }						
							
var fertilizerUpkeep = { 0 : "Upkeep	    0 -> 30",
						 1 : "Upkeep	    30 -> 60",
						 2 : "Upkeep	    60 -> 120",
						 3 : "Upkeep	    120"
					   }
var fertilizerUpkeepValues = { 0 : 0,
							   1 : 30, 
							   2 : 60,
							   3 : 120
							 }


var qualityLevel = 0
var qualityPrice = { 0 : {"potato" : 40,
						  "scrap"  : 40 },
					 1 : {"potato" : 160,
						  "scrap"  : 160 },
					 2 : {"potato" : 500,
						  "scrap"  : 500 }
				   }
var qualityImprovements = { 0 : "1   ->   2",
							1 : "2   ->   4",
							2 : "4   ->   8",
							3 : "8"
						  }
var qualityImprovementValues = { 0 : 1,
						   		 1 : 2,
						   		 2 : 4,
						   		 3 : 8	
							   }					
var qualityUpkeep = { 0 : "Upkeep	    0 -> 30",
					  1 : "Upkeep	    30 -> 60",
					  2 : "Upkeep	    60 -> 120",
					  3 : "Upkeep	    120"
					}
var qualityUpkeepValues = { 0 : 0,
							1 : 30, 
							2 : 60,
							3 : 120
						  }

var growthLevel = 0
var growthPrice = { 0 : {"potato" : 40,
						 "scrap"  : 40 },
					1 : {"potato" : 160,
						 "scrap"  : 160 },
					2 : {"potato" : 500,
						 "scrap"  : 500 }
				  }
var growthImprovements = { 0 : "20s   ->   10s",
						   1 : "10s   ->   5s",
						   2 : "5s   ->   2.5s",
						   3 : "2.5s"
						 }
var growthImprovementValues = { 0 : 10,				# Divided by 2 because plant growth is 2 sprites
						   		1 : 5,
						   		2 : 2.5,
						   		3 : 1.25	
							  }						
var growthUpkeep = { 0 : "Upkeep	    0 -> 30",
					 1 : "Upkeep	    30 -> 60",
					 2 : "Upkeep	    60 -> 120",
					 3 : "Upkeep	    120"
				   }
var growthUpkeepValues = { 0 : 0,
						   1 : 30, 
						   2 : 60,
						   3 : 120
						 }

var boostLevel = 0
var boostPrice = { 0 : {"potato" : 40,
							 "scrap"  : 40 },
						1 : {"potato" : 160,
							 "scrap"  : 160 },
						2 : {"potato" : 500,
							 "scrap"  : 500 }
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
var boostUpkeep = { 0 : "Upkeep	    0 -> 30",
					1 : "Upkeep	    30 -> 60",
					2 : "Upkeep	    60 -> 120",
					3 : "Upkeep	    120"
				  }
var boostUpkeepValues = { 0 : 0,
						  1 : 30, 
						  2 : 60,
						  3 : 120
						}

var forgeLevel = 0
var forgePrice = { 0 : {"potato" : 40,
						"scrap"  : 40 },
				   1 : {"potato" : 160,
						"scrap"  : 160 },
				   2 : {"potato" : 500,
						"scrap"  : 500 }
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
var forgeUpkeep = { 0 : "Upkeep	    0 -> 30",
					1 : "Upkeep	    30 -> 60",
					2 : "Upkeep	    60 -> 120",
					3 : "Upkeep	    120"
				  }
var forgeUpkeepValues = { 0 : 0,
						  1 : 30, 
						  2 : 60,
						  3 : 120
						}

var turbineLevel = 0
var turbinePrice = { 0 : {"potato" : 40,
						 "scrap"  : 40 },
					1 : {"potato" : 160,
						 "scrap"  : 160 },
					2 : {"potato" : 500,
						 "scrap"  : 500 }
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
var turbineUpkeep = { 0 : "Upkeep	    0 -> 30",
					  1 : "Upkeep	    30 -> 60",
					  2 : "Upkeep	    60 -> 120",
					  3 : "Upkeep	    120"
					}
var turbineUpkeepValues = { 0 : 0,
							1 : 30, 
							2 : 60,
							3 : 120
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
	
func close_shop():
	visible = false
	
func _on_close_button_pressed():
	close_shop()


func _update_values(prices, level, potatoPrice, scrapPrice, impovementLabel, improvement, upkeepLabel, upkeep):
	if level < 3:
		potatoPrice.text = str(prices[level]["potato"])
		scrapPrice.text = str(prices[level]["scrap"])
		impovementLabel.text = improvement[level]
		upkeepLabel.text = upkeep[level]

func _update():
	_update_values(fertilizerPrice, fertilizerLevel, fertilizerPotatoPrice, fertilizerScrapPrice, fertilizerImprovementLabel, fertilizerImprovements, fertilizerUpkeepLabel, fertilizerUpkeep)
	_update_values(qualityPrice, qualityLevel, qualityPotatoPrice, qualityScrapPrice, qualityImprovementLabel, qualityImprovements, qualityUpkeepLabel, qualityUpkeep)
	_update_values(growthPrice, growthLevel, growthPotatoPrice, growthScrapPrice, growthImprovementLabel, growthImprovements, growthUpkeepLabel, growthUpkeep)
	_update_values(boostPrice, boostLevel, boostPotatoPrice, boostScrapPrice, boostImprovementLabel, boostImprovements, boostUpkeepLabel, boostUpkeep)
	_update_values(forgePrice, forgeLevel, forgePotatoPrice, forgeScrapPrice, forgeImprovementLabel, forgeImprovements, forgeUpkeepLabel, forgeUpkeep)
	_update_values(turbinePrice, turbineLevel, turbinePotatoPrice, turbineScrapPrice, turbineImprovementLabel, turbineImprovements, turbineUpkeepLabel, turbineUpkeep)


func _update_global_values(prices, level, upkeepValues, improvementValues):
	Global.potatoCount -= prices[level]["potato"]
	Global.scrapCount -= prices[level]["scrap"]
	Global.upkeep -= upkeepValues[level]
	level += 1
	Global.potatoQuantity = improvementValues[level]
	Global.upkeep += upkeepValues[level]
	return level

func _update_to_new_button_values(level, upkeep, upkeepValues, upkeepLabel, improvements, improvementLabel, button, resources):

	if level < 3:
		_update()
		_refresh_upkeep(upkeepValues, level)
	else:
		totalUpkeep.visible = false
		upkeepLabel.text = upkeep[level]
		improvementLabel.text = improvements[level]
		button.text = "Maxed out"
		button.disabled = true
		resources.visible = false

func _on_fertilizer_button_pressed():
	fertilizerLevel = _update_global_values(fertilizerPrice, fertilizerLevel, fertilizerUpkeepValues, fertilizerImprovementValues)
	_update_to_new_button_values(fertilizerLevel, fertilizerUpkeep, fertilizerUpkeepValues, fertilizerUpkeepLabel, fertilizerImprovements, fertilizerImprovementLabel, fertilizerButton, fertilizerResources)

func _on_quality_button_pressed():
	qualityLevel = _update_global_values(qualityPrice, qualityLevel, qualityUpkeepValues, qualityImprovementValues)
	_update_to_new_button_values(qualityLevel, qualityUpkeep, qualityUpkeepValues, qualityUpkeepLabel, qualityImprovements, qualityImprovementLabel, qualityButton, qualityResources)

func _on_growth_button_pressed():
	growthLevel = _update_global_values(growthPrice, growthLevel, growthUpkeepValues, growthImprovementValues)
	_update_to_new_button_values(growthLevel, growthUpkeep, growthUpkeepValues, growthUpkeepLabel, growthImprovements, growthImprovementLabel, growthButton, growthResources)

func _on_boost_button_pressed():
	boostLevel = _update_global_values(boostPrice, boostLevel, boostUpkeepValues, boostImprovementValues)
	_update_to_new_button_values(boostLevel, boostUpkeep, boostUpkeepValues, boostUpkeepLabel, boostImprovements, boostImprovementLabel, boostButton, boostResources)

func _on_forge_button_pressed():
	forgeLevel = _update_global_values(forgePrice, forgeLevel, forgeUpkeepValues, forgeImprovementValues)
	_update_to_new_button_values(forgeLevel, forgeUpkeep, forgeUpkeepValues, forgeUpkeepLabel, forgeImprovements, forgeImprovementLabel, forgeButton, forgeResources)

func _on_turbine_button_pressed():
	turbineLevel = _update_global_values(turbinePrice, turbineLevel, turbineUpkeepValues, turbineImprovementValues)
	_update_to_new_button_values(turbineLevel, turbineUpkeep, turbineUpkeepValues, turbineUpkeepLabel, turbineImprovements, turbineImprovementLabel, turbineButton, turbineResources)

func _on_potato_button_pressed():
	scrapButton.button_pressed = false
	scrapSection.visible = false
	potatoSection.visible = true

func _on_scrap_button_pressed():
	potatoButton.button_pressed = false
	potatoSection.visible = false
	scrapSection.visible = true





func _refresh_upkeep(upkeepValues, level):
	totalUpkeep.text = str(Global.upkeep) + "   ->   " + str(Global.upkeep + upkeepValues[level+1] - upkeepValues[level])
	
func _refresh_upkeep_button(button, upkeepValues, level):
	if not button.disabled:
		totalUpkeep.global_position = button.global_position + button.size + Vector2(10, -50)
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
