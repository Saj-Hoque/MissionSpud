extends CanvasLayer

@onready var potatoCounter = $resourceMargin/resourceContainer/potatoPanel/potatoMargin/potato/potatoCounter
@onready var scrapCounter = $resourceMargin/resourceContainer/scrapPanel/scrapMargin/scrap/scrapCounter

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	potatoCounter.text = (str(Global.potatoCount))
	scrapCounter.text = (str(Global.scrapCount))
