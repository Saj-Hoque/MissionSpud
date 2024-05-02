extends Node

func check_if_won_game(bought):
	if bought:
		Global.totalRobots = (get_tree().get_nodes_in_group("robots")).size()
		Global.running = false
		SelectionManager.reset()
		SceneTransition.change_scene("res://UI/victoryScreen.tscn")

func check_if_lose_game_upkeep():
	if Upkeep.below_count():
		Global.running = false
		SelectionManager.reset()
		SceneTransition.change_scene("res://UI/loseScreen1.tscn")

func check_if_lose_game_time():
	if TimeSystem.is_final_day():
		Global.totalRobots = (get_tree().get_nodes_in_group("robots")).size()
		Global.running = false
		SelectionManager.reset()
		SceneTransition.change_scene("res://UI/loseScreen2.tscn")
