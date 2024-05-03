# GdUnit generated TestSuite
class_name ResearchScavengerSpeedTest
extends GdUnitTestSuite
@warning_ignore('unused_parameter')
@warning_ignore('return_value_discarded')

var world_scene = preload("res://World/world.tscn")

func test_scavenger_speed_button_disable_true():
	Global.reset()
	
	Global.potatoCount = 0
	Global.scrapCount = 0
	
	# Price, 5 potato, 5 scrap
	RobotResearchStation.scavengerSpeedLevel = 0
	RobotResearchStation._check_if_enough(RobotResearchStation.scavengerSpeedLevel, RobotResearchStation.scavengerSpeedPrice, RobotResearchStation.scavengerSpeedButton)
	assert_bool(RobotResearchStation.scavengerSpeedButton.disabled).is_true()
	# Price, 25 potato, 25 scrap
	RobotResearchStation.scavengerSpeedLevel = 1
	RobotResearchStation._check_if_enough(RobotResearchStation.scavengerSpeedLevel, RobotResearchStation.scavengerSpeedPrice, RobotResearchStation.scavengerSpeedButton)
	assert_bool(RobotResearchStation.scavengerSpeedButton.disabled).is_true()
	# Price, 125 potato, 125 scrap
	RobotResearchStation.scavengerSpeedLevel = 2
	RobotResearchStation._check_if_enough(RobotResearchStation.scavengerSpeedLevel, RobotResearchStation.scavengerSpeedPrice, RobotResearchStation.scavengerSpeedButton)
	assert_bool(RobotResearchStation.scavengerSpeedButton.disabled).is_true()
	
	
	Global.potatoCount = 5
	Global.scrapCount = 5
	
	# Price, 5 potato, 5 scrap
	RobotResearchStation.scavengerSpeedLevel = 0
	RobotResearchStation._check_if_enough(RobotResearchStation.scavengerSpeedLevel, RobotResearchStation.scavengerSpeedPrice, RobotResearchStation.scavengerSpeedButton)
	assert_bool(RobotResearchStation.scavengerSpeedButton.disabled).is_false()
	# Price, 25 potato, 25 scrap
	RobotResearchStation.scavengerSpeedLevel = 1
	RobotResearchStation._check_if_enough(RobotResearchStation.scavengerSpeedLevel, RobotResearchStation.scavengerSpeedPrice, RobotResearchStation.scavengerSpeedButton)
	assert_bool(RobotResearchStation.scavengerSpeedButton.disabled).is_true()
	# Price, 125 potato, 125 scrap
	RobotResearchStation.scavengerSpeedLevel = 2
	RobotResearchStation._check_if_enough(RobotResearchStation.scavengerSpeedLevel, RobotResearchStation.scavengerSpeedPrice, RobotResearchStation.scavengerSpeedButton)
	assert_bool(RobotResearchStation.scavengerSpeedButton.disabled).is_true()
	
	Global.potatoCount = 25
	Global.scrapCount = 25
	
	# Price, 5 potato, 5 scrap
	RobotResearchStation.scavengerSpeedLevel = 0
	RobotResearchStation._check_if_enough(RobotResearchStation.scavengerSpeedLevel, RobotResearchStation.scavengerSpeedPrice, RobotResearchStation.scavengerSpeedButton)
	assert_bool(RobotResearchStation.scavengerSpeedButton.disabled).is_false()
	# Price, 25 potato, 25 scrap
	RobotResearchStation.scavengerSpeedLevel = 1
	RobotResearchStation._check_if_enough(RobotResearchStation.scavengerSpeedLevel, RobotResearchStation.scavengerSpeedPrice, RobotResearchStation.scavengerSpeedButton)
	assert_bool(RobotResearchStation.scavengerSpeedButton.disabled).is_false()
	# Price, 125 potato, 125 scrap
	RobotResearchStation.scavengerSpeedLevel = 2
	RobotResearchStation._check_if_enough(RobotResearchStation.scavengerSpeedLevel, RobotResearchStation.scavengerSpeedPrice, RobotResearchStation.scavengerSpeedButton)
	assert_bool(RobotResearchStation.scavengerSpeedButton.disabled).is_true()
	

func test_scavenger_speed_button_disable_false():
	Global.reset()
	
	Global.potatoCount = 125
	Global.scrapCount = 125
	
	# Price, 5 potato, 5 scrap
	RobotResearchStation.scavengerSpeedLevel = 0
	RobotResearchStation._check_if_enough(RobotResearchStation.scavengerSpeedLevel, RobotResearchStation.scavengerSpeedPrice, RobotResearchStation.scavengerSpeedButton)
	assert_bool(RobotResearchStation.scavengerSpeedButton.disabled).is_false()
	
	# Price, 25 potato, 25 scrap
	RobotResearchStation.scavengerSpeedLevel = 1
	RobotResearchStation._check_if_enough(RobotResearchStation.scavengerSpeedLevel, RobotResearchStation.scavengerSpeedPrice, RobotResearchStation.scavengerSpeedButton)
	assert_bool(RobotResearchStation.scavengerSpeedButton.disabled).is_false()
	
	# Price, 125 potato, 125 scrap
	RobotResearchStation.scavengerSpeedLevel = 2
	RobotResearchStation._check_if_enough(RobotResearchStation.scavengerSpeedLevel, RobotResearchStation.scavengerSpeedPrice, RobotResearchStation.scavengerSpeedButton)
	assert_bool(RobotResearchStation.scavengerSpeedButton.disabled).is_false()


func test_update_scavenger_speed_label_values():
	var world = world_scene.instantiate()
	var levelBox = RobotResearchStation.scavengerSpeedLevel1
	var starting_robots = world.get_node("robots")
	RobotShop._buy_robot(RobotShop.scavengerPrice, RobotShop.scavenger_scene,RobotShop.scavenger_ai_scene,starting_robots)
	var robots = world.find_child("robots").get_children()
	var scavengers = []
	for robot in robots:
		if is_instance_of(robot, scavenger_robot):
			scavengers.append(robot)
	
	# Price, 5 potato, 5 scrap
	Global.upkeep = 0
	Global.robot_upkeep = 0
	RobotResearchStation.scavengerSpeedLevel = 0
	RobotResearchStation._update_to_new_button_values(scavengers, RobotResearchStation.scavengerSpeedLevel, RobotResearchStation.scavengerSpeedUpkeep, RobotResearchStation.scavengerSpeedUpkeepValues, RobotResearchStation.scavengerSpeedUpkeepLabel, RobotResearchStation.scavengerSpeedImprovements, RobotResearchStation.scavengerSpeedImprovementLabel, RobotResearchStation.scavengerSpeedButton, RobotResearchStation.scavengerSpeedResources, levelBox)
	assert_str(RobotResearchStation.scavengerSpeedPotatoPrice.text).is_equal("5")
	assert_str(RobotResearchStation.scavengerSpeedScrapPrice.text).is_equal("5")
	assert_str(RobotResearchStation.scavengerSpeedImprovementLabel.text).is_equal("Enhance robots mobility.    50   ->   60 m/s")
	assert_str(RobotResearchStation.scavengerSpeedUpkeepLabel.text).is_equal("Upkeep	    +1")
	assert_str(RobotResearchStation.totalUpkeep.text).is_equal("Upkeep:\n0   ->   2")
	
	## Price, 25 potato, 25 scrap
	Global.upkeep = 0
	Global.robot_upkeep = 0
	RobotResearchStation.scavengerSpeedLevel = 1
	RobotResearchStation._update_to_new_button_values(scavengers, RobotResearchStation.scavengerSpeedLevel, RobotResearchStation.scavengerSpeedUpkeep, RobotResearchStation.scavengerSpeedUpkeepValues, RobotResearchStation.scavengerSpeedUpkeepLabel, RobotResearchStation.scavengerSpeedImprovements, RobotResearchStation.scavengerSpeedImprovementLabel, RobotResearchStation.scavengerSpeedButton, RobotResearchStation.scavengerSpeedResources, levelBox)
	assert_str(RobotResearchStation.scavengerSpeedPotatoPrice.text).is_equal("25")
	assert_str(RobotResearchStation.scavengerSpeedScrapPrice.text).is_equal("25")
	assert_str(RobotResearchStation.scavengerSpeedImprovementLabel.text).is_equal("Enhance robots mobility.    60   ->   70 m/s")
	assert_str(RobotResearchStation.scavengerSpeedUpkeepLabel.text).is_equal("Upkeep	    +3")
	assert_str(RobotResearchStation.totalUpkeep.text).is_equal("Upkeep:\n0   ->   6")
	
	# Price, 125 potato, 125 scrap
	Global.upkeep = 0
	Global.robot_upkeep = 0
	RobotResearchStation.scavengerSpeedLevel = 2
	RobotResearchStation._update_to_new_button_values(scavengers, RobotResearchStation.scavengerSpeedLevel, RobotResearchStation.scavengerSpeedUpkeep, RobotResearchStation.scavengerSpeedUpkeepValues, RobotResearchStation.scavengerSpeedUpkeepLabel, RobotResearchStation.scavengerSpeedImprovements, RobotResearchStation.scavengerSpeedImprovementLabel, RobotResearchStation.scavengerSpeedButton, RobotResearchStation.scavengerSpeedResources, levelBox)
	assert_str(RobotResearchStation.scavengerSpeedPotatoPrice.text).is_equal("125")
	assert_str(RobotResearchStation.scavengerSpeedScrapPrice.text).is_equal("125")
	assert_str(RobotResearchStation.scavengerSpeedImprovementLabel.text).is_equal("Enhance robots mobility.    70   ->   80 m/s")
	assert_str(RobotResearchStation.scavengerSpeedUpkeepLabel.text).is_equal("Upkeep	    +9")
	assert_str(RobotResearchStation.totalUpkeep.text).is_equal("Upkeep:\n0   ->   18")

	# Maxed out
	Global.upkeep = 0
	Global.robot_upkeep = 0
	RobotResearchStation.scavengerSpeedLevel = 3
	RobotResearchStation._update_to_new_button_values(scavengers, RobotResearchStation.scavengerSpeedLevel, RobotResearchStation.scavengerSpeedUpkeep, RobotResearchStation.scavengerSpeedUpkeepValues, RobotResearchStation.scavengerSpeedUpkeepLabel, RobotResearchStation.scavengerSpeedImprovements, RobotResearchStation.scavengerSpeedImprovementLabel, RobotResearchStation.scavengerSpeedButton, RobotResearchStation.scavengerSpeedResources, levelBox)
	
	assert_bool(RobotResearchStation.totalUpkeep.visible).is_false()
	assert_bool(RobotResearchStation.scavengerSpeedUpkeepLabel.visible).is_false()
	assert_str(RobotResearchStation.scavengerSpeedImprovementLabel.text).is_equal("80 m/s")
	assert_str(RobotResearchStation.scavengerSpeedButton.text).is_equal("Maxed out")
	assert_bool(RobotResearchStation.scavengerSpeedButton.disabled).is_true()
	assert_bool(RobotResearchStation.scavengerSpeedResources.visible).is_false()

	world.queue_free()
	
func test_update_global_scavenger_speed_values():
	Global.reset()
	
	Global.potatoCount = 10
	Global.scrapCount = 10
	RobotResearchStation.scavengerSpeedLevel = 0
	RobotResearchStation.scavengerSpeedLevel = RobotResearchStation._update_global_values(RobotResearchStation.scavengerSpeedPrice, RobotResearchStation.scavengerSpeedLevel)

	assert_int(Global.potatoCount).is_equal(5)
	assert_int(Global.scrapCount).is_equal(5)
	assert_int(RobotResearchStation.scavengerSpeedLevel).is_equal(1)

	Global.potatoCount = 75
	Global.scrapCount = 75
	RobotResearchStation.scavengerSpeedLevel = 1
	RobotResearchStation.scavengerSpeedLevel = RobotResearchStation._update_global_values(RobotResearchStation.scavengerSpeedPrice, RobotResearchStation.scavengerSpeedLevel)
	assert_int(Global.potatoCount).is_equal(50)
	assert_int(Global.scrapCount).is_equal(50)
	assert_int(RobotResearchStation.scavengerSpeedLevel).is_equal(2)
	
	Global.potatoCount = 625
	Global.scrapCount = 625
	RobotResearchStation.scavengerSpeedLevel = 2
	RobotResearchStation.scavengerSpeedLevel = RobotResearchStation._update_global_values(RobotResearchStation.scavengerSpeedPrice, RobotResearchStation.scavengerSpeedLevel)
	assert_int(Global.potatoCount).is_equal(500)
	assert_int(Global.scrapCount).is_equal(500)
	assert_int(RobotResearchStation.scavengerSpeedLevel).is_equal(3)
	

func test_update_scavenger_speed_upkeep():
	var world = world_scene.instantiate()
	var starting_robots = world.get_node("robots")
	RobotShop._buy_robot(RobotShop.scavengerPrice, RobotShop.scavenger_scene,RobotShop.scavenger_ai_scene,starting_robots)
	var robots = world.find_child("robots").get_children()
	var scavengers = []
	for robot in robots:
		if is_instance_of(robot, scavenger_robot):
			robot.upkeep = Global.scavengerUpkeep
			scavengers.append(robot)

	RobotResearchStation.scavengerSpeedLevel = 0
	# + 1 upkeep
	Global.scavengerUpkeep += RobotResearchStation.update_robot_upkeep(scavengers, RobotResearchStation.scavengerSpeedUpkeepValues, RobotResearchStation.scavengerSpeedLevel)	
	assert_int(Global.scavengerUpkeep).is_equal(2)
	for scavenger in scavengers:
		assert_int(scavenger.upkeep).is_equal(2)
	
	RobotResearchStation.scavengerSpeedLevel = 1
	# + 3 upkeep
	Global.scavengerUpkeep += RobotResearchStation.update_robot_upkeep(scavengers, RobotResearchStation.scavengerSpeedUpkeepValues, RobotResearchStation.scavengerSpeedLevel)	
	assert_int(Global.scavengerUpkeep).is_equal(5)
	for scavenger in scavengers:
		assert_int(scavenger.upkeep).is_equal(5)
		
	RobotResearchStation.scavengerSpeedLevel = 2
	# + 9 upkeep
	Global.scavengerUpkeep += RobotResearchStation.update_robot_upkeep(scavengers, RobotResearchStation.scavengerSpeedUpkeepValues, RobotResearchStation.scavengerSpeedLevel)	
	assert_int(Global.scavengerUpkeep).is_equal(14)
	for scavenger in scavengers:
		assert_int(scavenger.upkeep).is_equal(14)
		
	world.queue_free()
	
	
func test_update_each_scavengers_speed():
	var world = world_scene.instantiate()
	var starting_robots = world.get_node("robots")
	RobotShop._buy_robot(RobotShop.scavengerPrice, RobotShop.scavenger_scene,RobotShop.scavenger_ai_scene,starting_robots)
	var robots = world.find_child("robots").get_children()
	var scavengers = []
	for robot in robots:
		if is_instance_of(robot, scavenger_robot):
			robot.speed = Global.scavengerSpeed
			scavengers.append(robot)

	RobotResearchStation.scavengerSpeedLevel = 0
	# 50 m/s
	Global.scavengerSpeed = RobotResearchStation.update_robot_speed(scavengers, RobotResearchStation.scavengerSpeedImprovementValues, RobotResearchStation.scavengerSpeedLevel)	
	assert_int(Global.scavengerSpeed).is_equal(50)
	for scavenger in scavengers:
		assert_int(scavenger.speed).is_equal(50)
	
	RobotResearchStation.scavengerSpeedLevel = 1
	# + 10 m/s
	Global.scavengerSpeed = RobotResearchStation.update_robot_speed(scavengers, RobotResearchStation.scavengerSpeedImprovementValues, RobotResearchStation.scavengerSpeedLevel)	
	assert_int(Global.scavengerSpeed).is_equal(60)
	for scavenger in scavengers:
		assert_int(scavenger.speed).is_equal(60)
		
	RobotResearchStation.scavengerSpeedLevel = 2
	# + 10 m/s
	Global.scavengerSpeed = RobotResearchStation.update_robot_speed(scavengers, RobotResearchStation.scavengerSpeedImprovementValues, RobotResearchStation.scavengerSpeedLevel)	
	assert_int(Global.scavengerSpeed).is_equal(70)
	for scavenger in scavengers:
		assert_int(scavenger.speed).is_equal(70)
		
	RobotResearchStation.scavengerSpeedLevel = 3
	# + 10 m/s
	Global.scavengerSpeed = RobotResearchStation.update_robot_speed(scavengers, RobotResearchStation.scavengerSpeedImprovementValues, RobotResearchStation.scavengerSpeedLevel)	
	assert_int(Global.scavengerSpeed).is_equal(80)
	for scavenger in scavengers:
		assert_int(scavenger.speed).is_equal(80)
		
	world.queue_free()


func test_reset_scavenger_speed_values():
	Global.reset()
	
	RobotResearchStation.scavengerSpeedLevel = RobotResearchStation.reset_feature(RobotResearchStation.scavengerSpeedLevel, RobotResearchStation.scavengerSpeedButton, RobotResearchStation.scavengerSpeedResources, RobotResearchStation.scavengerSpeedUpkeepLabel, RobotResearchStation.scavengerSpeedLevel1, RobotResearchStation.scavengerSpeedLevel2, RobotResearchStation.scavengerSpeedLevel3)
	
	assert_int(RobotResearchStation.scavengerSpeedLevel).is_equal(0)
	assert_str(RobotResearchStation.scavengerSpeedButton.text).is_equal("Upgrade")
	assert_bool(RobotResearchStation.scavengerSpeedButton.disabled).is_false()
	assert_bool(RobotResearchStation.scavengerSpeedResources.visible).is_true()
	assert_bool(RobotResearchStation.scavengerSpeedUpkeepLabel.visible).is_true()
#
