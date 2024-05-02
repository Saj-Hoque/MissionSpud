# GdUnit generated TestSuite
class_name LoseTest
extends GdUnitTestSuite
@warning_ignore('unused_parameter')
@warning_ignore('return_value_discarded')

# SCENARIO 1 - OUT OF UPKEEP

func test_upkeep_lose_true():
	Global.reset()
	Global.potatoCount = 100
	Global.upkeep = 60
	Global.robot_upkeep = 80
	
	Upkeep.update()
	var lose = Upkeep.below_count()
	# Upkeep should be -40 - which will lead to a lose scenario - return true
	
	Global.reset()
	
	assert_bool(lose).is_true()

func test_upkeep_lose_true_border():
	Global.reset()
	Global.potatoCount = 100
	Global.upkeep = 50
	Global.robot_upkeep = 51
	
	Upkeep.update()
	var lose = Upkeep.below_count()
	# Upkeep should be -1 - which will lead to a lose scenario - return true
	
	Global.reset()
	
	assert_bool(lose).is_true()
	
	
func test_upkeep_lose_false():
	Global.reset()
	Global.potatoCount = 100
	Global.upkeep = 30
	Global.robot_upkeep = 40
	
	Upkeep.update()
	var lose = Upkeep.below_count()
	# Upkeep should be 30 - which will not lead to a lose scenario - return false
	
	Global.reset()
	
	assert_bool(lose).is_false()
	
func test_upkeep_lose_false_border():
	Global.reset()
	Global.potatoCount = 100
	Global.upkeep = 30
	Global.robot_upkeep = 70
	
	Upkeep.update()
	var lose = Upkeep.below_count()
	# Upkeep should be 0 - which will not lead to a lose scenario - return false
	
	Global.reset()
	
	assert_bool(lose).is_false()
	
	
# SCENARIO 2 - OUT OF TIME

func test_time_lose_true():
	TimeSystem.reset()
	TimeSystem.day = 21
	
	var day = TimeSystem.is_final_day()
	# Day is 21 - which will lead to a lose scenario - return true
	
	TimeSystem.reset()
	assert_bool(day).is_true()

func test_time_lose_false():
	TimeSystem.reset()
	
	var day = TimeSystem.is_final_day()
	# Day is 0 - which will not lead to a lose scenario - return false
	
	TimeSystem.reset()
	assert_bool(day).is_false()

func test_time_lose_false_border():
	TimeSystem.reset()
	TimeSystem.day = 20
	
	var day = TimeSystem.is_final_day()
	# Day is 20 - which will not lead to a lose scenario - return false
	
	TimeSystem.reset()
	assert_bool(day).is_false()

