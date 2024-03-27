extends Node2D

var selection_mode = false
var target_pos
var active_areas = []
var current_selection = []

func register_area(area: Area2D):
	active_areas.push_back(area)
		
func _process(delta):

	if active_areas.size() > 0:
		active_areas.sort_custom(_sort_by_distance_to_player)
		var selected_unit = active_areas[0].get_parent()
		if current_selection.find(selected_unit) == -1:
			current_selection.push_back(selected_unit)
		if current_selection.size() > 1:
			_update_current_selection()
		selected_unit.toggle_select()
		active_areas.clear()
		
	elif selection_mode:
		if current_selection.size() > 0:
			_update_current_selection()
			
	selection_mode = false
		
func _sort_by_distance_to_player(area1, area2):
	var area1_to_player = target_pos.distance_to(area1.global_position)
	var area2_to_player = target_pos.distance_to(area2.global_position)
	return area1_to_player < area2_to_player

func _update_current_selection():
	current_selection[0].toggle_select()
	current_selection.remove_at(0)

func reset():
	if current_selection:
		if current_selection[0].selected:
			current_selection[0].toggle_select()
	selection_mode = false
	active_areas = []
	current_selection = []
