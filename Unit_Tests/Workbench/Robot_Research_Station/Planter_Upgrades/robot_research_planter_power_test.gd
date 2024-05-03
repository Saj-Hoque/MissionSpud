# GdUnit generated TestSuite
class_name ResearchPlanterPowerTest
extends GdUnitTestSuite
@warning_ignore('unused_parameter')
@warning_ignore('return_value_discarded')

var world_scene = preload("res://World/world.tscn")

func test_planter_power_button_disable_true():
	Global.reset()
	
	Global.potatoCount = 0
	Global.scrapCount = 0
	
	# Price, 30 potato, 30 scrap
	RobotResearchStation.planterPowerLevel = 0
	RobotResearchStation._check_if_enough(RobotResearchStation.planterPowerLevel, RobotResearchStation.planterPowerPrice, RobotResearchStation.planterPowerButton)
	assert_bool(RobotResearchStation.planterPowerButton.disabled).is_true()
	# Price, 200 potato, 200 scrap
	RobotResearchStation.planterPowerLevel = 1
	RobotResearchStation._check_if_enough(RobotResearchStation.planterPowerLevel, RobotResearchStation.planterPowerPrice, RobotResearchStation.planterPowerButton)
	assert_bool(RobotResearchStation.planterPowerButton.disabled).is_true()
	# Price, 600 potato, 600 scrap
	RobotResearchStation.planterPowerLevel = 2
	RobotResearchStation._check_if_enough(RobotResearchStation.planterPowerLevel, RobotResearchStation.planterPowerPrice, RobotResearchStation.planterPowerButton)
	assert_bool(RobotResearchStation.planterPowerButton.disabled).is_true()
	
	
	Global.potatoCount = 30
	Global.scrapCount = 30
	
	# Price, 30 potato, 30 scrap
	RobotResearchStation.planterPowerLevel = 0
	RobotResearchStation._check_if_enough(RobotResearchStation.planterPowerLevel, RobotResearchStation.planterPowerPrice, RobotResearchStation.planterPowerButton)
	assert_bool(RobotResearchStation.planterPowerButton.disabled).is_false()
	# Price, 200 potato, 200 scrap
	RobotResearchStation.planterPowerLevel = 1
	RobotResearchStation._check_if_enough(RobotResearchStation.planterPowerLevel, RobotResearchStation.planterPowerPrice, RobotResearchStation.planterPowerButton)
	assert_bool(RobotResearchStation.planterPowerButton.disabled).is_true()
	# Price, 600 potato, 600 scrap
	RobotResearchStation.planterPowerLevel = 2
	RobotResearchStation._check_if_enough(RobotResearchStation.planterPowerLevel, RobotResearchStation.planterPowerPrice, RobotResearchStation.planterPowerButton)
	assert_bool(RobotResearchStation.planterPowerButton.disabled).is_true()
	
	Global.potatoCount = 200
	Global.scrapCount = 200
	
	# Price, 30 potato, 30 scrap
	RobotResearchStation.planterPowerLevel = 0
	RobotResearchStation._check_if_enough(RobotResearchStation.planterPowerLevel, RobotResearchStation.planterPowerPrice, RobotResearchStation.planterPowerButton)
	assert_bool(RobotResearchStation.planterPowerButton.disabled).is_false()
	# Price, 200 potato, 200 scrap
	RobotResearchStation.planterPowerLevel = 1
	RobotResearchStation._check_if_enough(RobotResearchStation.planterPowerLevel, RobotResearchStation.planterPowerPrice, RobotResearchStation.planterPowerButton)
	assert_bool(RobotResearchStation.planterPowerButton.disabled).is_false()
	# Price, 600 potato, 600 scrap
	RobotResearchStation.planterPowerLevel = 2
	RobotResearchStation._check_if_enough(RobotResearchStation.planterPowerLevel, RobotResearchStation.planterPowerPrice, RobotResearchStation.planterPowerButton)
	assert_bool(RobotResearchStation.planterPowerButton.disabled).is_true()
	

func test_planter_power_button_disable_false():
	Global.reset()
	
	Global.potatoCount = 600
	Global.scrapCount = 600
	
	# Price, 30 potato, 30 scrap
	RobotResearchStation.planterPowerLevel = 0
	RobotResearchStation._check_if_enough(RobotResearchStation.planterPowerLevel, RobotResearchStation.planterPowerPrice, RobotResearchStation.planterPowerButton)
	assert_bool(RobotResearchStation.planterPowerButton.disabled).is_false()
	
	# Price, 200 potato, 200 scrap
	RobotResearchStation.planterPowerLevel = 1
	RobotResearchStation._check_if_enough(RobotResearchStation.planterPowerLevel, RobotResearchStation.planterPowerPrice, RobotResearchStation.planterPowerButton)
	assert_bool(RobotResearchStation.planterPowerButton.disabled).is_false()
	
	# Price, 600 potato, 600 scrap
	RobotResearchStation.planterPowerLevel = 2
	RobotResearchStation._check_if_enough(RobotResearchStation.planterPowerLevel, RobotResearchStation.planterPowerPrice, RobotResearchStation.planterPowerButton)
	assert_bool(RobotResearchStation.planterPowerButton.disabled).is_false()


func test_update_planter_power_label_values():
	var world = world_scene.instantiate()
	var levelBox = RobotResearchStation.planterPowerLevel1
	var starting_robots = world.get_node("robots")
	RobotShop._buy_robot(RobotShop.planterPrice, RobotShop.planter_scene,RobotShop.planter_ai_scene,starting_robots)
	var robots = world.find_child("robots").get_children()
	var planters = []
	for robot in robots:
		if is_instance_of(robot, planter_robot):
			planters.append(robot)
	
	# Price, 30 potato, 30 scrap
	Global.upkeep = 0
	Global.robot_upkeep = 0
	RobotResearchStation.planterPowerLevel = 0
	RobotResearchStation._update_to_new_button_values(planters, RobotResearchStation.planterPowerLevel, RobotResearchStation.planterPowerUpkeep, RobotResearchStation.planterPowerUpkeepValues, RobotResearchStation.planterPowerUpkeepLabel, RobotResearchStation.planterPowerImprovements, RobotResearchStation.planterPowerImprovementLabel, RobotResearchStation.planterPowerButton, RobotResearchStation.planterPowerResources, levelBox)
	assert_str(RobotResearchStation.planterPowerPotatoPrice.text).is_equal("30")
	assert_str(RobotResearchStation.planterPowerScrapPrice.text).is_equal("30")
	assert_str(RobotResearchStation.planterPowerImprovementLabel.text).is_equal("Optimize power usage. Reduce upkeep by up to 3 per robot")
	assert_str(RobotResearchStation.planterPowerUpkeepLabel.text).is_equal("Upkeep	    -3")
	assert_str(RobotResearchStation.totalUpkeep.text).is_equal("Upkeep:\n0   ->   0")
	
	## Price, 200 potato, 200 scrap
	Global.upkeep = 0
	Global.robot_upkeep = 0
	RobotResearchStation.planterPowerLevel = 1
	RobotResearchStation._update_to_new_button_values(planters, RobotResearchStation.planterPowerLevel, RobotResearchStation.planterPowerUpkeep, RobotResearchStation.planterPowerUpkeepValues, RobotResearchStation.planterPowerUpkeepLabel, RobotResearchStation.planterPowerImprovements, RobotResearchStation.planterPowerImprovementLabel, RobotResearchStation.planterPowerButton, RobotResearchStation.planterPowerResources, levelBox)
	assert_str(RobotResearchStation.planterPowerPotatoPrice.text).is_equal("200")
	assert_str(RobotResearchStation.planterPowerScrapPrice.text).is_equal("200")
	assert_str(RobotResearchStation.planterPowerImprovementLabel.text).is_equal("Optimize power usage. Reduce upkeep by up to 5 per robot")
	assert_str(RobotResearchStation.planterPowerUpkeepLabel.text).is_equal("Upkeep	    -5")
	assert_str(RobotResearchStation.totalUpkeep.text).is_equal("Upkeep:\n0   ->   0")
	
	# Price, 600 potato, 600 scrap
	Global.upkeep = 0
	Global.robot_upkeep = 0
	RobotResearchStation.planterPowerLevel = 2
	RobotResearchStation._update_to_new_button_values(planters, RobotResearchStation.planterPowerLevel, RobotResearchStation.planterPowerUpkeep, RobotResearchStation.planterPowerUpkeepValues, RobotResearchStation.planterPowerUpkeepLabel, RobotResearchStation.planterPowerImprovements, RobotResearchStation.planterPowerImprovementLabel, RobotResearchStation.planterPowerButton, RobotResearchStation.planterPowerResources, levelBox)
	assert_str(RobotResearchStation.planterPowerPotatoPrice.text).is_equal("600")
	assert_str(RobotResearchStation.planterPowerScrapPrice.text).is_equal("600")
	assert_str(RobotResearchStation.planterPowerImprovementLabel.text).is_equal("Optimize power usage. Reduce upkeep by up to 9 per robot")
	assert_str(RobotResearchStation.planterPowerUpkeepLabel.text).is_equal("Upkeep	    -9")
	assert_str(RobotResearchStation.totalUpkeep.text).is_equal("Upkeep:\n0   ->   0")

	# Maxed out
	Global.upkeep = 0
	Global.robot_upkeep = 0
	RobotResearchStation.planterPowerLevel = 3
	RobotResearchStation._update_to_new_button_values(planters, RobotResearchStation.planterPowerLevel, RobotResearchStation.planterPowerUpkeep, RobotResearchStation.planterPowerUpkeepValues, RobotResearchStation.planterPowerUpkeepLabel, RobotResearchStation.planterPowerImprovements, RobotResearchStation.planterPowerImprovementLabel, RobotResearchStation.planterPowerButton, RobotResearchStation.planterPowerResources, levelBox)
	
	assert_bool(RobotResearchStation.totalUpkeep.visible).is_false()
	assert_bool(RobotResearchStation.planterPowerUpkeepLabel.visible).is_false()
	assert_str(RobotResearchStation.planterPowerImprovementLabel.text).is_equal("Up to -17 per robot")
	assert_str(RobotResearchStation.planterPowerButton.text).is_equal("Maxed out")
	assert_bool(RobotResearchStation.planterPowerButton.disabled).is_true()
	assert_bool(RobotResearchStation.planterPowerResources.visible).is_false()

	world.queue_free()
	
func test_update_global_planter_power_values():
	Global.reset()
	
	Global.potatoCount = 35
	Global.scrapCount = 35
	RobotResearchStation.planterPowerLevel = 0
	RobotResearchStation.planterPowerLevel = RobotResearchStation._update_global_values(RobotResearchStation.planterPowerPrice, RobotResearchStation.planterPowerLevel)

	assert_int(Global.potatoCount).is_equal(5)
	assert_int(Global.scrapCount).is_equal(5)
	assert_int(RobotResearchStation.planterPowerLevel).is_equal(1)

	Global.potatoCount = 250
	Global.scrapCount = 250
	RobotResearchStation.planterPowerLevel = 1
	RobotResearchStation.planterPowerLevel = RobotResearchStation._update_global_values(RobotResearchStation.planterPowerPrice, RobotResearchStation.planterPowerLevel)
	assert_int(Global.potatoCount).is_equal(50)
	assert_int(Global.scrapCount).is_equal(50)
	assert_int(RobotResearchStation.planterPowerLevel).is_equal(2)
	
	Global.potatoCount = 1100
	Global.scrapCount = 1100
	RobotResearchStation.planterPowerLevel = 2
	RobotResearchStation.planterPowerLevel = RobotResearchStation._update_global_values(RobotResearchStation.planterPowerPrice, RobotResearchStation.planterPowerLevel)
	assert_int(Global.potatoCount).is_equal(500)
	assert_int(Global.scrapCount).is_equal(500)
	assert_int(RobotResearchStation.planterPowerLevel).is_equal(3)
	

func test_update_planter_power_upkeep():
	var world = world_scene.instantiate()
	var starting_robots = world.get_node("robots")
	RobotShop._buy_robot(RobotShop.planterPrice, RobotShop.planter_scene,RobotShop.planter_ai_scene,starting_robots)
	var robots = world.find_child("robots").get_children()
	var planters = []
	for robot in robots:
		if is_instance_of(robot, planter_robot):
			robot.upkeep = Global.planterUpkeep
			planters.append(robot)

	RobotResearchStation.planterPowerLevel = 0
	# - 3 upkeep
	Global.planterUpkeep += RobotResearchStation.update_robot_upkeep(planters, RobotResearchStation.planterPowerUpkeepValues, RobotResearchStation.planterPowerLevel)	
	assert_int(Global.planterUpkeep).is_equal(-2)
	for planter in planters:
		assert_int(planter.upkeep).is_equal(-2)
	
	RobotResearchStation.planterPowerLevel = 1
	# - 5 upkeep
	Global.planterUpkeep += RobotResearchStation.update_robot_upkeep(planters, RobotResearchStation.planterPowerUpkeepValues, RobotResearchStation.planterPowerLevel)	
	assert_int(Global.planterUpkeep).is_equal(-7)
	for planter in planters:
		assert_int(planter.upkeep).is_equal(-7)
		
	RobotResearchStation.planterPowerLevel = 2
	# - 9 upkeep
	Global.planterUpkeep += RobotResearchStation.update_robot_upkeep(planters, RobotResearchStation.planterPowerUpkeepValues, RobotResearchStation.planterPowerLevel)	
	assert_int(Global.planterUpkeep).is_equal(-16)
	for planter in planters:
		assert_int(planter.upkeep).is_equal(-16)
		
	world.queue_free()


func test_reset_planter_power_values():
	Global.reset()
	
	RobotResearchStation.planterPowerLevel = RobotResearchStation.reset_feature(RobotResearchStation.planterPowerLevel, RobotResearchStation.planterPowerButton, RobotResearchStation.planterPowerResources, RobotResearchStation.planterPowerUpkeepLabel, RobotResearchStation.planterPowerLevel1, RobotResearchStation.planterPowerLevel2, RobotResearchStation.planterPowerLevel3)
	
	assert_int(RobotResearchStation.planterPowerLevel).is_equal(0)
	assert_str(RobotResearchStation.planterPowerButton.text).is_equal("Upgrade")
	assert_bool(RobotResearchStation.planterPowerButton.disabled).is_false()
	assert_bool(RobotResearchStation.planterPowerResources.visible).is_true()
	assert_bool(RobotResearchStation.planterPowerUpkeepLabel.visible).is_true()
#
