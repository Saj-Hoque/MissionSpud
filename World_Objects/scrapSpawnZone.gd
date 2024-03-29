extends Area2D
class_name  ScrapArea

var scrap_scene = preload("res://Resources/scrap.tscn")
@onready var scraps = $scraps
@onready var scrapArea = $area
@onready var scrapAreaDims = scrapArea.shape.extents
@onready var scrapAreaOrigin = scrapArea.global_position - scrapAreaDims
@onready var scrapTimer = $"../../scrapSpawnTimer"
@onready var all_robots = get_tree().get_nodes_in_group("robots")
@onready var idle_area = get_parent()

func instantiate():
	scrapTimer.wait_time = Global.scrapTimer
	
func _on_scrap_spawn_timer_timeout():
	if scrapTimer.wait_time != Global.scrapTimer:
		scrapTimer.wait_time = Global.scrapTimer
	
	for i in range(Global.scrapQuantity):
		if scraps.get_child_count() < Global.max_scraps:
			var scrap = scrap_scene.instantiate()
			scrap.position = Vector2(randi_range(scrapAreaOrigin.x, scrapAreaOrigin.x + (scrapAreaDims.x*2)), randi_range(scrapAreaOrigin.y, scrapAreaOrigin.y + (scrapAreaDims.y*2)))
			scraps.add_child(scrap) 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.scrapTimer < scrapTimer.wait_time:
		if scrapTimer.get_time_left() > 0:
			scrapTimer.start((scrapTimer.get_time_left() / scrapTimer.wait_time) * Global.scrapTimer)
		else:
			scrapTimer.wait_time = Global.potatoTimer


func _on_zone_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("rightClick"):
		all_robots = get_tree().get_nodes_in_group("robots")
		for robot in all_robots:
			if robot.selected:
				if robot in idle_area.robots:
					print("This robot is already assigned here!")
				elif idle_area.robots.size() == idle_area.total_docks:
					print("Cannot assign robot to fully allocated plot. Free up space or assign them to a different plot")
				elif not (robot is scavenger_robot):
					print("Cannot assign a farming robot to a scrap area")
				else:
					robot.assign_to_new_idle_area(idle_area)
					Input.set_default_cursor_shape(Input.CURSOR_ARROW)


func _on_zone_mouse_entered():
	var selected_robots = SelectionManager.current_selection
	if selected_robots:
		var currently_selected_robot = selected_robots[0]
		if currently_selected_robot.selected:
			if currently_selected_robot in idle_area.robots:
				Input.set_default_cursor_shape(Input.CURSOR_ARROW)
			elif idle_area.robots.size() == idle_area.total_docks:
				Input.set_default_cursor_shape(Input.CURSOR_FORBIDDEN)
			elif not (currently_selected_robot is scavenger_robot):
				Input.set_default_cursor_shape(Input.CURSOR_FORBIDDEN)
			elif (currently_selected_robot is scavenger_robot):
				Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)

func _on_zone_mouse_exited():
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)
