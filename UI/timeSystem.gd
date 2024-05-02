extends Node2D

var second = 0
var minute = 0
var hour = 0
var day = 0

const FINAL_DAY = 21
const DEFAULT_TIME_SPEED = 720 # 2 minute day
var time_speed = 720

var day_processed = false
var upkeep_alert = false
var upkeep_message = false

func _ready():
	time_speed = DEFAULT_TIME_SPEED
	
func reset():
	second = 0
	minute = 0
	hour = 0
	day = 1
	day_processed = true


func _process(delta):
	if Global.running:
		if is_new_day():
			start_new_day()
			Upkeep.update()
			# Check Lose Scenario 1 - Upkeep (Out of Potatoes)
			WinLoseScenario.check_if_lose_game_upkeep()
			# Check Lose Scenario 2 - Out of Time
			WinLoseScenario.check_if_lose_game_time()
		if hour > 0:
			day_processed = false

		upkeep_alert = true if hour == 22 else false
		upkeep_message = true if hour == 23 else false
		
		second += (delta * time_speed)
		minute = (int(second) / 60) % 60
		hour = (int(second) / (60*60)) % 24

func is_new_day():
	if hour == 0 and day_processed == false:
		return true
	else:
		return false

func start_new_day():
	second = 0
	minute = 0
	hour = 0
	day +=1 
	day_processed = true

func is_final_day():
	if day == FINAL_DAY:
		return true
	else:
		return false
