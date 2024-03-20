extends CanvasLayer

@onready var potatoButton = $potatoButton
@onready var scrapButton = $scrapButton
@onready var potatoSection = $potato
@onready var scrapSection = $scrap

@onready var fertilizerButton = $potato/research/fields/Buttons_Price/fertilizer/fertilizerButton
@onready var fertilizerResources = $potato/research/fields/Buttons_Price/fertilizer/Price
@onready var fertilizerPotatoPrice = $potato/research/fields/Buttons_Price/fertilizer/Price/potatoPrice
@onready var fertilizerScrapPrice = $potato/research/fields/Buttons_Price/fertilizer/Price/scrapPrice
@onready var fertilizerImprovementLabel = $potato/research/fields/Description_Improvement/fertilizer/improvement

@onready var qualityButton = $potato/research/fields/Buttons_Price/quality/qualityButton
@onready var qualityResources = $potato/research/fields/Buttons_Price/quality/Price
@onready var qualityPotatoPrice = $potato/research/fields/Buttons_Price/quality/Price/potatoPrice
@onready var qualityScrapPrice = $potato/research/fields/Buttons_Price/quality/Price/scrapPrice
@onready var qualityImprovementLabel = $potato/research/fields/Description_Improvement/quality/improvement

@onready var growthButton = $potato/research/fields/Buttons_Price/growth/growthButton
@onready var growthResources = $potato/research/fields/Buttons_Price/growth/Price
@onready var growthPotatoPrice = $potato/research/fields/Buttons_Price/growth/Price/potatoPrice
@onready var growthScrapPrice = $potato/research/fields/Buttons_Price/growth/Price/scrapPrice
@onready var growthImprovementLabel = $potato/research/fields/Description_Improvement/growth/improvement

@onready var boostButton = $scrap/research/fields/Buttons_Price/boost/boostButton
@onready var boostResources = $scrap/research/fields/Buttons_Price/boost/Price
@onready var boostPotatoPrice = $scrap/research/fields/Buttons_Price/boost/Price/potatoPrice
@onready var boostScrapPrice = $scrap/research/fields/Buttons_Price/boost/Price/scrapPrice
@onready var boostImprovementLabel = $scrap/research/fields/Description_Improvement/boost/improvement

@onready var forgeButton = $scrap/research/fields/Buttons_Price/forge/forgeButton
@onready var forgeResources = $scrap/research/fields/Buttons_Price/forge/Price
@onready var forgePotatoPrice = $scrap/research/fields/Buttons_Price/forge/Price/potatoPrice
@onready var forgeScrapPrice = $scrap/research/fields/Buttons_Price/forge/Price/scrapPrice
@onready var forgeImprovementLabel = $scrap/research/fields/Description_Improvement/forge/improvement

@onready var turbineButton = $scrap/research/fields/Buttons_Price/turbine/turbineButton
@onready var turbineResources = $scrap/research/fields/Buttons_Price/turbine/Price
@onready var turbinePotatoPrice = $scrap/research/fields/Buttons_Price/turbine/Price/potatoPrice
@onready var turbineScrapPrice = $scrap/research/fields/Buttons_Price/turbine/Price/scrapPrice
@onready var turbineImprovementLabel = $scrap/research/fields/Description_Improvement/turbine/improvement


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


func _ready():
	scrapButton.button_pressed = false
	scrapSection.visible = false
	close_shop()
	await get_tree().get_root().ready
	
func _process(delta):

	if visible:
		if fertilizerLevel < 3:
			if Global.potatoCount >= fertilizerPrice[fertilizerLevel]["potato"] and Global.scrapCount >= fertilizerPrice[fertilizerLevel]["scrap"]:
				fertilizerButton.disabled = false
			else:
				fertilizerButton.disabled = true
		
		if qualityLevel < 3:
			if Global.potatoCount >= qualityPrice[qualityLevel]["potato"] and Global.scrapCount >= qualityPrice[qualityLevel]["scrap"]:
				qualityButton.disabled = false
			else:
				qualityButton.disabled = true
#
		if growthLevel < 3:
			if Global.potatoCount >= growthPrice[growthLevel]["potato"] and Global.scrapCount >= growthPrice[growthLevel]["scrap"]:
				growthButton.disabled = false
			else:
				growthButton.disabled = true
				
		if boostLevel < 3:
			if Global.potatoCount >= boostPrice[boostLevel]["potato"] and Global.scrapCount >= boostPrice[boostLevel]["scrap"]:
				boostButton.disabled = false
			else:
				boostButton.disabled = true
		
		if forgeLevel < 3:
			if Global.potatoCount >= forgePrice[forgeLevel]["potato"] and Global.scrapCount >= forgePrice[forgeLevel]["scrap"]:
				forgeButton.disabled = false
			else:
				forgeButton.disabled = true
#
		if turbineLevel < 3:
			if Global.potatoCount >= turbinePrice[turbineLevel]["potato"] and Global.scrapCount >= turbinePrice[turbineLevel]["scrap"]:
				turbineButton.disabled = false
			else:
				turbineButton.disabled = true
			
func open_shop():
	visible = true
	_update()
	
func close_shop():
	visible = false

func _update():
	if fertilizerLevel < 3:
		fertilizerPotatoPrice.text = str(fertilizerPrice[fertilizerLevel]["potato"])
		fertilizerScrapPrice.text = str(fertilizerPrice[fertilizerLevel]["scrap"])
		fertilizerImprovementLabel.text = fertilizerImprovements[fertilizerLevel]
		
	if qualityLevel < 3:
		qualityPotatoPrice.text = str(qualityPrice[qualityLevel]["potato"])
		qualityScrapPrice.text = str(qualityPrice[qualityLevel]["scrap"])
		qualityImprovementLabel.text = qualityImprovements[qualityLevel]
	
	if growthLevel < 3:
		growthPotatoPrice.text = str(growthPrice[growthLevel]["potato"])
		growthScrapPrice.text = str(growthPrice[growthLevel]["scrap"])
		growthImprovementLabel.text = growthImprovements[growthLevel]
		
	if boostLevel < 3:
		boostPotatoPrice.text = str(boostPrice[boostLevel]["potato"])
		boostScrapPrice.text = str(boostPrice[boostLevel]["scrap"])
		boostImprovementLabel.text = boostImprovements[boostLevel]
		
	if forgeLevel < 3:
		forgePotatoPrice.text = str(forgePrice[forgeLevel]["potato"])
		forgeScrapPrice.text = str(forgePrice[forgeLevel]["scrap"])
		forgeImprovementLabel.text = forgeImprovements[forgeLevel]
	
	if turbineLevel < 3:
		turbinePotatoPrice.text = str(turbinePrice[turbineLevel]["potato"])
		turbineScrapPrice.text = str(turbinePrice[turbineLevel]["scrap"])
		turbineImprovementLabel.text = turbineImprovements[turbineLevel]
		

func _on_close_button_pressed():
	close_shop()

func _on_fertilizer_button_pressed():
	Global.potatoCount -= fertilizerPrice[fertilizerLevel]["potato"]
	Global.scrapCount -= fertilizerPrice[fertilizerLevel]["scrap"]
	fertilizerLevel += 1
	Global.potatoQuantity *= 2
	
	if fertilizerLevel < 3:
		_update()
	else:
		fertilizerImprovementLabel.text = fertilizerImprovements[fertilizerLevel]
		fertilizerButton.text = "Maxed out"
		fertilizerButton.disabled = true
		fertilizerResources.visible = false

func _on_quality_button_pressed():
	Global.potatoCount -= qualityPrice[qualityLevel]["potato"]
	Global.scrapCount -= qualityPrice[qualityLevel]["scrap"]
	qualityLevel += 1
	Global.potatoValue *= 2
	
	if qualityLevel < 3:
		_update()
	else:
		qualityImprovementLabel.text = qualityImprovements[qualityLevel]
		qualityButton.text = "Maxed out"
		qualityButton.disabled = true
		qualityResources.visible = false

func _on_growth_button_pressed():
	Global.potatoCount -= growthPrice[growthLevel]["potato"]
	Global.scrapCount -= growthPrice[growthLevel]["scrap"]
	growthLevel += 1
	Global.potatoTimer /= 2.0
	
	if growthLevel < 3:
		_update()
	else:
		growthImprovementLabel.text = growthImprovements[growthLevel]
		growthButton.text = "Maxed out"
		growthButton.disabled = true
		growthResources.visible = false


func _on_boost_button_pressed():
	Global.potatoCount -= boostPrice[boostLevel]["potato"]
	Global.scrapCount -= boostPrice[boostLevel]["scrap"]
	boostLevel += 1
	Global.scrapQuantity *= 2
	
	if boostLevel < 3:
		_update()
	else:
		boostImprovementLabel.text = boostImprovements[boostLevel]
		boostButton.text = "Maxed out"
		boostButton.disabled = true
		boostResources.visible = false


func _on_forge_button_pressed():
	Global.potatoCount -= forgePrice[forgeLevel]["potato"]
	Global.scrapCount -= forgePrice[forgeLevel]["scrap"]
	forgeLevel += 1
	Global.scrapValue *= 2
	
	if forgeLevel < 3:
		_update()
	else:
		forgeImprovementLabel.text = forgeImprovements[forgeLevel]
		forgeButton.text = "Maxed out"
		forgeButton.disabled = true
		forgeResources.visible = false


func _on_turbine_button_pressed():
	Global.potatoCount -= turbinePrice[turbineLevel]["potato"]
	Global.scrapCount -= turbinePrice[turbineLevel]["scrap"]
	turbineLevel += 1
	Global.scrapTimer /= 2.0
	
	if turbineLevel < 3:
		_update()
	else:
		turbineImprovementLabel.text = turbineImprovements[turbineLevel]
		turbineButton.text = "Maxed out"
		turbineButton.disabled = true
		turbineResources.visible = false


func _on_potato_button_pressed():
	scrapButton.button_pressed = false
	scrapSection.visible = false
	potatoSection.visible = true

func _on_scrap_button_pressed():
	potatoButton.button_pressed = false
	potatoSection.visible = false
	scrapSection.visible = true





