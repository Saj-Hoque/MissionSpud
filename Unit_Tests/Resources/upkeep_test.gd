# GdUnit generated TestSuite
class_name UpkeepTest
extends GdUnitTestSuite
@warning_ignore('unused_parameter')
@warning_ignore('return_value_discarded')

func test_update_upkeep_true():
	Global.reset()
	Global.potatoCount = 100
	Global.upkeep = 30
	Global.robot_upkeep = 40
	
	Upkeep.update()
	var updated_upkeep = Global.potatoCount
	# Upkeep should be 30
	
	Global.reset()
	
	assert_int(updated_upkeep).is_equal(30)

func test_update_upkeep_true_negative():
	Global.reset()
	Global.potatoCount = 100
	Global.upkeep = 40
	Global.robot_upkeep = 80
	
	Upkeep.update()
	var updated_upkeep = Global.potatoCount
	# Upkeep should be -20
	
	Global.reset()
	
	assert_int(updated_upkeep).is_equal(-20)

func test_update_upkeep_false():
	Global.reset()
	Global.potatoCount = 100
	Global.upkeep = 30
	Global.robot_upkeep = 40
	
	Upkeep.update()
	var updated_upkeep = Global.potatoCount
	# Upkeep should be 30
	
	Global.reset()
	
	assert_int(updated_upkeep).is_not_equal(29)
	assert_int(updated_upkeep).is_not_equal(31)

func test_update_upkeep_false_negative():
	Global.reset()
	Global.potatoCount = 100
	Global.upkeep = 40
	Global.robot_upkeep = 80
	
	Upkeep.update()
	var updated_upkeep = Global.potatoCount
	# Upkeep should be -20
	
	Global.reset()
	
	assert_int(updated_upkeep).is_not_equal(-21)
	assert_int(updated_upkeep).is_not_equal(-19)

