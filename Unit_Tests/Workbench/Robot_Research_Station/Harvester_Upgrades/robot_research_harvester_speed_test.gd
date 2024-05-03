# GdUnit generated TestSuite
class_name ResearchHarvesterSpeedTest
extends GdUnitTestSuite
@warning_ignore('unused_parameter')
@warning_ignore('return_value_discarded')

var world_scene = preload("res://World/world.tscn")

func test_harvester_speed_button_disable_true():
	Global.reset()
	
	Global.potatoCount = 0
	Global.scrapCount = 0
	
	# Price, 5 potato, 5 scrap
	RobotResearchStation.harvesterSpeedLevel = 0
	RobotResearchStation._check_if_enough(RobotResearchStation.harvesterSpeedLevel, RobotResearchStation.harvesterSpeedPrice, RobotResearchStation.harvesterSpeedButton)
	assert_bool(RobotResearchStation.harvesterSpeedButton.disabled).is_true()
	# Price, 25 potato, 25 scrap
	RobotResearchStation.harvesterSpeedLevel = 1
	RobotResearchStation._check_if_enough(RobotResearchStation.harvesterSpeedLevel, RobotResearchStation.harvesterSpeedPrice, RobotResearchStation.harvesterSpeedButton)
	assert_bool(RobotResearchStation.harvesterSpeedButton.disabled).is_true()
	# Price, 125 potato, 125 scrap
	RobotResearchStation.harvesterSpeedLevel = 2
	RobotResearchStation._check_if_enough(RobotResearchStation.harvesterSpeedLevel, RobotResearchStation.harvesterSpeedPrice, RobotResearchStation.harvesterSpeedButton)
	assert_bool(RobotResearchStation.harvesterSpeedButton.disabled).is_true()
	
	
	Global.potatoCount = 5
	Global.scrapCount = 5
	
	# Price, 5 potato, 5 scrap
	RobotResearchStation.harvesterSpeedLevel = 0
	RobotResearchStation._check_if_enough(RobotResearchStation.harvesterSpeedLevel, RobotResearchStation.harvesterSpeedPrice, RobotResearchStation.harvesterSpeedButton)
	assert_bool(RobotResearchStation.harvesterSpeedButton.disabled).is_false()
	# Price, 25 potato, 25 scrap
	RobotResearchStation.harvesterSpeedLevel = 1
	RobotResearchStation._check_if_enough(RobotResearchStation.harvesterSpeedLevel, RobotResearchStation.harvesterSpeedPrice, RobotResearchStation.harvesterSpeedButton)
	assert_bool(RobotResearchStation.harvesterSpeedButton.disabled).is_true()
	# Price, 125 potato, 125 scrap
	RobotResearchStation.harvesterSpeedLevel = 2
	RobotResearchStation._check_if_enough(RobotResearchStation.harvesterSpeedLevel, RobotResearchStation.harvesterSpeedPrice, RobotResearchStation.harvesterSpeedButton)
	assert_bool(RobotResearchStation.harvesterSpeedButton.disabled).is_true()
	
	Global.potatoCount = 25
	Global.scrapCount = 25
	
	# Price, 5 potato, 5 scrap
	RobotResearchStation.harvesterSpeedLevel = 0
	RobotResearchStation._check_if_enough(RobotResearchStation.harvesterSpeedLevel, RobotResearchStation.harvesterSpeedPrice, RobotResearchStation.harvesterSpeedButton)
	assert_bool(RobotResearchStation.harvesterSpeedButton.disabled).is_false()
	# Price, 25 potato, 25 scrap
	RobotResearchStation.harvesterSpeedLevel = 1
	RobotResearchStation._check_if_enough(RobotResearchStation.harvesterSpeedLevel, RobotResearchStation.harvesterSpeedPrice, RobotResearchStation.harvesterSpeedButton)
	assert_bool(RobotResearchStation.harvesterSpeedButton.disabled).is_false()
	# Price, 125 potato, 125 scrap
	RobotResearchStation.harvesterSpeedLevel = 2
	RobotResearchStation._check_if_enough(RobotResearchStation.harvesterSpeedLevel, RobotResearchStation.harvesterSpeedPrice, RobotResearchStation.harvesterSpeedButton)
	assert_bool(RobotResearchStation.harvesterSpeedButton.disabled).is_true()
	

func test_harvester_speed_button_disable_false():
	Global.reset()
	
	Global.potatoCount = 125
	Global.scrapCount = 125
	
	# Price, 5 potato, 5 scrap
	RobotResearchStation.harvesterSpeedLevel = 0
	RobotResearchStation._check_if_enough(RobotResearchStation.harvesterSpeedLevel, RobotResearchStation.harvesterSpeedPrice, RobotResearchStation.harvesterSpeedButton)
	assert_bool(RobotResearchStation.harvesterSpeedButton.disabled).is_false()
	
	# Price, 25 potato, 25 scrap
	RobotResearchStation.harvesterSpeedLevel = 1
	RobotResearchStation._check_if_enough(RobotResearchStation.harvesterSpeedLevel, RobotResearchStation.harvesterSpeedPrice, RobotResearchStation.harvesterSpeedButton)
	assert_bool(RobotResearchStation.harvesterSpeedButton.disabled).is_false()
	
	# Price, 125 potato, 125 scrap
	RobotResearchStation.harvesterSpeedLevel = 2
	RobotResearchStation._check_if_enough(RobotResearchStation.harvesterSpeedLevel, RobotResearchStation.harvesterSpeedPrice, RobotResearchStation.harvesterSpeedButton)
	assert_bool(RobotResearchStation.harvesterSpeedButton.disabled).is_false()


func test_update_harvester_speed_label_values():
	var world = world_scene.instantiate()
	var levelBox = RobotResearchStation.harvesterSpeedLevel1
	var starting_robots = world.get_node("robots")
	RobotShop._buy_robot(RobotShop.harvesterPrice, RobotShop.harvester_scene,RobotShop.harvester_ai_scene,starting_robots)
	var robots = world.find_child("robots").get_children()
	var harvesters = []
	for robot in robots:
		if is_instance_of(robot, harvester_robot):
			harvesters.append(robot)
	
	# Price, 5 potato, 5 scrap
	Global.upkeep = 0
	Global.robot_upkeep = 0
	RobotResearchStation.harvesterSpeedLevel = 0
	RobotResearchStation._update_to_new_button_values(harvesters, RobotResearchStation.harvesterSpeedLevel, RobotResearchStation.harvesterSpeedUpkeep, RobotResearchStation.harvesterSpeedUpkeepValues, RobotResearchStation.harvesterSpeedUpkeepLabel, RobotResearchStation.harvesterSpeedImprovements, RobotResearchStation.harvesterSpeedImprovementLabel, RobotResearchStation.harvesterSpeedButton, RobotResearchStation.harvesterSpeedResources, levelBox)
	assert_str(RobotResearchStation.harvesterSpeedPotatoPrice.text).is_equal("5")
	assert_str(RobotResearchStation.harvesterSpeedScrapPrice.text).is_equal("5")
	assert_str(RobotResearchStation.harvesterSpeedImprovementLabel.text).is_equal("Enhance robots mobility.    20   ->   30 m/s")
	assert_str(RobotResearchStation.harvesterSpeedUpkeepLabel.text).is_equal("Upkeep	    +1")
	assert_str(RobotResearchStation.totalUpkeep.text).is_equal("Upkeep:\n0   ->   2")
	
	## Price, 25 potato, 25 scrap
	Global.upkeep = 0
	Global.robot_upkeep = 0
	RobotResearchStation.harvesterSpeedLevel = 1
	RobotResearchStation._update_to_new_button_values(harvesters, RobotResearchStation.harvesterSpeedLevel, RobotResearchStation.harvesterSpeedUpkeep, RobotResearchStation.harvesterSpeedUpkeepValues, RobotResearchStation.harvesterSpeedUpkeepLabel, RobotResearchStation.harvesterSpeedImprovements, RobotResearchStation.harvesterSpeedImprovementLabel, RobotResearchStation.harvesterSpeedButton, RobotResearchStation.harvesterSpeedResources, levelBox)
	assert_str(RobotResearchStation.harvesterSpeedPotatoPrice.text).is_equal("25")
	assert_str(RobotResearchStation.harvesterSpeedScrapPrice.text).is_equal("25")
	assert_str(RobotResearchStation.harvesterSpeedImprovementLabel.text).is_equal("Enhance robots mobility.    30   ->   40 m/s")
	assert_str(RobotResearchStation.harvesterSpeedUpkeepLabel.text).is_equal("Upkeep	    +3")
	assert_str(RobotResearchStation.totalUpkeep.text).is_equal("Upkeep:\n0   ->   6")
	
	# Price, 125 potato, 125 scrap
	Global.upkeep = 0
	Global.robot_upkeep = 0
	RobotResearchStation.harvesterSpeedLevel = 2
	RobotResearchStation._update_to_new_button_values(harvesters, RobotResearchStation.harvesterSpeedLevel, RobotResearchStation.harvesterSpeedUpkeep, RobotResearchStation.harvesterSpeedUpkeepValues, RobotResearchStation.harvesterSpeedUpkeepLabel, RobotResearchStation.harvesterSpeedImprovements, RobotResearchStation.harvesterSpeedImprovementLabel, RobotResearchStation.harvesterSpeedButton, RobotResearchStation.harvesterSpeedResources, levelBox)
	assert_str(RobotResearchStation.harvesterSpeedPotatoPrice.text).is_equal("125")
	assert_str(RobotResearchStation.harvesterSpeedScrapPrice.text).is_equal("125")
	assert_str(RobotResearchStation.harvesterSpeedImprovementLabel.text).is_equal("Enhance robots mobility.    40   ->   50 m/s")
	assert_str(RobotResearchStation.harvesterSpeedUpkeepLabel.text).is_equal("Upkeep	    +9")
	assert_str(RobotResearchStation.totalUpkeep.text).is_equal("Upkeep:\n0   ->   18")

	# Maxed out
	Global.upkeep = 0
	Global.robot_upkeep = 0
	RobotResearchStation.harvesterSpeedLevel = 3
	RobotResearchStation._update_to_new_button_values(harvesters, RobotResearchStation.harvesterSpeedLevel, RobotResearchStation.harvesterSpeedUpkeep, RobotResearchStation.harvesterSpeedUpkeepValues, RobotResearchStation.harvesterSpeedUpkeepLabel, RobotResearchStation.harvesterSpeedImprovements, RobotResearchStation.harvesterSpeedImprovementLabel, RobotResearchStation.harvesterSpeedButton, RobotResearchStation.harvesterSpeedResources, levelBox)
	
	assert_bool(RobotResearchStation.totalUpkeep.visible).is_false()
	assert_bool(RobotResearchStation.harvesterSpeedUpkeepLabel.visible).is_false()
	assert_str(RobotResearchStation.harvesterSpeedImprovementLabel.text).is_equal("50 m/s")
	assert_str(RobotResearchStation.harvesterSpeedButton.text).is_equal("Maxed out")
	assert_bool(RobotResearchStation.harvesterSpeedButton.disabled).is_true()
	assert_bool(RobotResearchStation.harvesterSpeedResources.visible).is_false()

	world.queue_free()
	
func test_update_global_harvester_speed_values():
	Global.reset()
	
	Global.potatoCount = 10
	Global.scrapCount = 10
	RobotResearchStation.harvesterSpeedLevel = 0
	RobotResearchStation.harvesterSpeedLevel = RobotResearchStation._update_global_values(RobotResearchStation.harvesterSpeedPrice, RobotResearchStation.harvesterSpeedLevel)

	assert_int(Global.potatoCount).is_equal(5)
	assert_int(Global.scrapCount).is_equal(5)
	assert_int(RobotResearchStation.harvesterSpeedLevel).is_equal(1)

	Global.potatoCount = 75
	Global.scrapCount = 75
	RobotResearchStation.harvesterSpeedLevel = 1
	RobotResearchStation.harvesterSpeedLevel = RobotResearchStation._update_global_values(RobotResearchStation.harvesterSpeedPrice, RobotResearchStation.harvesterSpeedLevel)
	assert_int(Global.potatoCount).is_equal(50)
	assert_int(Global.scrapCount).is_equal(50)
	assert_int(RobotResearchStation.harvesterSpeedLevel).is_equal(2)
	
	Global.potatoCount = 625
	Global.scrapCount = 625
	RobotResearchStation.harvesterSpeedLevel = 2
	RobotResearchStation.harvesterSpeedLevel = RobotResearchStation._update_global_values(RobotResearchStation.harvesterSpeedPrice, RobotResearchStation.harvesterSpeedLevel)
	assert_int(Global.potatoCount).is_equal(500)
	assert_int(Global.scrapCount).is_equal(500)
	assert_int(RobotResearchStation.harvesterSpeedLevel).is_equal(3)
	

func test_update_harvester_speed_upkeep():
	var world = world_scene.instantiate()
	var starting_robots = world.get_node("robots")
	RobotShop._buy_robot(RobotShop.harvesterPrice, RobotShop.harvester_scene,RobotShop.harvester_ai_scene,starting_robots)
	var robots = world.find_child("robots").get_children()
	var harvesters = []
	for robot in robots:
		if is_instance_of(robot, harvester_robot):
			robot.upkeep = Global.harvesterUpkeep
			harvesters.append(robot)

	RobotResearchStation.harvesterSpeedLevel = 0
	# + 1 upkeep
	Global.harvesterUpkeep += RobotResearchStation.update_robot_upkeep(harvesters, RobotResearchStation.harvesterSpeedUpkeepValues, RobotResearchStation.harvesterSpeedLevel)	
	assert_int(Global.harvesterUpkeep).is_equal(2)
	for harvester in harvesters:
		assert_int(harvester.upkeep).is_equal(2)
	
	RobotResearchStation.harvesterSpeedLevel = 1
	# + 3 upkeep
	Global.harvesterUpkeep += RobotResearchStation.update_robot_upkeep(harvesters, RobotResearchStation.harvesterSpeedUpkeepValues, RobotResearchStation.harvesterSpeedLevel)	
	assert_int(Global.harvesterUpkeep).is_equal(5)
	for harvester in harvesters:
		assert_int(harvester.upkeep).is_equal(5)
		
	RobotResearchStation.harvesterSpeedLevel = 2
	# + 9 upkeep
	Global.harvesterUpkeep += RobotResearchStation.update_robot_upkeep(harvesters, RobotResearchStation.harvesterSpeedUpkeepValues, RobotResearchStation.harvesterSpeedLevel)	
	assert_int(Global.harvesterUpkeep).is_equal(14)
	for harvester in harvesters:
		assert_int(harvester.upkeep).is_equal(14)
		
	world.queue_free()
	
	
func test_update_each_harvesters_speed():
	var world = world_scene.instantiate()
	var starting_robots = world.get_node("robots")
	RobotShop._buy_robot(RobotShop.harvesterPrice, RobotShop.harvester_scene,RobotShop.harvester_ai_scene,starting_robots)
	var robots = world.find_child("robots").get_children()
	var harvesters = []
	for robot in robots:
		if is_instance_of(robot, harvester_robot):
			robot.speed = Global.harvesterSpeed
			harvesters.append(robot)

	RobotResearchStation.harvesterSpeedLevel = 0
	# 20 m/s
	Global.harvesterSpeed = RobotResearchStation.update_robot_speed(harvesters, RobotResearchStation.harvesterSpeedImprovementValues, RobotResearchStation.harvesterSpeedLevel)	
	assert_int(Global.harvesterSpeed).is_equal(20)
	for harvester in harvesters:
		assert_int(harvester.speed).is_equal(20)
	
	RobotResearchStation.harvesterSpeedLevel = 1
	# + 10 m/s
	Global.harvesterSpeed = RobotResearchStation.update_robot_speed(harvesters, RobotResearchStation.harvesterSpeedImprovementValues, RobotResearchStation.harvesterSpeedLevel)	
	assert_int(Global.harvesterSpeed).is_equal(30)
	for harvester in harvesters:
		assert_int(harvester.speed).is_equal(30)
		
	RobotResearchStation.harvesterSpeedLevel = 2
	# + 10 m/s
	Global.harvesterSpeed = RobotResearchStation.update_robot_speed(harvesters, RobotResearchStation.harvesterSpeedImprovementValues, RobotResearchStation.harvesterSpeedLevel)	
	assert_int(Global.harvesterSpeed).is_equal(40)
	for harvester in harvesters:
		assert_int(harvester.speed).is_equal(40)
		
	RobotResearchStation.harvesterSpeedLevel = 3
	# + 10 m/s
	Global.harvesterSpeed = RobotResearchStation.update_robot_speed(harvesters, RobotResearchStation.harvesterSpeedImprovementValues, RobotResearchStation.harvesterSpeedLevel)	
	assert_int(Global.harvesterSpeed).is_equal(50)
	for harvester in harvesters:
		assert_int(harvester.speed).is_equal(50)
		
	world.queue_free()


func test_reset_harvester_speed_values():
	Global.reset()
	
	RobotResearchStation.harvesterSpeedLevel = RobotResearchStation.reset_feature(RobotResearchStation.harvesterSpeedLevel, RobotResearchStation.harvesterSpeedButton, RobotResearchStation.harvesterSpeedResources, RobotResearchStation.harvesterSpeedUpkeepLabel, RobotResearchStation.harvesterSpeedLevel1, RobotResearchStation.harvesterSpeedLevel2, RobotResearchStation.harvesterSpeedLevel3)
	
	assert_int(RobotResearchStation.harvesterSpeedLevel).is_equal(0)
	assert_str(RobotResearchStation.harvesterSpeedButton.text).is_equal("Upgrade")
	assert_bool(RobotResearchStation.harvesterSpeedButton.disabled).is_false()
	assert_bool(RobotResearchStation.harvesterSpeedResources.visible).is_true()
	assert_bool(RobotResearchStation.harvesterSpeedUpkeepLabel.visible).is_true()
#
