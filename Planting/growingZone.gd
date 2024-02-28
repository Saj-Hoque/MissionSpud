extends StaticBody2D

var plantGrowing = false
var plantGrown = false

func _on_area_2d_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("leftClick"):	
		if not plantGrowing:
			plantGrowing = true
			$potatoTimer.start()
			$plant.play("potato")
		elif plantGrown:
			Global.potatoCount += 1
			plantGrowing = false
			plantGrown = false
			$plant.play("none")
			print(str(Global.potatoCount))		
		else:
			print("PLANT IS ALREADY GROWING HERE FAM")

func _on_potato_timer_timeout():
	var plant = $plant	
	if plant.frame == 1:
		plant.frame = 2
		plantGrown = true
	else:
		plant.frame += 1 
		$potatoTimer.start()
