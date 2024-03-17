extends Node2D

const DISTANCE_BETWEEN_PLOTS = 16

@export var total_plots = 12
@export var plots_per_row = 6
@onready var plots = $plots
@onready var idle_area = get_parent()
@onready var zone = $zone/CollisionShape2D

@onready var growingPlot = preload("res://Planting/growing_plot.tscn")
@onready var all_robots = get_tree().get_nodes_in_group("robots")

var pos = Vector2.ZERO

func _ready():
	for i in range(0, total_plots):
		if i % plots_per_row == 0:
			pos.x = 0
			pos.y += DISTANCE_BETWEEN_PLOTS
		else:
			pos.x += DISTANCE_BETWEEN_PLOTS
		
		var plot = growingPlot.instantiate()
		plot.position = pos
		plots.add_child(plot)
	
	var zone_x_size = DISTANCE_BETWEEN_PLOTS * (plots_per_row+1)
	var zone_x_pos = DISTANCE_BETWEEN_PLOTS * (plots_per_row-1) / 2
	var zone_y_size = DISTANCE_BETWEEN_PLOTS * ((total_plots / plots_per_row) + 1) 
	var zone_y_pos = DISTANCE_BETWEEN_PLOTS * ((total_plots / plots_per_row) + 1) / 2 
	
	zone.shape.size = Vector2(zone_x_size, zone_y_size)
	zone.global_position += Vector2(zone_x_pos, zone_y_pos)
	
func get_next_available_plot():
	for i in range(0, total_plots):
		if plots.get_child(i).is_available():
			return i
	return -1
	
func get_next_full_plot():
	for i in range(0, total_plots):
		if not plots.get_child(i).is_available():
			return i
	return -1
	
func get_plot_position(plot):
	return plots.get_child(plot).global_position
	
func change_plot_status_occupied(plot):
	plots.get_child(plot).occupied()
	
func change_plot_status_unoccupied(plot):
	plots.get_child(plot).unoccupied()

func _on_zone_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("rightClick"):
		for robot in all_robots:
			if robot.selected:
				if robot in idle_area.robots:
					print("This robot is already assigned here!")
				elif idle_area.robots.size() == idle_area.total_docks:
					print("Cannot assign robot to fully allocated plot. Free up space or assign them to a different plot")
				else:
					robot.assign_to_plot(idle_area)
				
