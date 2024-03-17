extends Node2D


const DISTANCE_BETWEEN_DOCKS = 16

@export var total_docks = 12
@export var docks_per_row = 6
@onready var docks = $docks

@onready var idleDock = preload("res://World_Objects/idle_dock.tscn")

var pos = Vector2.ZERO

var robots = []
@onready var robotCount = $count/label

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
	
	$count.position = Vector2(DISTANCE_BETWEEN_DOCKS * (docks_per_row-1), 0)
	
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
