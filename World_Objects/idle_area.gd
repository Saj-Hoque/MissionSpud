extends Node2D


const DISTANCE_BETWEEN_DOCKS = 16

@export var total_docks = 12
@export var docks_per_row = 6
@onready var docks = $docks

@onready var idleDock = preload("res://World_Objects/idle_dock.tscn")

var pos = Vector2.ZERO

@onready var all_robots = get_tree().get_nodes_in_group("robots")
var robots = []
@onready var robotCount = $count/label

@onready var plot

@onready var zone = $zone/CollisionShape2D

func _ready():
	for i in range(0, total_docks):
		if i % docks_per_row == 0:
			pos.x = 0
			pos.y += DISTANCE_BETWEEN_DOCKS
		else:
			pos.x += DISTANCE_BETWEEN_DOCKS
		
		var dock = idleDock.instantiate()
		dock.position = pos
		dock.add_to_group("docks")
		docks.add_child(dock)
		
	var zone_x_size = DISTANCE_BETWEEN_DOCKS * (docks_per_row+1)
	var zone_x_pos = DISTANCE_BETWEEN_DOCKS * (docks_per_row-1) / 2
	var zone_y_size = DISTANCE_BETWEEN_DOCKS * ((total_docks / docks_per_row) + 1) 
	var zone_y_pos = DISTANCE_BETWEEN_DOCKS * ((total_docks / docks_per_row) + 1) / 2 
	
	zone.shape.size = Vector2(zone_x_size, zone_y_size)
	zone.global_position += Vector2(zone_x_pos, zone_y_pos)		
	
	$count.position = Vector2(DISTANCE_BETWEEN_DOCKS * (docks_per_row-1), 0)
	
	for child in get_children():
		if child is PlotArea:
			plot = child
			
	
func _process(delta):
	robotCount.text = (str(robots.size()) + " / " + str(total_docks))
	
func get_next_available_dock():
	for i in range(0, total_docks):
		if docks.get_child(i).has_space():
			return i
			
	return -1
	
func get_dock_position(dock):
	return docks.get_child(dock).global_position
	
func update_dock_status_color(dock):
	docks.get_child(dock).update_status()
	
func change_dock_status_occupied(dock):
	docks.get_child(dock).occupied()
	
func change_dock_status_unoccupied(dock):
	docks.get_child(dock).unoccupied()


func _on_zone_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("rightClick"):
		for robot in all_robots:
			if robot.selected:
				if robot in robots:
					print("This robot is already assigned here!")
				elif robots.size() == total_docks:
					print("Cannot assign robot to fully allocated plot. Free up space or assign them to a different plot")
				else:
					robot.assign_to_new_idle_area(self)
