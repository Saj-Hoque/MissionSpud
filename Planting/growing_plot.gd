extends StaticBody2D
@onready var timer = $potatoTimer
@onready var plant = $plant	
var potato_scene = preload("res://Resources/potato.tscn")
@onready var potatoes = get_node("/root/world/potatoes")
var plantGrowing = false
var plantGrown = false
var taken = false

@onready var progress = $ProgressBar
var percentage_of_time

func instantiate():
	timer.wait_time = Global.potatoTimer

func _process(delta):
	if Global.potatoTimer < timer.wait_time:
		if timer.get_time_left() > 0:
			timer.start((timer.get_time_left() / timer.wait_time) * Global.potatoTimer)
		else:
			timer.wait_time = Global.potatoTimer
		
	if timer.get_time_left() > 0:
		percentage_of_time = ((1 - timer.get_time_left() / timer.get_wait_time()) * 100) / 2
		if plant.frame == 0:
			progress.value = percentage_of_time
		elif plant.frame == 1:
			progress.value = percentage_of_time + 50
		elif plant.frame == 2:
			progress.visible = false

	

func occupied():
	taken = true

func unoccupied():
	taken = false
	
func is_available():
	return not taken

func _on_potato_timer_timeout():
	if timer.wait_time != Global.potatoTimer:
		timer.wait_time = Global.potatoTimer
	
	if plant.frame == 1:
		progress.value = 100
		plant.frame = 2
		plantGrown = true
	else:
		progress.value = 50
		plant.frame += 1 
		timer.start()

func grow_plant():
	plantGrowing = true
	timer.start()
	progress.visible = true
	$plant.play("potato")
	
func harvest_plant():
	for i in range(Global.potatoQuantity):
		var potato = potato_scene.instantiate()
		potato.add_to_group(get_parent().get_parent().get_groups()[0])
		potato.position = global_position + Vector2(randi_range(-3, 3), randi_range(-3, 3))
		potatoes.add_child(potato) 
		plantGrowing = false
		plantGrown = false
		$plant.play("none")
	
func reset():
	plantGrowing = false
	plantGrown = false
	progress.visible = false
	taken = false
	timer.stop()
