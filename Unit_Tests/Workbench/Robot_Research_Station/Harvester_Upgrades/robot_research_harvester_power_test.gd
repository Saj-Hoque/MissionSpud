# GdUnit generated TestSuite
class_name ResearchHarvesterPowerTest
extends GdUnitTestSuite
@warning_ignore('unused_parameter')
@warning_ignore('return_value_discarded')

var world_scene = preload("res://World/world.tscn")

func test_harvester_power_button_disable_true():
	Global.reset()
	
	Global.potatoCount = 0
	Global.scrapCount = 0
	
	# Price, 30 potato, 30 scrap
	RobotResearchStation.harvesterPowerLevel = 0
	RobotResearchStation._check_if_enough(RobotResearchStation.harvesterPowerLevel, RobotResearchStation.harvesterPowerPrice, RobotResearchStation.harvesterPowerButton)
	assert_bool(RobotResearchStation.harvesterPowerButton.disabled).is_true()
	# Price, 250 potato, 250 scrap
	RobotResearchStation.harvesterPowerLevel = 1
	RobotResearchStation._check_if_enough(RobotResearchStation.harvesterPowerLevel, RobotResearchStation.harvesterPowerPrice, RobotResearchStation.harvesterPowerButton)
	assert_bool(RobotResearchStation.harvesterPowerButton.disabled).is_true()
	# Price, 600 potato, 600 scrap
	RobotResearchStation.harvesterPowerLevel = 2
	RobotResearchStation._check_if_enough(RobotResearchStation.harvesterPowerLevel, RobotResearchStation.harvesterPowerPrice, RobotResearchStation.harvesterPowerButton)
	assert_bool(RobotResearchStation.harvesterPowerButton.disabled).is_true()
	
	
	Global.potatoCount = 30
	Global.scrapCount = 30
	
	# Price, 30 potato, 30 scrap
	RobotResearchStation.harvesterPowerLevel = 0
	RobotResearchStation._check_if_enough(RobotResearchStation.harvesterPowerLevel, RobotResearchStation.harvesterPowerPrice, RobotResearchStation.harvesterPowerButton)
	assert_bool(RobotResearchStation.harvesterPowerButton.disabled).is_false()
	# Price, 250 potato, 250 scrap
	RobotResearchStation.harvesterPowerLevel = 1
	RobotResearchStation._check_if_enough(RobotResearchStation.harvesterPowerLevel, RobotResearchStation.harvesterPowerPrice, RobotResearchStation.harvesterPowerButton)
	assert_bool(RobotResearchStation.harvesterPowerButton.disabled).is_true()
	# Price, 600 potato, 600 scrap
	RobotResearchStation.harvesterPowerLevel = 2
	RobotResearchStation._check_if_enough(RobotResearchStation.harvesterPowerLevel, RobotResearchStation.harvesterPowerPrice, RobotResearchStation.harvesterPowerButton)
	assert_bool(RobotResearchStation.harvesterPowerButton.disabled).is_true()
	
	Global.potatoCount = 250
	Global.scrapCount = 250
	
	# Price, 30 potato, 30 scrap
	RobotResearchStation.harvesterPowerLevel = 0
	RobotResearchStation._check_if_enough(RobotResearchStation.harvesterPowerLevel, RobotResearchStation.harvesterPowerPrice, RobotResearchStation.harvesterPowerButton)
	assert_bool(RobotResearchStation.harvesterPowerButton.disabled).is_false()
	# Price, 250 potato, 250 scrap
	RobotResearchStation.harvesterPowerLevel = 1
	RobotResearchStation._check_if_enough(RobotResearchStation.harvesterPowerLevel, RobotResearchStation.harvesterPowerPrice, RobotResearchStation.harvesterPowerButton)
	assert_bool(RobotResearchStation.harvesterPowerButton.disabled).is_false()
	# Price, 600 potato, 600 scrap
	RobotResearchStation.harvesterPowerLevel = 2
	RobotResearchStation._check_if_enough(RobotResearchStation.harvesterPowerLevel, RobotResearchStation.harvesterPowerPrice, RobotResearchStation.harvesterPowerButton)
	assert_bool(RobotResearchStation.harvesterPowerButton.disabled).is_true()
	

func test_harvester_power_button_disable_false():
	Global.reset()
	
	Global.potatoCount = 600
	Global.scrapCount = 600
	
	# Price, 30 potato, 30 scrap
	RobotResearchStation.harvesterPowerLevel = 0
	RobotResearchStation._check_if_enough(RobotResearchStation.harvesterPowerLevel, RobotResearchStation.harvesterPowerPrice, RobotResearchStation.harvesterPowerButton)
	assert_bool(RobotResearchStation.harvesterPowerButton.disabled).is_false()
	
	# Price, 250 potato, 250 scrap
	RobotResearchStation.harvesterPowerLevel = 1
	RobotResearchStation._check_if_enough(RobotResearchStation.harvesterPowerLevel, RobotResearchStation.harvesterPowerPrice, RobotResearchStation.harvesterPowerButton)
	assert_bool(RobotResearchStation.harvesterPowerButton.disabled).is_false()
	
	# Price, 600 potato, 600 scrap
	RobotResearchStation.harvesterPowerLevel = 2
	RobotResearchStation._check_if_enough(RobotResearchStation.harvesterPowerLevel, RobotResearchStation.harvesterPowerPrice, RobotResearchStation.harvesterPowerButton)
	assert_bool(RobotResearchStation.harvesterPowerButton.disabled).is_false()


func test_update_harvester_power_label_values():
	var world = world_scene.instantiate()
	var levelBox = RobotResearchStation.harvesterPowerLevel1
	var starting_robots = world.get_node("robots")
	RobotShop._buy_robot(RobotShop.harvesterPrice, RobotShop.harvester_scene,RobotShop.harvester_ai_scene,starting_robots)
	var robots = world.find_child("robots").get_children()
	var harvesters = []
	for robot in robots:
		if is_instance_of(robot, harvester_robot):
			harvesters.append(robot)
	
	# Price, 30 potato, 30 scrap
	Global.upkeep = 0
	Global.robot_upkeep = 0
	RobotResearchStation.harvesterPowerLevel = 0
	RobotResearchStation._update_to_new_button_values(harvesters, RobotResearchStation.harvesterPowerLevel, RobotResearchStation.harvesterPowerUpkeep, RobotResearchStation.harvesterPowerUpkeepValues, RobotResearchStation.harvesterPowerUpkeepLabel, RobotResearchStation.harvesterPowerImprovements, RobotResearchStation.harvesterPowerImprovementLabel, RobotResearchStation.harvesterPowerButton, RobotResearchStation.harvesterPowerResources, levelBox)
	assert_str(RobotResearchStation.harvesterPowerPotatoPrice.text).is_equal("30")
	assert_str(RobotResearchStation.harvesterPowerScrapPrice.text).is_equal("30")
	assert_str(RobotResearchStation.harvesterPowerImprovementLabel.text).is_equal("Optimize power usage. Reduce upkeep by up to 3 per robot")
	assert_str(RobotResearchStation.harvesterPowerUpkeepLabel.text).is_equal("Upkeep	    -3")
	assert_str(RobotResearchStation.totalUpkeep.text).is_equal("Upkeep:\n0   ->   0")
	
	## Price, 250 potato, 250 scrap
	Global.upkeep = 0
	Global.robot_upkeep = 0
	RobotResearchStation.harvesterPowerLevel = 1
	RobotResearchStation._update_to_new_button_values(harvesters, RobotResearchStation.harvesterPowerLevel, RobotResearchStation.harvesterPowerUpkeep, RobotResearchStation.harvesterPowerUpkeepValues, RobotResearchStation.harvesterPowerUpkeepLabel, RobotResearchStation.harvesterPowerImprovements, RobotResearchStation.harvesterPowerImprovementLabel, RobotResearchStation.harvesterPowerButton, RobotResearchStation.harvesterPowerResources, levelBox)
	assert_str(RobotResearchStation.harvesterPowerPotatoPrice.text).is_equal("250")
	assert_str(RobotResearchStation.harvesterPowerScrapPrice.text).is_equal("250")
	assert_str(RobotResearchStation.harvesterPowerImprovementLabel.text).is_equal("Optimize power usage. Reduce upkeep by up to 5 per robot")
	assert_str(RobotResearchStation.harvesterPowerUpkeepLabel.text).is_equal("Upkeep	    -5")
	assert_str(RobotResearchStation.totalUpkeep.text).is_equal("Upkeep:\n0   ->   0")
	
	# Price, 600 potato, 600 scrap
	Global.upkeep = 0
	Global.robot_upkeep = 0
	RobotResearchStation.harvesterPowerLevel = 2
	RobotResearchStation._update_to_new_button_values(harvesters, RobotResearchStation.harvesterPowerLevel, RobotResearchStation.harvesterPowerUpkeep, RobotResearchStation.harvesterPowerUpkeepValues, RobotResearchStation.harvesterPowerUpkeepLabel, RobotResearchStation.harvesterPowerImprovements, RobotResearchStation.harvesterPowerImprovementLabel, RobotResearchStation.harvesterPowerButton, RobotResearchStation.harvesterPowerResources, levelBox)
	assert_str(RobotResearchStation.harvesterPowerPotatoPrice.text).is_equal("600")
	assert_str(RobotResearchStation.harvesterPowerScrapPrice.text).is_equal("600")
	assert_str(RobotResearchStation.harvesterPowerImprovementLabel.text).is_equal("Optimize power usage. Reduce upkeep by up to 9 per robot")
	assert_str(RobotResearchStation.harvesterPowerUpkeepLabel.text).is_equal("Upkeep	    -9")
	assert_str(RobotResearchStation.totalUpkeep.text).is_equal("Upkeep:\n0   ->   0")

	# Maxed out
	Global.upkeep = 0
	Global.robot_upkeep = 0
	RobotResearchStation.harvesterPowerLevel = 3
	RobotResearchStation._update_to_new_button_values(harvesters, RobotResearchStation.harvesterPowerLevel, RobotResearchStation.harvesterPowerUpkeep, RobotResearchStation.harvesterPowerUpkeepValues, RobotResearchStation.harvesterPowerUpkeepLabel, RobotResearchStation.harvesterPowerImprovements, RobotResearchStation.harvesterPowerImprovementLabel, RobotResearchStation.harvesterPowerButton, RobotResearchStation.harvesterPowerResources, levelBox)
	
	assert_bool(RobotResearchStation.totalUpkeep.visible).is_false()
	assert_bool(RobotResearchStation.harvesterPowerUpkeepLabel.visible).is_false()
	assert_str(RobotResearchStation.harvesterPowerImprovementLabel.text).is_equal("Up to -17 per robot")
	assert_str(RobotResearchStation.harvesterPowerButton.text).is_equal("Maxed out")
	assert_bool(RobotResearchStation.harvesterPowerButton.disabled).is_true()
	assert_bool(RobotResearchStation.harvesterPowerResources.visible).is_false()

	world.queue_free()
	
func test_update_global_harvester_power_values():
	Global.reset()
	
	Global.potatoCount = 35
	Global.scrapCount = 35
	RobotResearchStation.harvesterPowerLevel = 0
	RobotResearchStation.harvesterPowerLevel = RobotResearchStation._update_global_values(RobotResearchStation.harvesterPowerPrice, RobotResearchStation.harvesterPowerLevel)

	assert_int(Global.potatoCount).is_equal(5)
	assert_int(Global.scrapCount).is_equal(5)
	assert_int(RobotResearchStation.harvesterPowerLevel).is_equal(1)

	Global.potatoCount = 300
	Global.scrapCount = 300
	RobotResearchStation.harvesterPowerLevel = 1
	RobotResearchStation.harvesterPowerLevel = RobotResearchStation._update_global_values(RobotResearchStation.harvesterPowerPrice, RobotResearchStation.harvesterPowerLevel)
	assert_int(Global.potatoCount).is_equal(50)
	assert_int(Global.scrapCount).is_equal(50)
	assert_int(RobotResearchStation.harvesterPowerLevel).is_equal(2)
	
	Global.potatoCount = 1100
	Global.scrapCount = 1100
	RobotResearchStation.harvesterPowerLevel = 2
	RobotResearchStation.harvesterPowerLevel = RobotResearchStation._update_global_values(RobotResearchStation.harvesterPowerPrice, RobotResearchStation.harvesterPowerLevel)
	assert_int(Global.potatoCount).is_equal(500)
	assert_int(Global.scrapCount).is_equal(500)
	assert_int(RobotResearchStation.harvesterPowerLevel).is_equal(3)
	

func test_update_harvester_power_upkeep():
	var world = world_scene.instantiate()
	var starting_robots = world.get_node("robots")
	RobotShop._buy_robot(RobotShop.harvesterPrice, RobotShop.harvester_scene,RobotShop.harvester_ai_scene,starting_robots)
	var robots = world.find_child("robots").get_children()
	var harvesters = []
	for robot in robots:
		if is_instance_of(robot, harvester_robot):
			robot.upkeep = Global.harvesterUpkeep
			harvesters.append(robot)

	RobotResearchStation.harvesterPowerLevel = 0
	# - 3 upkeep
	Global.harvesterUpkeep += RobotResearchStation.update_robot_upkeep(harvesters, RobotResearchStation.harvesterPowerUpkeepValues, RobotResearchStation.harvesterPowerLevel)	
	assert_int(Global.harvesterUpkeep).is_equal(-2)
	for harvester in harvesters:
		assert_int(harvester.upkeep).is_equal(-2)
	
	RobotResearchStation.harvesterPowerLevel = 1
	# - 5 upkeep
	Global.harvesterUpkeep += RobotResearchStation.update_robot_upkeep(harvesters, RobotResearchStation.harvesterPowerUpkeepValues, RobotResearchStation.harvesterPowerLevel)	
	assert_int(Global.harvesterUpkeep).is_equal(-7)
	for harvester in harvesters:
		assert_int(harvester.upkeep).is_equal(-7)
		
	RobotResearchStation.harvesterPowerLevel = 2
	# - 9 upkeep
	Global.harvesterUpkeep += RobotResearchStation.update_robot_upkeep(harvesters, RobotResearchStation.harvesterPowerUpkeepValues, RobotResearchStation.harvesterPowerLevel)	
	assert_int(Global.harvesterUpkeep).is_equal(-16)
	for harvester in harvesters:
		assert_int(harvester.upkeep).is_equal(-16)
		
	world.queue_free()


func test_reset_harvester_power_values():
	Global.reset()
	
	RobotResearchStation.harvesterPowerLevel = RobotResearchStation.reset_feature(RobotResearchStation.harvesterPowerLevel, RobotResearchStation.harvesterPowerButton, RobotResearchStation.harvesterPowerResources, RobotResearchStation.harvesterPowerUpkeepLabel, RobotResearchStation.harvesterPowerLevel1, RobotResearchStation.harvesterPowerLevel2, RobotResearchStation.harvesterPowerLevel3)
	
	assert_int(RobotResearchStation.harvesterPowerLevel).is_equal(0)
	assert_str(RobotResearchStation.harvesterPowerButton.text).is_equal("Upgrade")
	assert_bool(RobotResearchStation.harvesterPowerButton.disabled).is_false()
	assert_bool(RobotResearchStation.harvesterPowerResources.visible).is_true()
	assert_bool(RobotResearchStation.harvesterPowerUpkeepLabel.visible).is_true()
#
