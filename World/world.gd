extends Node2D

func _ready():
	Global.reset()
	reset_robots()
	ResourceResearchStation.reset()
	RobotResearchStation.reset()
	SelectionManager.reset()
	TimeSystem.reset()
	TimeSystem.second = 23 * 60 * 60
	
	Global.potatoCount = 100
	Global.scrapCount = 100

func update_potato_counter(value):
		Global.potatoCount += value
		Global.totalPotato += value
		
func update_scrap_counter(value):
		Global.scrapCount += value
		Global.totalScrap += value
		
func reset_robots(): 
	var all_robots = get_tree().get_nodes_in_group("robots")
	for robot in all_robots:
		robot.instantiate()

func _input(event):
	if event.is_action_pressed("leftClick"):
		SelectionManager.target_pos = get_global_mouse_position()
		SelectionManager.selection_mode = true

