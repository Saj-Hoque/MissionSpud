extends Node2D

func _ready():
	Global.reset()
	reset_robots()
	reset_plots()
	ResourceResearchStation.reset()
	RobotResearchStation.reset()
	SelectionManager.reset()
	TimeSystem.reset()
	TimeSystem.second = 6 * 60 * 60
	
	Global.potatoCount = 100
	Global.scrapCount = 100
	
	Info.show_panel()
	Global.menu_active = true

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

func reset_plots(): 
	var growing_plots = get_tree().get_nodes_in_group("growingPlots")
	for plot in growing_plots:
		plot.instantiate()
		
func reset_scrapZone():
	$idleArea3/scrapSpawnZone.instantiate()

func _input(event):
	if event.is_action_pressed("leftClick"):
		SelectionManager.target_pos = get_global_mouse_position()
		SelectionManager.selection_mode = true

