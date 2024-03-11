extends CanvasLayer

@onready var potatoCounter = $resourceMargin/resourceContainer/potatoPanel/potatoMargin/potato/potatoCounter
@onready var scrapCounter = $resourceMargin/resourceContainer/scrapPanel/scrapMargin/scrap/scrapCounter

@onready var day = $timeSystemMargin/timeSystemContainer/dayPanel/dayMargin/day
@onready var hour = $timeSystemMargin/timeSystemContainer/timePanel/timeMargin/timeContainer/hour
@onready var minute = $timeSystemMargin/timeSystemContainer/timePanel/timeMargin/timeContainer/minute

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	potatoCounter.text = (str(Global.potatoCount))
	scrapCounter.text = (str(Global.scrapCount))
	
	day.text = ("Sol %d" % TimeSystem.day)
	hour.text = ("%02d" % TimeSystem.hour)
	minute.text = ("%02d" % ((TimeSystem.minute / 10) * 10))
	
