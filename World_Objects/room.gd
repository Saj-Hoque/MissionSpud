extends Node2D
@onready var all_robots = get_tree().get_nodes_in_group("robots")
@onready var idle_area = $idleArea
@export var door : StaticBody2D

func _on_room_area_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("rightClick") and not door.locked:
		all_robots = get_tree().get_nodes_in_group("robots")
		for robot in all_robots:
			if robot.selected:
				if robot in idle_area.robots:
					print("This robot is already assigned here!")
				elif idle_area.robots.size() == idle_area.total_docks:
					print("Cannot assign robot to fully allocated plot. Free up space or assign them to a different plot")
				elif (robot is planter_robot or robot is harvester_robot or robot is collector_robot) and not (idle_area.type == "farming" or idle_area.type == "main"):
					print("Cannot assign a farming robot to a non-farming area")
				elif (robot is scavenger_robot) and not (idle_area.type == "scrap" or idle_area.type == "main"):
					print("Cannot assign a scrap robot to a non-scrap area")
				else:
					robot.assign_to_new_idle_area(idle_area)
					Input.set_default_cursor_shape(Input.CURSOR_ARROW)


func _on_room_area_mouse_entered():
	var selected_robots = SelectionManager.current_selection
	if selected_robots:
		var currently_selected_robot = selected_robots[0]
		if currently_selected_robot.selected:
			if door.locked:
				Input.set_default_cursor_shape(Input.CURSOR_FORBIDDEN)
			elif currently_selected_robot in idle_area.robots:
				Input.set_default_cursor_shape(Input.CURSOR_ARROW)
			elif idle_area.robots.size() == idle_area.total_docks:
				Input.set_default_cursor_shape(Input.CURSOR_FORBIDDEN)
			elif (currently_selected_robot is planter_robot or currently_selected_robot is harvester_robot or currently_selected_robot is collector_robot) and not (idle_area.type == "farming" or idle_area.type == "main"):
				Input.set_default_cursor_shape(Input.CURSOR_FORBIDDEN)
			elif (currently_selected_robot is scavenger_robot) and not (idle_area.type == "scrap" or idle_area.type == "main"):
				Input.set_default_cursor_shape(Input.CURSOR_FORBIDDEN)
			elif (currently_selected_robot is planter_robot or currently_selected_robot is harvester_robot or currently_selected_robot is collector_robot) and (idle_area.type == "farming" or idle_area.type == "main"):
				Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)
			elif (currently_selected_robot is scavenger_robot) and (idle_area.type == "scrap" or idle_area.type == "main"):
				Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)
