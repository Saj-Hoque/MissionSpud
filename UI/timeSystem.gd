extends Node2D



var second = 0
var minute = 0
var hour = 0
var day = 0

const FINAL_DAY = 21
const DEFAULT_TIME_SPEED = 360 # 4 minute day
var time_speed = 360

var day_processed = false
var upkeep_imminent = false

func _ready():
	time_speed = DEFAULT_TIME_SPEED
	
func reset():
	second = 0
	minute = 0
	hour = 0
	day = 1
	day_processed = true

func _process(delta):
	if hour == 0 and day_processed == false and time_speed > 0:
		start_new_day()
		apply_upkeep()
		check_day()
	if hour > 0:
		day_processed = false

	
	upkeep_imminent = true if hour >= 22 else false

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
	
func apply_upkeep():
	Global.potatoCount -= (Global.upkeep + Global.robot_upkeep)
	if Global.potatoCount < 0:
		SelectionManager.reset()
		get_tree().change_scene_to_file("res://UI/loseScreen1.tscn")

func check_day():
	if day == FINAL_DAY:
		Global.totalRobots = (get_tree().get_nodes_in_group("robots")).size()
		SelectionManager.reset()
		get_tree().change_scene_to_file("res://UI/loseScreen2.tscn")
