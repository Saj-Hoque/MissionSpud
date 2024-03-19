extends StaticBody2D
@onready var timer = $potatoTimer
var potato_scene = preload("res://Resources/potato.tscn")
@onready var potatoes = get_node("/root/world/potatoes")
var potatoQuantity = 2
var plantGrowing = false
var plantGrown = false
var taken = false

func occupied():
	taken = true

func unoccupied():
	taken = false
	
func is_available():
	return not taken

func _on_potato_timer_timeout():
	var plant = $plant	
	if plant.frame == 1:
		plant.frame = 2
		plantGrown = true
	else:
		plant.frame += 1 
		timer.start()

func grow_plant():
	plantGrowing = true
	timer.start()
	$plant.play("potato")
	
func harvest_plant():
	for i in range(potatoQuantity):
		var potato = potato_scene.instantiate()
		potato.position = global_position + Vector2(randi_range(-3, 3), randi_range(-3, 3))
		potatoes.add_child(potato) 
		plantGrowing = false
		plantGrown = false
		$plant.play("none")
	
func reset():
	plantGrowing = false
	plantGrown = false
	taken = false
	timer.stop()
