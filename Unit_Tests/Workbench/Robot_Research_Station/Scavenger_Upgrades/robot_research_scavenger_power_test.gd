# GdUnit generated TestSuite
class_name ResearchScavengerPowerTest
extends GdUnitTestSuite
@warning_ignore('unused_parameter')
@warning_ignore('return_value_discarded')

var world_scene = preload("res://World/world.tscn")

func test_scavenger_power_button_disable_true():
	Global.reset()
	
	Global.potatoCount = 0
	Global.scrapCount = 0
	
	# Price, 30 potato, 30 scrap
	RobotResearchStation.scavengerPowerLevel = 0
	RobotResearchStation._check_if_enough(RobotResearchStation.scavengerPowerLevel, RobotResearchStation.scavengerPowerPrice, RobotResearchStation.scavengerPowerButton)
	assert_bool(RobotResearchStation.scavengerPowerButton.disabled).is_true()
	# Price, 250 potato, 250 scrap
	RobotResearchStation.scavengerPowerLevel = 1
	RobotResearchStation._check_if_enough(RobotResearchStation.scavengerPowerLevel, RobotResearchStation.scavengerPowerPrice, RobotResearchStation.scavengerPowerButton)
	assert_bool(RobotResearchStation.scavengerPowerButton.disabled).is_true()
	# Price, 600 potato, 600 scrap
	RobotResearchStation.scavengerPowerLevel = 2
	RobotResearchStation._check_if_enough(RobotResearchStation.scavengerPowerLevel, RobotResearchStation.scavengerPowerPrice, RobotResearchStation.scavengerPowerButton)
	assert_bool(RobotResearchStation.scavengerPowerButton.disabled).is_true()
	
	
	Global.potatoCount = 30
	Global.scrapCount = 30
	
	# Price, 30 potato, 30 scrap
	RobotResearchStation.scavengerPowerLevel = 0
	RobotResearchStation._check_if_enough(RobotResearchStation.scavengerPowerLevel, RobotResearchStation.scavengerPowerPrice, RobotResearchStation.scavengerPowerButton)
	assert_bool(RobotResearchStation.scavengerPowerButton.disabled).is_false()
	# Price, 250 potato, 250 scrap
	RobotResearchStation.scavengerPowerLevel = 1
	RobotResearchStation._check_if_enough(RobotResearchStation.scavengerPowerLevel, RobotResearchStation.scavengerPowerPrice, RobotResearchStation.scavengerPowerButton)
	assert_bool(RobotResearchStation.scavengerPowerButton.disabled).is_true()
	# Price, 600 potato, 600 scrap
	RobotResearchStation.scavengerPowerLevel = 2
	RobotResearchStation._check_if_enough(RobotResearchStation.scavengerPowerLevel, RobotResearchStation.scavengerPowerPrice, RobotResearchStation.scavengerPowerButton)
	assert_bool(RobotResearchStation.scavengerPowerButton.disabled).is_true()
	
	Global.potatoCount = 250
	Global.scrapCount = 250
	
	# Price, 30 potato, 30 scrap
	RobotResearchStation.scavengerPowerLevel = 0
	RobotResearchStation._check_if_enough(RobotResearchStation.scavengerPowerLevel, RobotResearchStation.scavengerPowerPrice, RobotResearchStation.scavengerPowerButton)
	assert_bool(RobotResearchStation.scavengerPowerButton.disabled).is_false()
	# Price, 250 potato, 250 scrap
	RobotResearchStation.scavengerPowerLevel = 1
	RobotResearchStation._check_if_enough(RobotResearchStation.scavengerPowerLevel, RobotResearchStation.scavengerPowerPrice, RobotResearchStation.scavengerPowerButton)
	assert_bool(RobotResearchStation.scavengerPowerButton.disabled).is_false()
	# Price, 600 potato, 600 scrap
	RobotResearchStation.scavengerPowerLevel = 2
	RobotResearchStation._check_if_enough(RobotResearchStation.scavengerPowerLevel, RobotResearchStation.scavengerPowerPrice, RobotResearchStation.scavengerPowerButton)
	assert_bool(RobotResearchStation.scavengerPowerButton.disabled).is_true()
	

func test_scavenger_power_button_disable_false():
	Global.reset()
	
	Global.potatoCount = 600
	Global.scrapCount = 600
	
	# Price, 30 potato, 30 scrap
	RobotResearchStation.scavengerPowerLevel = 0
	RobotResearchStation._check_if_enough(RobotResearchStation.scavengerPowerLevel, RobotResearchStation.scavengerPowerPrice, RobotResearchStation.scavengerPowerButton)
	assert_bool(RobotResearchStation.scavengerPowerButton.disabled).is_false()
	
	# Price, 250 potato, 250 scrap
	RobotResearchStation.scavengerPowerLevel = 1
	RobotResearchStation._check_if_enough(RobotResearchStation.scavengerPowerLevel, RobotResearchStation.scavengerPowerPrice, RobotResearchStation.scavengerPowerButton)
	assert_bool(RobotResearchStation.scavengerPowerButton.disabled).is_false()
	
	# Price, 600 potato, 600 scrap
	RobotResearchStation.scavengerPowerLevel = 2
	RobotResearchStation._check_if_enough(RobotResearchStation.scavengerPowerLevel, RobotResearchStation.scavengerPowerPrice, RobotResearchStation.scavengerPowerButton)
	assert_bool(RobotResearchStation.scavengerPowerButton.disabled).is_false()


func test_update_scavenger_power_label_values():
	var world = world_scene.instantiate()
	var levelBox = RobotResearchStation.scavengerPowerLevel1
	var starting_robots = world.get_node("robots")
	RobotShop._buy_robot(RobotShop.scavengerPrice, RobotShop.scavenger_scene,RobotShop.scavenger_ai_scene,starting_robots)
	var robots = world.find_child("robots").get_children()
	var scavengers = []
	for robot in robots:
		if is_instance_of(robot, scavenger_robot):
			scavengers.append(robot)
	
	# Price, 30 potato, 30 scrap
	Global.upkeep = 0
	Global.robot_upkeep = 0
	RobotResearchStation.scavengerPowerLevel = 0
	RobotResearchStation._update_to_new_button_values(scavengers, RobotResearchStation.scavengerPowerLevel, RobotResearchStation.scavengerPowerUpkeep, RobotResearchStation.scavengerPowerUpkeepValues, RobotResearchStation.scavengerPowerUpkeepLabel, RobotResearchStation.scavengerPowerImprovements, RobotResearchStation.scavengerPowerImprovementLabel, RobotResearchStation.scavengerPowerButton, RobotResearchStation.scavengerPowerResources, levelBox)
	assert_str(RobotResearchStation.scavengerPowerPotatoPrice.text).is_equal("30")
	assert_str(RobotResearchStation.scavengerPowerScrapPrice.text).is_equal("30")
	assert_str(RobotResearchStation.scavengerPowerImprovementLabel.text).is_equal("Optimize power usage. Reduce upkeep by up to 3 per robot")
	assert_str(RobotResearchStation.scavengerPowerUpkeepLabel.text).is_equal("Upkeep	    -3")
	assert_str(RobotResearchStation.totalUpkeep.text).is_equal("Upkeep:\n0   ->   0")
	
	## Price, 250 potato, 250 scrap
	Global.upkeep = 0
	Global.robot_upkeep = 0
	RobotResearchStation.scavengerPowerLevel = 1
	RobotResearchStation._update_to_new_button_values(scavengers, RobotResearchStation.scavengerPowerLevel, RobotResearchStation.scavengerPowerUpkeep, RobotResearchStation.scavengerPowerUpkeepValues, RobotResearchStation.scavengerPowerUpkeepLabel, RobotResearchStation.scavengerPowerImprovements, RobotResearchStation.scavengerPowerImprovementLabel, RobotResearchStation.scavengerPowerButton, RobotResearchStation.scavengerPowerResources, levelBox)
	assert_str(RobotResearchStation.scavengerPowerPotatoPrice.text).is_equal("250")
	assert_str(RobotResearchStation.scavengerPowerScrapPrice.text).is_equal("250")
	assert_str(RobotResearchStation.scavengerPowerImprovementLabel.text).is_equal("Optimize power usage. Reduce upkeep by up to 5 per robot")
	assert_str(RobotResearchStation.scavengerPowerUpkeepLabel.text).is_equal("Upkeep	    -5")
	assert_str(RobotResearchStation.totalUpkeep.text).is_equal("Upkeep:\n0   ->   0")
	
	# Price, 600 potato, 600 scrap
	Global.upkeep = 0
	Global.robot_upkeep = 0
	RobotResearchStation.scavengerPowerLevel = 2
	RobotResearchStation._update_to_new_button_values(scavengers, RobotResearchStation.scavengerPowerLevel, RobotResearchStation.scavengerPowerUpkeep, RobotResearchStation.scavengerPowerUpkeepValues, RobotResearchStation.scavengerPowerUpkeepLabel, RobotResearchStation.scavengerPowerImprovements, RobotResearchStation.scavengerPowerImprovementLabel, RobotResearchStation.scavengerPowerButton, RobotResearchStation.scavengerPowerResources, levelBox)
	assert_str(RobotResearchStation.scavengerPowerPotatoPrice.text).is_equal("600")
	assert_str(RobotResearchStation.scavengerPowerScrapPrice.text).is_equal("600")
	assert_str(RobotResearchStation.scavengerPowerImprovementLabel.text).is_equal("Optimize power usage. Reduce upkeep by up to 9 per robot")
	assert_str(RobotResearchStation.scavengerPowerUpkeepLabel.text).is_equal("Upkeep	    -9")
	assert_str(RobotResearchStation.totalUpkeep.text).is_equal("Upkeep:\n0   ->   0")

	# Maxed out
	Global.upkeep = 0
	Global.robot_upkeep = 0
	RobotResearchStation.scavengerPowerLevel = 3
	RobotResearchStation._update_to_new_button_values(scavengers, RobotResearchStation.scavengerPowerLevel, RobotResearchStation.scavengerPowerUpkeep, RobotResearchStation.scavengerPowerUpkeepValues, RobotResearchStation.scavengerPowerUpkeepLabel, RobotResearchStation.scavengerPowerImprovements, RobotResearchStation.scavengerPowerImprovementLabel, RobotResearchStation.scavengerPowerButton, RobotResearchStation.scavengerPowerResources, levelBox)
	
	assert_bool(RobotResearchStation.totalUpkeep.visible).is_false()
	assert_bool(RobotResearchStation.scavengerPowerUpkeepLabel.visible).is_false()
	assert_str(RobotResearchStation.scavengerPowerImprovementLabel.text).is_equal("Up to -17 per robot")
	assert_str(RobotResearchStation.scavengerPowerButton.text).is_equal("Maxed out")
	assert_bool(RobotResearchStation.scavengerPowerButton.disabled).is_true()
	assert_bool(RobotResearchStation.scavengerPowerResources.visible).is_false()

	world.queue_free()
	
func test_update_global_scavenger_power_values():
	Global.reset()
	
	Global.potatoCount = 35
	Global.scrapCount = 35
	RobotResearchStation.scavengerPowerLevel = 0
	RobotResearchStation.scavengerPowerLevel = RobotResearchStation._update_global_values(RobotResearchStation.scavengerPowerPrice, RobotResearchStation.scavengerPowerLevel)

	assert_int(Global.potatoCount).is_equal(5)
	assert_int(Global.scrapCount).is_equal(5)
	assert_int(RobotResearchStation.scavengerPowerLevel).is_equal(1)

	Global.potatoCount = 300
	Global.scrapCount = 300
	RobotResearchStation.scavengerPowerLevel = 1
	RobotResearchStation.scavengerPowerLevel = RobotResearchStation._update_global_values(RobotResearchStation.scavengerPowerPrice, RobotResearchStation.scavengerPowerLevel)
	assert_int(Global.potatoCount).is_equal(50)
	assert_int(Global.scrapCount).is_equal(50)
	assert_int(RobotResearchStation.scavengerPowerLevel).is_equal(2)
	
	Global.potatoCount = 1100
	Global.scrapCount = 1100
	RobotResearchStation.scavengerPowerLevel = 2
	RobotResearchStation.scavengerPowerLevel = RobotResearchStation._update_global_values(RobotResearchStation.scavengerPowerPrice, RobotResearchStation.scavengerPowerLevel)
	assert_int(Global.potatoCount).is_equal(500)
	assert_int(Global.scrapCount).is_equal(500)
	assert_int(RobotResearchStation.scavengerPowerLevel).is_equal(3)
	

func test_update_scavenger_power_upkeep():
	var world = world_scene.instantiate()
	var starting_robots = world.get_node("robots")
	RobotShop._buy_robot(RobotShop.scavengerPrice, RobotShop.scavenger_scene,RobotShop.scavenger_ai_scene,starting_robots)
	var robots = world.find_child("robots").get_children()
	var scavengers = []
	for robot in robots:
		if is_instance_of(robot, scavenger_robot):
			robot.upkeep = Global.scavengerUpkeep
			scavengers.append(robot)

	RobotResearchStation.scavengerPowerLevel = 0
	# - 3 upkeep
	Global.scavengerUpkeep += RobotResearchStation.update_robot_upkeep(scavengers, RobotResearchStation.scavengerPowerUpkeepValues, RobotResearchStation.scavengerPowerLevel)	
	assert_int(Global.scavengerUpkeep).is_equal(-2)
	for scavenger in scavengers:
		assert_int(scavenger.upkeep).is_equal(-2)
	
	RobotResearchStation.scavengerPowerLevel = 1
	# - 5 upkeep
	Global.scavengerUpkeep += RobotResearchStation.update_robot_upkeep(scavengers, RobotResearchStation.scavengerPowerUpkeepValues, RobotResearchStation.scavengerPowerLevel)	
	assert_int(Global.scavengerUpkeep).is_equal(-7)
	for scavenger in scavengers:
		assert_int(scavenger.upkeep).is_equal(-7)
		
	RobotResearchStation.scavengerPowerLevel = 2
	# - 9 upkeep
	Global.scavengerUpkeep += RobotResearchStation.update_robot_upkeep(scavengers, RobotResearchStation.scavengerPowerUpkeepValues, RobotResearchStation.scavengerPowerLevel)	
	assert_int(Global.scavengerUpkeep).is_equal(-16)
	for scavenger in scavengers:
		assert_int(scavenger.upkeep).is_equal(-16)
		
	world.queue_free()


func test_reset_scavenger_power_values():
	Global.reset()
	
	RobotResearchStation.scavengerPowerLevel = RobotResearchStation.reset_feature(RobotResearchStation.scavengerPowerLevel, RobotResearchStation.scavengerPowerButton, RobotResearchStation.scavengerPowerResources, RobotResearchStation.scavengerPowerUpkeepLabel, RobotResearchStation.scavengerPowerLevel1, RobotResearchStation.scavengerPowerLevel2, RobotResearchStation.scavengerPowerLevel3)
	
	assert_int(RobotResearchStation.scavengerPowerLevel).is_equal(0)
	assert_str(RobotResearchStation.scavengerPowerButton.text).is_equal("Upgrade")
	assert_bool(RobotResearchStation.scavengerPowerButton.disabled).is_false()
	assert_bool(RobotResearchStation.scavengerPowerResources.visible).is_true()
	assert_bool(RobotResearchStation.scavengerPowerUpkeepLabel.visible).is_true()
#
