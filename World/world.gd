extends Node2D

@onready var potatoCounter = $UI/potatoCounter
@onready var scrapCounter = $UI/scrapCounter

func _process(delta):
	potatoCounter.text = (str(Global.potatoCount))
	scrapCounter.text = (str(Global.scrapCount))

func update_potato_counter(value):
		Global.potatoCount += value
		
func update_scrap_counter(value):
		Global.scrapCount += value
