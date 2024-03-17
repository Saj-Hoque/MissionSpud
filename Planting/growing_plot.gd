extends StaticBody2D

var potato_scene = preload("res://Resources/potato.tscn")
@onready var potatoes = get_node("/root/world/potatoes")
var plantGrowing = false
var plantGrown = false
var taken = false

func occupied():
	taken = true

func unoccupied():
	taken = false
	
func is_available():
	return not taken

func _on_area_2d_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("leftClick"):	
		if not plantGrowing:
			plantGrowing = true
			$potatoTimer.start()
			$plant.play("potato")
		elif plantGrown:
			var potato = potato_scene.instantiate()
			potato.position = global_position + Vector2(randi_range(-3, 3), randi_range(-3, 3))
			potatoes.add_child(potato) 
			plantGrowing = false
			plantGrown = false
			$plant.play("none")
		else:
			print("PLANT IS ALREADY GROWING HERE")

func _on_potato_timer_timeout():
	var plant = $plant	
	if plant.frame == 1:
		plant.frame = 2
		plantGrown = true
	else:
		plant.frame += 1 
		$potatoTimer.start()
