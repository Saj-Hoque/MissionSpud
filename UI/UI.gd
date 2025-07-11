extends CanvasLayer

@onready var backgroundMusic = $"../backgroundMusic"
@onready var musicButton = $music

@onready var potatoCounter = $resourceMargin/resourceContainer/potatoPanel/potatoMargin/potato/potatoCounter
@onready var scrapCounter = $resourceMargin/resourceContainer/scrapPanel/scrapMargin/scrap/scrapCounter
@onready var upkeepCounter = $upkeepMargin/upkeepPanel/margin/upkeep/upkeepCounter

@onready var day = $timeSystemMargin/timeSystemContainer/dayPanel/dayMargin/day
@onready var hour = $timeSystemMargin/timeSystemContainer/timePanel/timeMargin/timeContainer/hour
@onready var minute = $timeSystemMargin/timeSystemContainer/timePanel/timeMargin/timeContainer/minute

@onready var upkeepAlert = $upkeepAlert
@onready var upkeepMessage = $upkeepMessage

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	potatoCounter.text = (str(Global.potatoCount))
	scrapCounter.text = (str(Global.scrapCount))
	upkeepCounter.text = (str(Global.upkeep + Global.robot_upkeep))
	
	day.text = ("Sol %d" % TimeSystem.day)
	hour.text = ("%02d" % TimeSystem.hour)
	minute.text = ("%02d" % ((TimeSystem.minute / 10) * 10))
	
	upkeepAlert.visible = TimeSystem.upkeep_alert
	upkeepMessage.visible = TimeSystem.upkeep_message


func _on_info_pressed():
	if not Info.visible:
		Info.show_panel()
		Global.menu_active = true
	else:
		Info.hide_panel()
		Global.menu_active = false


func _on_music_pressed():
	if backgroundMusic.is_playing():
		backgroundMusic.stop()
		musicButton.text = "Music :  off"
	else:
		backgroundMusic.play()
		musicButton.text = "Music :  on"
		
