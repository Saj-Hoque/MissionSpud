# GdUnit generated TestSuite
class_name ResearchCollectorRangeTest
extends GdUnitTestSuite
@warning_ignore('unused_parameter')
@warning_ignore('return_value_discarded')

var world_scene = preload("res://World/world.tscn")

func test_collector_range_button_disable_true():
	Global.reset()
	
	Global.potatoCount = 0
	Global.scrapCount = 0
	
	# Price, 40 potato, 40 scrap
	RobotResearchStation.collectorRangeLevel = 0
	RobotResearchStation._check_if_enough(RobotResearchStation.collectorRangeLevel, RobotResearchStation.collectorRangePrice, RobotResearchStation.collectorRangeButton)
	assert_bool(RobotResearchStation.collectorRangeButton.disabled).is_true()
	# Price, 200 potato, 200 scrap
	RobotResearchStation.collectorRangeLevel = 1
	RobotResearchStation._check_if_enough(RobotResearchStation.collectorRangeLevel, RobotResearchStation.collectorRangePrice, RobotResearchStation.collectorRangeButton)
	assert_bool(RobotResearchStation.collectorRangeButton.disabled).is_true()
	# Price, 500 potato, 500 scrap
	RobotResearchStation.collectorRangeLevel = 2
	RobotResearchStation._check_if_enough(RobotResearchStation.collectorRangeLevel, RobotResearchStation.collectorRangePrice, RobotResearchStation.collectorRangeButton)
	assert_bool(RobotResearchStation.collectorRangeButton.disabled).is_true()
	
	
	Global.potatoCount = 40
	Global.scrapCount = 40
	
	# Price, 40 potato, 40 scrap
	RobotResearchStation.collectorRangeLevel = 0
	RobotResearchStation._check_if_enough(RobotResearchStation.collectorRangeLevel, RobotResearchStation.collectorRangePrice, RobotResearchStation.collectorRangeButton)
	assert_bool(RobotResearchStation.collectorRangeButton.disabled).is_false()
	# Price, 200 potato, 200 scrap
	RobotResearchStation.collectorRangeLevel = 1
	RobotResearchStation._check_if_enough(RobotResearchStation.collectorRangeLevel, RobotResearchStation.collectorRangePrice, RobotResearchStation.collectorRangeButton)
	assert_bool(RobotResearchStation.collectorRangeButton.disabled).is_true()
	# Price, 500 potato, 500 scrap
	RobotResearchStation.collectorRangeLevel = 2
	RobotResearchStation._check_if_enough(RobotResearchStation.collectorRangeLevel, RobotResearchStation.collectorRangePrice, RobotResearchStation.collectorRangeButton)
	assert_bool(RobotResearchStation.collectorRangeButton.disabled).is_true()
	
	Global.potatoCount = 200
	Global.scrapCount = 200
	
	# Price, 40 potato, 40 scrap
	RobotResearchStation.collectorRangeLevel = 0
	RobotResearchStation._check_if_enough(RobotResearchStation.collectorRangeLevel, RobotResearchStation.collectorRangePrice, RobotResearchStation.collectorRangeButton)
	assert_bool(RobotResearchStation.collectorRangeButton.disabled).is_false()
	# Price, 200 potato, 200 scrap
	RobotResearchStation.collectorRangeLevel = 1
	RobotResearchStation._check_if_enough(RobotResearchStation.collectorRangeLevel, RobotResearchStation.collectorRangePrice, RobotResearchStation.collectorRangeButton)
	assert_bool(RobotResearchStation.collectorRangeButton.disabled).is_false()
	# Price, 500 potato, 500 scrap
	RobotResearchStation.collectorRangeLevel = 2
	RobotResearchStation._check_if_enough(RobotResearchStation.collectorRangeLevel, RobotResearchStation.collectorRangePrice, RobotResearchStation.collectorRangeButton)
	assert_bool(RobotResearchStation.collectorRangeButton.disabled).is_true()
	

func test_collector_range_button_disable_false():
	Global.reset()
	
	Global.potatoCount = 500
	Global.scrapCount = 500
	
	# Price, 40 potato, 40 scrap
	RobotResearchStation.collectorRangeLevel = 0
	RobotResearchStation._check_if_enough(RobotResearchStation.collectorRangeLevel, RobotResearchStation.collectorRangePrice, RobotResearchStation.collectorRangeButton)
	assert_bool(RobotResearchStation.collectorRangeButton.disabled).is_false()
	
	# Price, 200 potato, 200 scrap
	RobotResearchStation.collectorRangeLevel = 1
	RobotResearchStation._check_if_enough(RobotResearchStation.collectorRangeLevel, RobotResearchStation.collectorRangePrice, RobotResearchStation.collectorRangeButton)
	assert_bool(RobotResearchStation.collectorRangeButton.disabled).is_false()
	
	# Price, 500 potato, 500 scrap
	RobotResearchStation.collectorRangeLevel = 2
	RobotResearchStation._check_if_enough(RobotResearchStation.collectorRangeLevel, RobotResearchStation.collectorRangePrice, RobotResearchStation.collectorRangeButton)
	assert_bool(RobotResearchStation.collectorRangeButton.disabled).is_false()


func test_update_collector_range_label_values():
	var world = world_scene.instantiate()
	var levelBox = RobotResearchStation.collectorRangeLevel1
	var starting_robots = world.get_node("robots")
	RobotShop._buy_robot(RobotShop.collectorPrice, RobotShop.collector_scene,RobotShop.collector_ai_scene,starting_robots)
	var robots = world.find_child("robots").get_children()
	var collectors = []
	for robot in robots:
		if is_instance_of(robot, collector_robot):
			collectors.append(robot)
	
	# Price, 40 potato, 40 scrap
	Global.upkeep = 0
	Global.robot_upkeep = 0
	RobotResearchStation.collectorRangeLevel = 0
	RobotResearchStation._update_to_new_button_values(collectors, RobotResearchStation.collectorRangeLevel, RobotResearchStation.collectorRangeUpkeep, RobotResearchStation.collectorRangeUpkeepValues, RobotResearchStation.collectorRangeUpkeepLabel, RobotResearchStation.collectorRangeImprovements, RobotResearchStation.collectorRangeImprovementLabel, RobotResearchStation.collectorRangeButton, RobotResearchStation.collectorRangeResources, levelBox)
	assert_str(RobotResearchStation.collectorRangePotatoPrice.text).is_equal("40")
	assert_str(RobotResearchStation.collectorRangeScrapPrice.text).is_equal("40")
	assert_str(RobotResearchStation.collectorRangeImprovementLabel.text).is_equal("Increase collecting radius.    1m")
	assert_str(RobotResearchStation.collectorRangeUpkeepLabel.text).is_equal("Upkeep	    +4")
	assert_str(RobotResearchStation.totalUpkeep.text).is_equal("Upkeep:\n0   ->   4")
	
	## Price, 200 potato, 200 scrap
	Global.upkeep = 0
	Global.robot_upkeep = 0
	RobotResearchStation.collectorRangeLevel = 1
	RobotResearchStation._update_to_new_button_values(collectors, RobotResearchStation.collectorRangeLevel, RobotResearchStation.collectorRangeUpkeep, RobotResearchStation.collectorRangeUpkeepValues, RobotResearchStation.collectorRangeUpkeepLabel, RobotResearchStation.collectorRangeImprovements, RobotResearchStation.collectorRangeImprovementLabel, RobotResearchStation.collectorRangeButton, RobotResearchStation.collectorRangeResources, levelBox)
	assert_str(RobotResearchStation.collectorRangePotatoPrice.text).is_equal("200")
	assert_str(RobotResearchStation.collectorRangeScrapPrice.text).is_equal("200")
	assert_str(RobotResearchStation.collectorRangeImprovementLabel.text).is_equal("Increase collecting radius.    2m")
	assert_str(RobotResearchStation.collectorRangeUpkeepLabel.text).is_equal("Upkeep	    +16")
	assert_str(RobotResearchStation.totalUpkeep.text).is_equal("Upkeep:\n0   ->   16")
	
	# Price, 500 potato, 500 scrap
	Global.upkeep = 0
	Global.robot_upkeep = 0
	RobotResearchStation.collectorRangeLevel = 2
	RobotResearchStation._update_to_new_button_values(collectors, RobotResearchStation.collectorRangeLevel, RobotResearchStation.collectorRangeUpkeep, RobotResearchStation.collectorRangeUpkeepValues, RobotResearchStation.collectorRangeUpkeepLabel, RobotResearchStation.collectorRangeImprovements, RobotResearchStation.collectorRangeImprovementLabel, RobotResearchStation.collectorRangeButton, RobotResearchStation.collectorRangeResources, levelBox)
	assert_str(RobotResearchStation.collectorRangePotatoPrice.text).is_equal("500")
	assert_str(RobotResearchStation.collectorRangeScrapPrice.text).is_equal("500")
	assert_str(RobotResearchStation.collectorRangeImprovementLabel.text).is_equal("Increase collecting radius.    3m")
	assert_str(RobotResearchStation.collectorRangeUpkeepLabel.text).is_equal("Upkeep	    +64")
	assert_str(RobotResearchStation.totalUpkeep.text).is_equal("Upkeep:\n0   ->   64")

	# Maxed out
	Global.upkeep = 0
	Global.robot_upkeep = 0
	RobotResearchStation.collectorRangeLevel = 3
	RobotResearchStation._update_to_new_button_values(collectors, RobotResearchStation.collectorRangeLevel, RobotResearchStation.collectorRangeUpkeep, RobotResearchStation.collectorRangeUpkeepValues, RobotResearchStation.collectorRangeUpkeepLabel, RobotResearchStation.collectorRangeImprovements, RobotResearchStation.collectorRangeImprovementLabel, RobotResearchStation.collectorRangeButton, RobotResearchStation.collectorRangeResources, levelBox)
	
	assert_bool(RobotResearchStation.totalUpkeep.visible).is_false()
	assert_bool(RobotResearchStation.collectorRangeUpkeepLabel.visible).is_false()
	assert_str(RobotResearchStation.collectorRangeImprovementLabel.text).is_equal("4m")
	assert_str(RobotResearchStation.collectorRangeButton.text).is_equal("Maxed out")
	assert_bool(RobotResearchStation.collectorRangeButton.disabled).is_true()
	assert_bool(RobotResearchStation.collectorRangeResources.visible).is_false()

	world.queue_free()


func test_update_global_collector_range_values():
	Global.reset()
	
	Global.potatoCount = 45
	Global.scrapCount = 45
	RobotResearchStation.collectorRangeLevel = 0
	RobotResearchStation.collectorRangeLevel = RobotResearchStation._update_global_values(RobotResearchStation.collectorRangePrice, RobotResearchStation.collectorRangeLevel)

	assert_int(Global.potatoCount).is_equal(5)
	assert_int(Global.scrapCount).is_equal(5)
	assert_int(RobotResearchStation.collectorRangeLevel).is_equal(1)

	Global.potatoCount = 250
	Global.scrapCount = 250
	RobotResearchStation.collectorRangeLevel = 1
	RobotResearchStation.collectorRangeLevel = RobotResearchStation._update_global_values(RobotResearchStation.collectorRangePrice, RobotResearchStation.collectorRangeLevel)
	assert_int(Global.potatoCount).is_equal(50)
	assert_int(Global.scrapCount).is_equal(50)
	assert_int(RobotResearchStation.collectorRangeLevel).is_equal(2)
	
	Global.potatoCount = 1000
	Global.scrapCount = 1000
	RobotResearchStation.collectorRangeLevel = 2
	RobotResearchStation.collectorRangeLevel = RobotResearchStation._update_global_values(RobotResearchStation.collectorRangePrice, RobotResearchStation.collectorRangeLevel)
	assert_int(Global.potatoCount).is_equal(500)
	assert_int(Global.scrapCount).is_equal(500)
	assert_int(RobotResearchStation.collectorRangeLevel).is_equal(3)
	

func test_update_collector_range_upkeep():
	var world = world_scene.instantiate()
	var starting_robots = world.get_node("robots")
	RobotShop._buy_robot(RobotShop.collectorPrice, RobotShop.collector_scene,RobotShop.collector_ai_scene,starting_robots)
	var robots = world.find_child("robots").get_children()
	var collectors = []
	for robot in robots:
		if is_instance_of(robot, collector_robot):
			robot.upkeep = Global.collectorUpkeep
			collectors.append(robot)

	RobotResearchStation.collectorRangeLevel = 0
	# + 4 upkeep
	Global.collectorUpkeep += RobotResearchStation.update_robot_upkeep(collectors, RobotResearchStation.collectorRangeUpkeepValues, RobotResearchStation.collectorRangeLevel)	
	assert_int(Global.collectorUpkeep).is_equal(5)
	for collector in collectors:
		assert_int(collector.upkeep).is_equal(5)
	
	RobotResearchStation.collectorRangeLevel = 1
	# + 16 upkeep
	Global.collectorUpkeep += RobotResearchStation.update_robot_upkeep(collectors, RobotResearchStation.collectorRangeUpkeepValues, RobotResearchStation.collectorRangeLevel)	
	assert_int(Global.collectorUpkeep).is_equal(21)
	for collector in collectors:
		assert_int(collector.upkeep).is_equal(21)
		
	RobotResearchStation.collectorRangeLevel = 2
	# + 64 upkeep
	Global.collectorUpkeep += RobotResearchStation.update_robot_upkeep(collectors, RobotResearchStation.collectorRangeUpkeepValues, RobotResearchStation.collectorRangeLevel)	
	assert_int(Global.collectorUpkeep).is_equal(85)
	for collector in collectors:
		assert_int(collector.upkeep).is_equal(85)
		
	world.queue_free()
	
	
func test_update_each_collectors_range():
	var world = world_scene.instantiate()
	var starting_robots = world.get_node("robots")
	RobotShop._buy_robot(RobotShop.collectorPrice, RobotShop.collector_scene,RobotShop.collector_ai_scene,starting_robots)
	var robots = world.find_child("robots").get_children()
	var collectors = []
	for robot in robots:
		if is_instance_of(robot, collector_robot):
			robot.range = Global.collectorRange
			collectors.append(robot)

	RobotResearchStation.collectorRangeLevel = 0
	# 1
	Global.collectorRange = RobotResearchStation.update_robot_range(collectors, RobotResearchStation.collectorRangeImprovementValues, RobotResearchStation.collectorRangeLevel)	
	assert_int(Global.collectorRange).is_equal(1)
	for collector in collectors:
		assert_int(collector.range).is_equal(1)
		
	RobotResearchStation.collectorRangeLevel = 1
	# + 1
	Global.collectorRange = RobotResearchStation.update_robot_range(collectors, RobotResearchStation.collectorRangeImprovementValues, RobotResearchStation.collectorRangeLevel)	
	assert_int(Global.collectorRange).is_equal(2)
	for collector in collectors:
		assert_int(collector.range).is_equal(2)
		
	RobotResearchStation.collectorRangeLevel = 2
	# + 1
	Global.collectorRange = RobotResearchStation.update_robot_range(collectors, RobotResearchStation.collectorRangeImprovementValues, RobotResearchStation.collectorRangeLevel)	
	assert_int(Global.collectorRange).is_equal(3)
	for collector in collectors:
		assert_int(collector.range).is_equal(3)
		
	RobotResearchStation.collectorRangeLevel = 3
	# + 1
	Global.collectorRange = RobotResearchStation.update_robot_range(collectors, RobotResearchStation.collectorRangeImprovementValues, RobotResearchStation.collectorRangeLevel)	
	assert_int(Global.collectorRange).is_equal(4)
	for collector in collectors:
		assert_int(collector.range).is_equal(4)
	
	world.queue_free()


func test_reset_collector_range_values():
	Global.reset()
	
	RobotResearchStation.collectorRangeLevel = RobotResearchStation.reset_feature(RobotResearchStation.collectorRangeLevel, RobotResearchStation.collectorRangeButton, RobotResearchStation.collectorRangeResources, RobotResearchStation.collectorRangeUpkeepLabel, RobotResearchStation.collectorRangeLevel1, RobotResearchStation.collectorRangeLevel2, RobotResearchStation.collectorRangeLevel3)
	
	assert_int(RobotResearchStation.collectorRangeLevel).is_equal(0)
	assert_str(RobotResearchStation.collectorRangeButton.text).is_equal("Upgrade")
	assert_bool(RobotResearchStation.collectorRangeButton.disabled).is_false()
	assert_bool(RobotResearchStation.collectorRangeResources.visible).is_true()
	assert_bool(RobotResearchStation.collectorRangeUpkeepLabel.visible).is_true()
#
