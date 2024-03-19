extends CanvasLayer

@onready var fertilizerButton = $Panel/BUY/HBoxContainer/Buttons_Price/fertilizer/fertilizerButton
@onready var fertilizerResources = $Panel/BUY/HBoxContainer/Buttons_Price/fertilizer/Price
@onready var fertilizerPotatoPrice = $Panel/BUY/HBoxContainer/Buttons_Price/fertilizer/Price/potatoPrice
@onready var fertilizerScrapPrice = $Panel/BUY/HBoxContainer/Buttons_Price/fertilizer/Price/scrapPrice
@onready var fertilizerImprovementLabel = $Panel/BUY/HBoxContainer/Description_Improvement/fertilizer/improvement

@onready var qualityButton = $Panel/BUY/HBoxContainer/Buttons_Price/quality/qualityButton
@onready var qualityResources = $Panel/BUY/HBoxContainer/Buttons_Price/quality/Price
@onready var qualityPotatoPrice = $Panel/BUY/HBoxContainer/Buttons_Price/quality/Price/potatoPrice
@onready var qualityScrapPrice = $Panel/BUY/HBoxContainer/Buttons_Price/quality/Price/scrapPrice
@onready var qualityImprovementLabel = $Panel/BUY/HBoxContainer/Description_Improvement/quality/improvement

@onready var growthButton = $Panel/BUY/HBoxContainer/Buttons_Price/growth/growthButton
@onready var growthResources = $Panel/BUY/HBoxContainer/Buttons_Price/growth/Price
@onready var growthPotatoPrice = $Panel/BUY/HBoxContainer/Buttons_Price/growth/Price/potatoPrice
@onready var growthScrapPrice = $Panel/BUY/HBoxContainer/Buttons_Price/growth/Price/scrapPrice
@onready var growthImprovementLabel = $Panel/BUY/HBoxContainer/Description_Improvement/growth/improvement


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
							   2 : "x 8   ->   x 16"
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
							2 : "4   ->   8"
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
						   2 : "5s   ->   2.5s"
						 }


func _ready():
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
		fertilizerButton.text = "Maxed out"
		fertilizerButton.disabled = true
		fertilizerResources.visible = false
		fertilizerImprovementLabel.visible = false

func _on_quality_button_pressed():
	Global.potatoCount -= qualityPrice[qualityLevel]["potato"]
	Global.scrapCount -= qualityPrice[qualityLevel]["scrap"]
	qualityLevel += 1
	Global.potatoValue *= 2
	
	if qualityLevel < 3:
		_update()
	else:
		qualityButton.text = "Maxed out"
		qualityButton.disabled = true
		qualityResources.visible = false
		qualityImprovementLabel.visible = false

func _on_growth_button_pressed():
	Global.potatoCount -= growthPrice[growthLevel]["potato"]
	Global.scrapCount -= growthPrice[growthLevel]["scrap"]
	growthLevel += 1
	Global.potatoTimer /= 2.0
	
	if growthLevel < 3:
		_update()
	else:
		growthButton.text = "Maxed out"
		growthButton.disabled = true
		growthResources.visible = false
		growthImprovementLabel.visible = false
