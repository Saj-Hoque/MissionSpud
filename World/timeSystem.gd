extends Node2D

var second = 0
var minute = 0
var hour = 0
var day = 0

const default_time_speed = 160
var time_speed = 160

var day_processed = false

func _ready():
	time_speed = default_time_speed

func _process(delta):
	if hour == 0 and day_processed == false and time_speed > 0:
		start_new_day()
		
	if hour > 0:
		day_processed = false
		
	if time_speed > 0:
		second += (delta * time_speed)
		minute = (int(second) / 60) % 60
		hour = (int(second) / (60*60)) % 24

func start_new_day():
	second = 0
	minute = 0
	hour = 0
	day +=1 
	day_processed = true
