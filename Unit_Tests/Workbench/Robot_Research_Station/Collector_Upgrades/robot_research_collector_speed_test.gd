# GdUnit generated TestSuite
class_name ResearchCollectorSpeedTest
extends GdUnitTestSuite
@warning_ignore('unused_parameter')
@warning_ignore('return_value_discarded')

var world_scene = preload("res://World/world.tscn")

func test_collector_speed_button_disable_true():
	Global.reset()
	
	Global.potatoCount = 0
	Global.scrapCount = 0
	
	# Price, 5 potato, 5 scrap
	RobotResearchStation.collectorSpeedLevel = 0
	RobotResearchStation._check_if_enough(RobotResearchStation.collectorSpeedLevel, RobotResearchStation.collectorSpeedPrice, RobotResearchStation.collectorSpeedButton)
	assert_bool(RobotResearchStation.collectorSpeedButton.disabled).is_true()
	# Price, 25 potato, 25 scrap
	RobotResearchStation.collectorSpeedLevel = 1
	RobotResearchStation._check_if_enough(RobotResearchStation.collectorSpeedLevel, RobotResearchStation.collectorSpeedPrice, RobotResearchStation.collectorSpeedButton)
	assert_bool(RobotResearchStation.collectorSpeedButton.disabled).is_true()
	# Price, 125 potato, 125 scrap
	RobotResearchStation.collectorSpeedLevel = 2
	RobotResearchStation._check_if_enough(RobotResearchStation.collectorSpeedLevel, RobotResearchStation.collectorSpeedPrice, RobotResearchStation.collectorSpeedButton)
	assert_bool(RobotResearchStation.collectorSpeedButton.disabled).is_true()
	
	
	Global.potatoCount = 5
	Global.scrapCount = 5
	
	# Price, 5 potato, 5 scrap
	RobotResearchStation.collectorSpeedLevel = 0
	RobotResearchStation._check_if_enough(RobotResearchStation.collectorSpeedLevel, RobotResearchStation.collectorSpeedPrice, RobotResearchStation.collectorSpeedButton)
	assert_bool(RobotResearchStation.collectorSpeedButton.disabled).is_false()
	# Price, 25 potato, 25 scrap
	RobotResearchStation.collectorSpeedLevel = 1
	RobotResearchStation._check_if_enough(RobotResearchStation.collectorSpeedLevel, RobotResearchStation.collectorSpeedPrice, RobotResearchStation.collectorSpeedButton)
	assert_bool(RobotResearchStation.collectorSpeedButton.disabled).is_true()
	# Price, 125 potato, 125 scrap
	RobotResearchStation.collectorSpeedLevel = 2
	RobotResearchStation._check_if_enough(RobotResearchStation.collectorSpeedLevel, RobotResearchStation.collectorSpeedPrice, RobotResearchStation.collectorSpeedButton)
	assert_bool(RobotResearchStation.collectorSpeedButton.disabled).is_true()
	
	Global.potatoCount = 25
	Global.scrapCount = 25
	
	# Price, 5 potato, 5 scrap
	RobotResearchStation.collectorSpeedLevel = 0
	RobotResearchStation._check_if_enough(RobotResearchStation.collectorSpeedLevel, RobotResearchStation.collectorSpeedPrice, RobotResearchStation.collectorSpeedButton)
	assert_bool(RobotResearchStation.collectorSpeedButton.disabled).is_false()
	# Price, 25 potato, 25 scrap
	RobotResearchStation.collectorSpeedLevel = 1
	RobotResearchStation._check_if_enough(RobotResearchStation.collectorSpeedLevel, RobotResearchStation.collectorSpeedPrice, RobotResearchStation.collectorSpeedButton)
	assert_bool(RobotResearchStation.collectorSpeedButton.disabled).is_false()
	# Price, 125 potato, 125 scrap
	RobotResearchStation.collectorSpeedLevel = 2
	RobotResearchStation._check_if_enough(RobotResearchStation.collectorSpeedLevel, RobotResearchStation.collectorSpeedPrice, RobotResearchStation.collectorSpeedButton)
	assert_bool(RobotResearchStation.collectorSpeedButton.disabled).is_true()
	

func test_collector_speed_button_disable_false():
	Global.reset()
	
	Global.potatoCount = 125
	Global.scrapCount = 125
	
	# Price, 5 potato, 5 scrap
	RobotResearchStation.collectorSpeedLevel = 0
	RobotResearchStation._check_if_enough(RobotResearchStation.collectorSpeedLevel, RobotResearchStation.collectorSpeedPrice, RobotResearchStation.collectorSpeedButton)
	assert_bool(RobotResearchStation.collectorSpeedButton.disabled).is_false()
	
	# Price, 25 potato, 25 scrap
	RobotResearchStation.collectorSpeedLevel = 1
	RobotResearchStation._check_if_enough(RobotResearchStation.collectorSpeedLevel, RobotResearchStation.collectorSpeedPrice, RobotResearchStation.collectorSpeedButton)
	assert_bool(RobotResearchStation.collectorSpeedButton.disabled).is_false()
	
	# Price, 125 potato, 125 scrap
	RobotResearchStation.collectorSpeedLevel = 2
	RobotResearchStation._check_if_enough(RobotResearchStation.collectorSpeedLevel, RobotResearchStation.collectorSpeedPrice, RobotResearchStation.collectorSpeedButton)
	assert_bool(RobotResearchStation.collectorSpeedButton.disabled).is_false()


func test_update_collector_speed_label_values():
	var world = world_scene.instantiate()
	var levelBox = RobotResearchStation.collectorSpeedLevel1
	var starting_robots = world.get_node("robots")
	RobotShop._buy_robot(RobotShop.collectorPrice, RobotShop.collector_scene,RobotShop.collector_ai_scene,starting_robots)
	var robots = world.find_child("robots").get_children()
	var collectors = []
	for robot in robots:
		if is_instance_of(robot, collector_robot):
			collectors.append(robot)
	
	# Price, 5 potato, 5 scrap
	Global.upkeep = 0
	Global.robot_upkeep = 0
	RobotResearchStation.collectorSpeedLevel = 0
	RobotResearchStation._update_to_new_button_values(collectors, RobotResearchStation.collectorSpeedLevel, RobotResearchStation.collectorSpeedUpkeep, RobotResearchStation.collectorSpeedUpkeepValues, RobotResearchStation.collectorSpeedUpkeepLabel, RobotResearchStation.collectorSpeedImprovements, RobotResearchStation.collectorSpeedImprovementLabel, RobotResearchStation.collectorSpeedButton, RobotResearchStation.collectorSpeedResources, levelBox)
	assert_str(RobotResearchStation.collectorSpeedPotatoPrice.text).is_equal("5")
	assert_str(RobotResearchStation.collectorSpeedScrapPrice.text).is_equal("5")
	assert_str(RobotResearchStation.collectorSpeedImprovementLabel.text).is_equal("Enhance robots mobility.    10   ->   20 m/s")
	assert_str(RobotResearchStation.collectorSpeedUpkeepLabel.text).is_equal("Upkeep	    +1")
	assert_str(RobotResearchStation.totalUpkeep.text).is_equal("Upkeep:\n0   ->   1")
	
	## Price, 25 potato, 25 scrap
	Global.upkeep = 0
	Global.robot_upkeep = 0
	RobotResearchStation.collectorSpeedLevel = 1
	RobotResearchStation._update_to_new_button_values(collectors, RobotResearchStation.collectorSpeedLevel, RobotResearchStation.collectorSpeedUpkeep, RobotResearchStation.collectorSpeedUpkeepValues, RobotResearchStation.collectorSpeedUpkeepLabel, RobotResearchStation.collectorSpeedImprovements, RobotResearchStation.collectorSpeedImprovementLabel, RobotResearchStation.collectorSpeedButton, RobotResearchStation.collectorSpeedResources, levelBox)
	assert_str(RobotResearchStation.collectorSpeedPotatoPrice.text).is_equal("25")
	assert_str(RobotResearchStation.collectorSpeedScrapPrice.text).is_equal("25")
	assert_str(RobotResearchStation.collectorSpeedImprovementLabel.text).is_equal("Enhance robots mobility.    20   ->   30 m/s")
	assert_str(RobotResearchStation.collectorSpeedUpkeepLabel.text).is_equal("Upkeep	    +3")
	assert_str(RobotResearchStation.totalUpkeep.text).is_equal("Upkeep:\n0   ->   3")
	
	# Price, 125 potato, 125 scrap
	Global.upkeep = 0
	Global.robot_upkeep = 0
	RobotResearchStation.collectorSpeedLevel = 2
	RobotResearchStation._update_to_new_button_values(collectors, RobotResearchStation.collectorSpeedLevel, RobotResearchStation.collectorSpeedUpkeep, RobotResearchStation.collectorSpeedUpkeepValues, RobotResearchStation.collectorSpeedUpkeepLabel, RobotResearchStation.collectorSpeedImprovements, RobotResearchStation.collectorSpeedImprovementLabel, RobotResearchStation.collectorSpeedButton, RobotResearchStation.collectorSpeedResources, levelBox)
	assert_str(RobotResearchStation.collectorSpeedPotatoPrice.text).is_equal("125")
	assert_str(RobotResearchStation.collectorSpeedScrapPrice.text).is_equal("125")
	assert_str(RobotResearchStation.collectorSpeedImprovementLabel.text).is_equal("Enhance robots mobility.    30   ->   40 m/s")
	assert_str(RobotResearchStation.collectorSpeedUpkeepLabel.text).is_equal("Upkeep	    +9")
	assert_str(RobotResearchStation.totalUpkeep.text).is_equal("Upkeep:\n0   ->   9")

	# Maxed out
	Global.upkeep = 0
	Global.robot_upkeep = 0
	RobotResearchStation.collectorSpeedLevel = 3
	RobotResearchStation._update_to_new_button_values(collectors, RobotResearchStation.collectorSpeedLevel, RobotResearchStation.collectorSpeedUpkeep, RobotResearchStation.collectorSpeedUpkeepValues, RobotResearchStation.collectorSpeedUpkeepLabel, RobotResearchStation.collectorSpeedImprovements, RobotResearchStation.collectorSpeedImprovementLabel, RobotResearchStation.collectorSpeedButton, RobotResearchStation.collectorSpeedResources, levelBox)
	
	assert_bool(RobotResearchStation.totalUpkeep.visible).is_false()
	assert_bool(RobotResearchStation.collectorSpeedUpkeepLabel.visible).is_false()
	assert_str(RobotResearchStation.collectorSpeedImprovementLabel.text).is_equal("40 m/s")
	assert_str(RobotResearchStation.collectorSpeedButton.text).is_equal("Maxed out")
	assert_bool(RobotResearchStation.collectorSpeedButton.disabled).is_true()
	assert_bool(RobotResearchStation.collectorSpeedResources.visible).is_false()

	world.queue_free()
	
func test_update_global_collector_speed_values():
	Global.reset()
	
	Global.potatoCount = 10
	Global.scrapCount = 10
	RobotResearchStation.collectorSpeedLevel = 0
	RobotResearchStation.collectorSpeedLevel = RobotResearchStation._update_global_values(RobotResearchStation.collectorSpeedPrice, RobotResearchStation.collectorSpeedLevel)

	assert_int(Global.potatoCount).is_equal(5)
	assert_int(Global.scrapCount).is_equal(5)
	assert_int(RobotResearchStation.collectorSpeedLevel).is_equal(1)

	Global.potatoCount = 75
	Global.scrapCount = 75
	RobotResearchStation.collectorSpeedLevel = 1
	RobotResearchStation.collectorSpeedLevel = RobotResearchStation._update_global_values(RobotResearchStation.collectorSpeedPrice, RobotResearchStation.collectorSpeedLevel)
	assert_int(Global.potatoCount).is_equal(50)
	assert_int(Global.scrapCount).is_equal(50)
	assert_int(RobotResearchStation.collectorSpeedLevel).is_equal(2)
	
	Global.potatoCount = 625
	Global.scrapCount = 625
	RobotResearchStation.collectorSpeedLevel = 2
	RobotResearchStation.collectorSpeedLevel = RobotResearchStation._update_global_values(RobotResearchStation.collectorSpeedPrice, RobotResearchStation.collectorSpeedLevel)
	assert_int(Global.potatoCount).is_equal(500)
	assert_int(Global.scrapCount).is_equal(500)
	assert_int(RobotResearchStation.collectorSpeedLevel).is_equal(3)
	

func test_update_collector_speed_upkeep():
	var world = world_scene.instantiate()
	var starting_robots = world.get_node("robots")
	RobotShop._buy_robot(RobotShop.collectorPrice, RobotShop.collector_scene,RobotShop.collector_ai_scene,starting_robots)
	var robots = world.find_child("robots").get_children()
	var collectors = []
	for robot in robots:
		if is_instance_of(robot, collector_robot):
			robot.upkeep = Global.collectorUpkeep
			collectors.append(robot)

	RobotResearchStation.collectorSpeedLevel = 0
	# + 1 upkeep
	Global.collectorUpkeep += RobotResearchStation.update_robot_upkeep(collectors, RobotResearchStation.collectorSpeedUpkeepValues, RobotResearchStation.collectorSpeedLevel)	
	assert_int(Global.collectorUpkeep).is_equal(2)
	for collector in collectors:
		assert_int(collector.upkeep).is_equal(2)
	
	RobotResearchStation.collectorSpeedLevel = 1
	# + 3 upkeep
	Global.collectorUpkeep += RobotResearchStation.update_robot_upkeep(collectors, RobotResearchStation.collectorSpeedUpkeepValues, RobotResearchStation.collectorSpeedLevel)	
	assert_int(Global.collectorUpkeep).is_equal(5)
	for collector in collectors:
		assert_int(collector.upkeep).is_equal(5)
		
	RobotResearchStation.collectorSpeedLevel = 2
	# + 9 upkeep
	Global.collectorUpkeep += RobotResearchStation.update_robot_upkeep(collectors, RobotResearchStation.collectorSpeedUpkeepValues, RobotResearchStation.collectorSpeedLevel)	
	assert_int(Global.collectorUpkeep).is_equal(14)
	for collector in collectors:
		assert_int(collector.upkeep).is_equal(14)
		
	world.queue_free()
	
	
func test_update_each_collectors_speed():
	var world = world_scene.instantiate()
	var starting_robots = world.get_node("robots")
	RobotShop._buy_robot(RobotShop.collectorPrice, RobotShop.collector_scene,RobotShop.collector_ai_scene,starting_robots)
	var robots = world.find_child("robots").get_children()
	var collectors = []
	for robot in robots:
		if is_instance_of(robot, collector_robot):
			robot.speed = Global.collectorSpeed
			collectors.append(robot)

	RobotResearchStation.collectorSpeedLevel = 0
	# 10 m/s
	Global.collectorSpeed = RobotResearchStation.update_robot_speed(collectors, RobotResearchStation.collectorSpeedImprovementValues, RobotResearchStation.collectorSpeedLevel)	
	assert_int(Global.collectorSpeed).is_equal(10)
	for collector in collectors:
		assert_int(collector.speed).is_equal(10)
	
	RobotResearchStation.collectorSpeedLevel = 1
	# + 10 m/s
	Global.collectorSpeed = RobotResearchStation.update_robot_speed(collectors, RobotResearchStation.collectorSpeedImprovementValues, RobotResearchStation.collectorSpeedLevel)	
	assert_int(Global.collectorSpeed).is_equal(20)
	for collector in collectors:
		assert_int(collector.speed).is_equal(20)
		
	RobotResearchStation.collectorSpeedLevel = 2
	# + 10 m/s
	Global.collectorSpeed = RobotResearchStation.update_robot_speed(collectors, RobotResearchStation.collectorSpeedImprovementValues, RobotResearchStation.collectorSpeedLevel)	
	assert_int(Global.collectorSpeed).is_equal(30)
	for collector in collectors:
		assert_int(collector.speed).is_equal(30)
		
	RobotResearchStation.collectorSpeedLevel = 3
	# + 10 m/s
	Global.collectorSpeed = RobotResearchStation.update_robot_speed(collectors, RobotResearchStation.collectorSpeedImprovementValues, RobotResearchStation.collectorSpeedLevel)	
	assert_int(Global.collectorSpeed).is_equal(40)
	for collector in collectors:
		assert_int(collector.speed).is_equal(40)
		
	world.queue_free()


func test_reset_collector_speed_values():
	Global.reset()
	
	RobotResearchStation.collectorSpeedLevel = RobotResearchStation.reset_feature(RobotResearchStation.collectorSpeedLevel, RobotResearchStation.collectorSpeedButton, RobotResearchStation.collectorSpeedResources, RobotResearchStation.collectorSpeedUpkeepLabel, RobotResearchStation.collectorSpeedLevel1, RobotResearchStation.collectorSpeedLevel2, RobotResearchStation.collectorSpeedLevel3)
	
	assert_int(RobotResearchStation.collectorSpeedLevel).is_equal(0)
	assert_str(RobotResearchStation.collectorSpeedButton.text).is_equal("Upgrade")
	assert_bool(RobotResearchStation.collectorSpeedButton.disabled).is_false()
	assert_bool(RobotResearchStation.collectorSpeedResources.visible).is_true()
	assert_bool(RobotResearchStation.collectorSpeedUpkeepLabel.visible).is_true()
#
