# GdUnit generated TestSuite
class_name ResearchCollectorPowerTest
extends GdUnitTestSuite
@warning_ignore('unused_parameter')
@warning_ignore('return_value_discarded')

var world_scene = preload("res://World/world.tscn")

func test_collector_power_button_disable_true():
	Global.reset()
	
	Global.potatoCount = 0
	Global.scrapCount = 0
	
	# Price, 60 potato, 60 scrap
	RobotResearchStation.collectorPowerLevel = 0
	RobotResearchStation._check_if_enough(RobotResearchStation.collectorPowerLevel, RobotResearchStation.collectorPowerPrice, RobotResearchStation.collectorPowerButton)
	assert_bool(RobotResearchStation.collectorPowerButton.disabled).is_true()
	# Price, 250 potato, 250 scrap
	RobotResearchStation.collectorPowerLevel = 1
	RobotResearchStation._check_if_enough(RobotResearchStation.collectorPowerLevel, RobotResearchStation.collectorPowerPrice, RobotResearchStation.collectorPowerButton)
	assert_bool(RobotResearchStation.collectorPowerButton.disabled).is_true()
	# Price, 600 potato, 600 scrap
	RobotResearchStation.collectorPowerLevel = 2
	RobotResearchStation._check_if_enough(RobotResearchStation.collectorPowerLevel, RobotResearchStation.collectorPowerPrice, RobotResearchStation.collectorPowerButton)
	assert_bool(RobotResearchStation.collectorPowerButton.disabled).is_true()
	
	
	Global.potatoCount = 60
	Global.scrapCount = 60
	
	# Price, 60 potato, 60 scrap
	RobotResearchStation.collectorPowerLevel = 0
	RobotResearchStation._check_if_enough(RobotResearchStation.collectorPowerLevel, RobotResearchStation.collectorPowerPrice, RobotResearchStation.collectorPowerButton)
	assert_bool(RobotResearchStation.collectorPowerButton.disabled).is_false()
	# Price, 250 potato, 250 scrap
	RobotResearchStation.collectorPowerLevel = 1
	RobotResearchStation._check_if_enough(RobotResearchStation.collectorPowerLevel, RobotResearchStation.collectorPowerPrice, RobotResearchStation.collectorPowerButton)
	assert_bool(RobotResearchStation.collectorPowerButton.disabled).is_true()
	# Price, 600 potato, 600 scrap
	RobotResearchStation.collectorPowerLevel = 2
	RobotResearchStation._check_if_enough(RobotResearchStation.collectorPowerLevel, RobotResearchStation.collectorPowerPrice, RobotResearchStation.collectorPowerButton)
	assert_bool(RobotResearchStation.collectorPowerButton.disabled).is_true()
	
	Global.potatoCount = 250
	Global.scrapCount = 250
	
	# Price, 60 potato, 60 scrap
	RobotResearchStation.collectorPowerLevel = 0
	RobotResearchStation._check_if_enough(RobotResearchStation.collectorPowerLevel, RobotResearchStation.collectorPowerPrice, RobotResearchStation.collectorPowerButton)
	assert_bool(RobotResearchStation.collectorPowerButton.disabled).is_false()
	# Price, 250 potato, 250 scrap
	RobotResearchStation.collectorPowerLevel = 1
	RobotResearchStation._check_if_enough(RobotResearchStation.collectorPowerLevel, RobotResearchStation.collectorPowerPrice, RobotResearchStation.collectorPowerButton)
	assert_bool(RobotResearchStation.collectorPowerButton.disabled).is_false()
	# Price, 600 potato, 600 scrap
	RobotResearchStation.collectorPowerLevel = 2
	RobotResearchStation._check_if_enough(RobotResearchStation.collectorPowerLevel, RobotResearchStation.collectorPowerPrice, RobotResearchStation.collectorPowerButton)
	assert_bool(RobotResearchStation.collectorPowerButton.disabled).is_true()
	

func test_collector_power_button_disable_false():
	Global.reset()
	
	Global.potatoCount = 600
	Global.scrapCount = 600
	
	# Price, 60 potato, 60 scrap
	RobotResearchStation.collectorPowerLevel = 0
	RobotResearchStation._check_if_enough(RobotResearchStation.collectorPowerLevel, RobotResearchStation.collectorPowerPrice, RobotResearchStation.collectorPowerButton)
	assert_bool(RobotResearchStation.collectorPowerButton.disabled).is_false()
	
	# Price, 250 potato, 250 scrap
	RobotResearchStation.collectorPowerLevel = 1
	RobotResearchStation._check_if_enough(RobotResearchStation.collectorPowerLevel, RobotResearchStation.collectorPowerPrice, RobotResearchStation.collectorPowerButton)
	assert_bool(RobotResearchStation.collectorPowerButton.disabled).is_false()
	
	# Price, 600 potato, 600 scrap
	RobotResearchStation.collectorPowerLevel = 2
	RobotResearchStation._check_if_enough(RobotResearchStation.collectorPowerLevel, RobotResearchStation.collectorPowerPrice, RobotResearchStation.collectorPowerButton)
	assert_bool(RobotResearchStation.collectorPowerButton.disabled).is_false()


func test_update_collector_power_label_values():
	var world = world_scene.instantiate()
	var levelBox = RobotResearchStation.collectorPowerLevel1
	var starting_robots = world.get_node("robots")
	RobotShop._buy_robot(RobotShop.collectorPrice, RobotShop.collector_scene,RobotShop.collector_ai_scene,starting_robots)
	var robots = world.find_child("robots").get_children()
	var collectors = []
	for robot in robots:
		if is_instance_of(robot, collector_robot):
			collectors.append(robot)
	
	# Price, 60 potato, 60 scrap
	Global.upkeep = 0
	Global.robot_upkeep = 0
	RobotResearchStation.collectorPowerLevel = 0
	RobotResearchStation._update_to_new_button_values(collectors, RobotResearchStation.collectorPowerLevel, RobotResearchStation.collectorPowerUpkeep, RobotResearchStation.collectorPowerUpkeepValues, RobotResearchStation.collectorPowerUpkeepLabel, RobotResearchStation.collectorPowerImprovements, RobotResearchStation.collectorPowerImprovementLabel, RobotResearchStation.collectorPowerButton, RobotResearchStation.collectorPowerResources, levelBox)
	assert_str(RobotResearchStation.collectorPowerPotatoPrice.text).is_equal("60")
	assert_str(RobotResearchStation.collectorPowerScrapPrice.text).is_equal("60")
	assert_str(RobotResearchStation.collectorPowerImprovementLabel.text).is_equal("Optimize power usage. Reduce upkeep by up to 3 per robot")
	assert_str(RobotResearchStation.collectorPowerUpkeepLabel.text).is_equal("Upkeep	    -3")
	assert_str(RobotResearchStation.totalUpkeep.text).is_equal("Upkeep:\n0   ->   0")
	
	## Price, 250 potato, 250 scrap
	Global.upkeep = 0
	Global.robot_upkeep = 0
	RobotResearchStation.collectorPowerLevel = 1
	RobotResearchStation._update_to_new_button_values(collectors, RobotResearchStation.collectorPowerLevel, RobotResearchStation.collectorPowerUpkeep, RobotResearchStation.collectorPowerUpkeepValues, RobotResearchStation.collectorPowerUpkeepLabel, RobotResearchStation.collectorPowerImprovements, RobotResearchStation.collectorPowerImprovementLabel, RobotResearchStation.collectorPowerButton, RobotResearchStation.collectorPowerResources, levelBox)
	assert_str(RobotResearchStation.collectorPowerPotatoPrice.text).is_equal("250")
	assert_str(RobotResearchStation.collectorPowerScrapPrice.text).is_equal("250")
	assert_str(RobotResearchStation.collectorPowerImprovementLabel.text).is_equal("Optimize power usage. Reduce upkeep by up to 5 per robot")
	assert_str(RobotResearchStation.collectorPowerUpkeepLabel.text).is_equal("Upkeep	    -5")
	assert_str(RobotResearchStation.totalUpkeep.text).is_equal("Upkeep:\n0   ->   0")
	
	# Price, 600 potato, 600 scrap
	Global.upkeep = 0
	Global.robot_upkeep = 0
	RobotResearchStation.collectorPowerLevel = 2
	RobotResearchStation._update_to_new_button_values(collectors, RobotResearchStation.collectorPowerLevel, RobotResearchStation.collectorPowerUpkeep, RobotResearchStation.collectorPowerUpkeepValues, RobotResearchStation.collectorPowerUpkeepLabel, RobotResearchStation.collectorPowerImprovements, RobotResearchStation.collectorPowerImprovementLabel, RobotResearchStation.collectorPowerButton, RobotResearchStation.collectorPowerResources, levelBox)
	assert_str(RobotResearchStation.collectorPowerPotatoPrice.text).is_equal("600")
	assert_str(RobotResearchStation.collectorPowerScrapPrice.text).is_equal("600")
	assert_str(RobotResearchStation.collectorPowerImprovementLabel.text).is_equal("Optimize power usage. Reduce upkeep by up to 9 per robot")
	assert_str(RobotResearchStation.collectorPowerUpkeepLabel.text).is_equal("Upkeep	    -9")
	assert_str(RobotResearchStation.totalUpkeep.text).is_equal("Upkeep:\n0   ->   0")

	# Maxed out
	Global.upkeep = 0
	Global.robot_upkeep = 0
	RobotResearchStation.collectorPowerLevel = 3
	RobotResearchStation._update_to_new_button_values(collectors, RobotResearchStation.collectorPowerLevel, RobotResearchStation.collectorPowerUpkeep, RobotResearchStation.collectorPowerUpkeepValues, RobotResearchStation.collectorPowerUpkeepLabel, RobotResearchStation.collectorPowerImprovements, RobotResearchStation.collectorPowerImprovementLabel, RobotResearchStation.collectorPowerButton, RobotResearchStation.collectorPowerResources, levelBox)
	
	assert_bool(RobotResearchStation.totalUpkeep.visible).is_false()
	assert_bool(RobotResearchStation.collectorPowerUpkeepLabel.visible).is_false()
	assert_str(RobotResearchStation.collectorPowerImprovementLabel.text).is_equal("Up to -17 per robot")
	assert_str(RobotResearchStation.collectorPowerButton.text).is_equal("Maxed out")
	assert_bool(RobotResearchStation.collectorPowerButton.disabled).is_true()
	assert_bool(RobotResearchStation.collectorPowerResources.visible).is_false()

	world.queue_free()
	
func test_update_global_collector_power_values():
	Global.reset()
	
	Global.potatoCount = 65
	Global.scrapCount = 65
	RobotResearchStation.collectorPowerLevel = 0
	RobotResearchStation.collectorPowerLevel = RobotResearchStation._update_global_values(RobotResearchStation.collectorPowerPrice, RobotResearchStation.collectorPowerLevel)

	assert_int(Global.potatoCount).is_equal(5)
	assert_int(Global.scrapCount).is_equal(5)
	assert_int(RobotResearchStation.collectorPowerLevel).is_equal(1)

	Global.potatoCount = 300
	Global.scrapCount = 300
	RobotResearchStation.collectorPowerLevel = 1
	RobotResearchStation.collectorPowerLevel = RobotResearchStation._update_global_values(RobotResearchStation.collectorPowerPrice, RobotResearchStation.collectorPowerLevel)
	assert_int(Global.potatoCount).is_equal(50)
	assert_int(Global.scrapCount).is_equal(50)
	assert_int(RobotResearchStation.collectorPowerLevel).is_equal(2)
	
	Global.potatoCount = 1100
	Global.scrapCount = 1100
	RobotResearchStation.collectorPowerLevel = 2
	RobotResearchStation.collectorPowerLevel = RobotResearchStation._update_global_values(RobotResearchStation.collectorPowerPrice, RobotResearchStation.collectorPowerLevel)
	assert_int(Global.potatoCount).is_equal(500)
	assert_int(Global.scrapCount).is_equal(500)
	assert_int(RobotResearchStation.collectorPowerLevel).is_equal(3)
	

func test_update_collector_power_upkeep():
	var world = world_scene.instantiate()
	var starting_robots = world.get_node("robots")
	RobotShop._buy_robot(RobotShop.collectorPrice, RobotShop.collector_scene,RobotShop.collector_ai_scene,starting_robots)
	var robots = world.find_child("robots").get_children()
	var collectors = []
	for robot in robots:
		if is_instance_of(robot, collector_robot):
			robot.upkeep = Global.collectorUpkeep
			collectors.append(robot)

	RobotResearchStation.collectorPowerLevel = 0
	# - 3 upkeep
	Global.collectorUpkeep += RobotResearchStation.update_robot_upkeep(collectors, RobotResearchStation.collectorPowerUpkeepValues, RobotResearchStation.collectorPowerLevel)	
	assert_int(Global.collectorUpkeep).is_equal(-2)
	for collector in collectors:
		assert_int(collector.upkeep).is_equal(-2)
	
	RobotResearchStation.collectorPowerLevel = 1
	# - 5 upkeep
	Global.collectorUpkeep += RobotResearchStation.update_robot_upkeep(collectors, RobotResearchStation.collectorPowerUpkeepValues, RobotResearchStation.collectorPowerLevel)	
	assert_int(Global.collectorUpkeep).is_equal(-7)
	for collector in collectors:
		assert_int(collector.upkeep).is_equal(-7)
		
	RobotResearchStation.collectorPowerLevel = 2
	# - 9 upkeep
	Global.collectorUpkeep += RobotResearchStation.update_robot_upkeep(collectors, RobotResearchStation.collectorPowerUpkeepValues, RobotResearchStation.collectorPowerLevel)	
	assert_int(Global.collectorUpkeep).is_equal(-16)
	for collector in collectors:
		assert_int(collector.upkeep).is_equal(-16)
		
	world.queue_free()


func test_reset_collector_power_values():
	Global.reset()
	
	RobotResearchStation.collectorPowerLevel = RobotResearchStation.reset_feature(RobotResearchStation.collectorPowerLevel, RobotResearchStation.collectorPowerButton, RobotResearchStation.collectorPowerResources, RobotResearchStation.collectorPowerUpkeepLabel, RobotResearchStation.collectorPowerLevel1, RobotResearchStation.collectorPowerLevel2, RobotResearchStation.collectorPowerLevel3)
	
	assert_int(RobotResearchStation.collectorPowerLevel).is_equal(0)
	assert_str(RobotResearchStation.collectorPowerButton.text).is_equal("Upgrade")
	assert_bool(RobotResearchStation.collectorPowerButton.disabled).is_false()
	assert_bool(RobotResearchStation.collectorPowerResources.visible).is_true()
	assert_bool(RobotResearchStation.collectorPowerUpkeepLabel.visible).is_true()

