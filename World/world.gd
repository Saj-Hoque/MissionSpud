extends Node2D

func _ready():
	Global.potatoCount = 1000
	Global.scrapCount = 1000
	
	TimeSystem.day = 1
	TimeSystem.hour = 0
	TimeSystem.minute = 0
	TimeSystem.second = 15*60*24

func update_potato_counter(value):
		Global.potatoCount += value
		
func update_scrap_counter(value):
		Global.scrapCount += value
		
func _process(delta):
	pass
		
func _input(event):
	if event.is_action_pressed("leftClick"):
		SelectionManager.target_pos = get_global_mouse_position()
		SelectionManager.selection_mode = true
		
	
