# GdUnit generated TestSuite
class_name ResearchPlanterSpeedTest
extends GdUnitTestSuite
@warning_ignore('unused_parameter')
@warning_ignore('return_value_discarded')

var world_scene = preload("res://World/world.tscn")

func test_planter_speed_button_disable_true():
	Global.reset()
	
	Global.potatoCount = 0
	Global.scrapCount = 0
	
	# Price, 5 potato, 5 scrap
	RobotResearchStation.planterSpeedLevel = 0
	RobotResearchStation._check_if_enough(RobotResearchStation.planterSpeedLevel, RobotResearchStation.planterSpeedPrice, RobotResearchStation.planterSpeedButton)
	assert_bool(RobotResearchStation.planterSpeedButton.disabled).is_true()
	# Price, 25 potato, 25 scrap
	RobotResearchStation.planterSpeedLevel = 1
	RobotResearchStation._check_if_enough(RobotResearchStation.planterSpeedLevel, RobotResearchStation.planterSpeedPrice, RobotResearchStation.planterSpeedButton)
	assert_bool(RobotResearchStation.planterSpeedButton.disabled).is_true()
	# Price, 125 potato, 125 scrap
	RobotResearchStation.planterSpeedLevel = 2
	RobotResearchStation._check_if_enough(RobotResearchStation.planterSpeedLevel, RobotResearchStation.planterSpeedPrice, RobotResearchStation.planterSpeedButton)
	assert_bool(RobotResearchStation.planterSpeedButton.disabled).is_true()
	
	
	Global.potatoCount = 5
	Global.scrapCount = 5
	
	# Price, 5 potato, 5 scrap
	RobotResearchStation.planterSpeedLevel = 0
	RobotResearchStation._check_if_enough(RobotResearchStation.planterSpeedLevel, RobotResearchStation.planterSpeedPrice, RobotResearchStation.planterSpeedButton)
	assert_bool(RobotResearchStation.planterSpeedButton.disabled).is_false()
	# Price, 25 potato, 25 scrap
	RobotResearchStation.planterSpeedLevel = 1
	RobotResearchStation._check_if_enough(RobotResearchStation.planterSpeedLevel, RobotResearchStation.planterSpeedPrice, RobotResearchStation.planterSpeedButton)
	assert_bool(RobotResearchStation.planterSpeedButton.disabled).is_true()
	# Price, 125 potato, 125 scrap
	RobotResearchStation.planterSpeedLevel = 2
	RobotResearchStation._check_if_enough(RobotResearchStation.planterSpeedLevel, RobotResearchStation.planterSpeedPrice, RobotResearchStation.planterSpeedButton)
	assert_bool(RobotResearchStation.planterSpeedButton.disabled).is_true()
	
	Global.potatoCount = 25
	Global.scrapCount = 25
	
	# Price, 5 potato, 5 scrap
	RobotResearchStation.planterSpeedLevel = 0
	RobotResearchStation._check_if_enough(RobotResearchStation.planterSpeedLevel, RobotResearchStation.planterSpeedPrice, RobotResearchStation.planterSpeedButton)
	assert_bool(RobotResearchStation.planterSpeedButton.disabled).is_false()
	# Price, 25 potato, 25 scrap
	RobotResearchStation.planterSpeedLevel = 1
	RobotResearchStation._check_if_enough(RobotResearchStation.planterSpeedLevel, RobotResearchStation.planterSpeedPrice, RobotResearchStation.planterSpeedButton)
	assert_bool(RobotResearchStation.planterSpeedButton.disabled).is_false()
	# Price, 125 potato, 125 scrap
	RobotResearchStation.planterSpeedLevel = 2
	RobotResearchStation._check_if_enough(RobotResearchStation.planterSpeedLevel, RobotResearchStation.planterSpeedPrice, RobotResearchStation.planterSpeedButton)
	assert_bool(RobotResearchStation.planterSpeedButton.disabled).is_true()
	

func test_planter_speed_button_disable_false():
	Global.reset()
	
	Global.potatoCount = 125
	Global.scrapCount = 125
	
	# Price, 5 potato, 5 scrap
	RobotResearchStation.planterSpeedLevel = 0
	RobotResearchStation._check_if_enough(RobotResearchStation.planterSpeedLevel, RobotResearchStation.planterSpeedPrice, RobotResearchStation.planterSpeedButton)
	assert_bool(RobotResearchStation.planterSpeedButton.disabled).is_false()
	
	# Price, 25 potato, 25 scrap
	RobotResearchStation.planterSpeedLevel = 1
	RobotResearchStation._check_if_enough(RobotResearchStation.planterSpeedLevel, RobotResearchStation.planterSpeedPrice, RobotResearchStation.planterSpeedButton)
	assert_bool(RobotResearchStation.planterSpeedButton.disabled).is_false()
	
	# Price, 125 potato, 125 scrap
	RobotResearchStation.planterSpeedLevel = 2
	RobotResearchStation._check_if_enough(RobotResearchStation.planterSpeedLevel, RobotResearchStation.planterSpeedPrice, RobotResearchStation.planterSpeedButton)
	assert_bool(RobotResearchStation.planterSpeedButton.disabled).is_false()


func test_update_planter_speed_label_values():
	var world = world_scene.instantiate()
	var levelBox = RobotResearchStation.planterSpeedLevel1
	var starting_robots = world.get_node("robots")
	RobotShop._buy_robot(RobotShop.planterPrice, RobotShop.planter_scene,RobotShop.planter_ai_scene,starting_robots)
	var robots = world.find_child("robots").get_children()
	var planters = []
	for robot in robots:
		if is_instance_of(robot, planter_robot):
			planters.append(robot)
	
	# Price, 5 potato, 5 scrap
	Global.upkeep = 0
	Global.robot_upkeep = 0
	RobotResearchStation.planterSpeedLevel = 0
	RobotResearchStation._update_to_new_button_values(planters, RobotResearchStation.planterSpeedLevel, RobotResearchStation.planterSpeedUpkeep, RobotResearchStation.planterSpeedUpkeepValues, RobotResearchStation.planterSpeedUpkeepLabel, RobotResearchStation.planterSpeedImprovements, RobotResearchStation.planterSpeedImprovementLabel, RobotResearchStation.planterSpeedButton, RobotResearchStation.planterSpeedResources, levelBox)
	assert_str(RobotResearchStation.planterSpeedPotatoPrice.text).is_equal("5")
	assert_str(RobotResearchStation.planterSpeedScrapPrice.text).is_equal("5")
	assert_str(RobotResearchStation.planterSpeedImprovementLabel.text).is_equal("Enhance robots mobility.    30   ->   40 m/s")
	assert_str(RobotResearchStation.planterSpeedUpkeepLabel.text).is_equal("Upkeep	    +1")
	assert_str(RobotResearchStation.totalUpkeep.text).is_equal("Upkeep:\n0   ->   2")
	
	## Price, 25 potato, 25 scrap
	Global.upkeep = 0
	Global.robot_upkeep = 0
	RobotResearchStation.planterSpeedLevel = 1
	RobotResearchStation._update_to_new_button_values(planters, RobotResearchStation.planterSpeedLevel, RobotResearchStation.planterSpeedUpkeep, RobotResearchStation.planterSpeedUpkeepValues, RobotResearchStation.planterSpeedUpkeepLabel, RobotResearchStation.planterSpeedImprovements, RobotResearchStation.planterSpeedImprovementLabel, RobotResearchStation.planterSpeedButton, RobotResearchStation.planterSpeedResources, levelBox)
	assert_str(RobotResearchStation.planterSpeedPotatoPrice.text).is_equal("25")
	assert_str(RobotResearchStation.planterSpeedScrapPrice.text).is_equal("25")
	assert_str(RobotResearchStation.planterSpeedImprovementLabel.text).is_equal("Enhance robots mobility.    40   ->   50 m/s")
	assert_str(RobotResearchStation.planterSpeedUpkeepLabel.text).is_equal("Upkeep	    +3")
	assert_str(RobotResearchStation.totalUpkeep.text).is_equal("Upkeep:\n0   ->   6")
	
	# Price, 125 potato, 125 scrap
	Global.upkeep = 0
	Global.robot_upkeep = 0
	RobotResearchStation.planterSpeedLevel = 2
	RobotResearchStation._update_to_new_button_values(planters, RobotResearchStation.planterSpeedLevel, RobotResearchStation.planterSpeedUpkeep, RobotResearchStation.planterSpeedUpkeepValues, RobotResearchStation.planterSpeedUpkeepLabel, RobotResearchStation.planterSpeedImprovements, RobotResearchStation.planterSpeedImprovementLabel, RobotResearchStation.planterSpeedButton, RobotResearchStation.planterSpeedResources, levelBox)
	assert_str(RobotResearchStation.planterSpeedPotatoPrice.text).is_equal("125")
	assert_str(RobotResearchStation.planterSpeedScrapPrice.text).is_equal("125")
	assert_str(RobotResearchStation.planterSpeedImprovementLabel.text).is_equal("Enhance robots mobility.    50   ->   60 m/s")
	assert_str(RobotResearchStation.planterSpeedUpkeepLabel.text).is_equal("Upkeep	    +9")
	assert_str(RobotResearchStation.totalUpkeep.text).is_equal("Upkeep:\n0   ->   18")

	# Maxed out
	Global.upkeep = 0
	Global.robot_upkeep = 0
	RobotResearchStation.planterSpeedLevel = 3
	RobotResearchStation._update_to_new_button_values(planters, RobotResearchStation.planterSpeedLevel, RobotResearchStation.planterSpeedUpkeep, RobotResearchStation.planterSpeedUpkeepValues, RobotResearchStation.planterSpeedUpkeepLabel, RobotResearchStation.planterSpeedImprovements, RobotResearchStation.planterSpeedImprovementLabel, RobotResearchStation.planterSpeedButton, RobotResearchStation.planterSpeedResources, levelBox)
	
	assert_bool(RobotResearchStation.totalUpkeep.visible).is_false()
	assert_bool(RobotResearchStation.planterSpeedUpkeepLabel.visible).is_false()
	assert_str(RobotResearchStation.planterSpeedImprovementLabel.text).is_equal("60 m/s")
	assert_str(RobotResearchStation.planterSpeedButton.text).is_equal("Maxed out")
	assert_bool(RobotResearchStation.planterSpeedButton.disabled).is_true()
	assert_bool(RobotResearchStation.planterSpeedResources.visible).is_false()

	world.queue_free()
	
func test_update_global_planter_speed_values():
	Global.reset()
	
	Global.potatoCount = 10
	Global.scrapCount = 10
	RobotResearchStation.planterSpeedLevel = 0
	RobotResearchStation.planterSpeedLevel = RobotResearchStation._update_global_values(RobotResearchStation.planterSpeedPrice, RobotResearchStation.planterSpeedLevel)

	assert_int(Global.potatoCount).is_equal(5)
	assert_int(Global.scrapCount).is_equal(5)
	assert_int(RobotResearchStation.planterSpeedLevel).is_equal(1)

	Global.potatoCount = 75
	Global.scrapCount = 75
	RobotResearchStation.planterSpeedLevel = 1
	RobotResearchStation.planterSpeedLevel = RobotResearchStation._update_global_values(RobotResearchStation.planterSpeedPrice, RobotResearchStation.planterSpeedLevel)
	assert_int(Global.potatoCount).is_equal(50)
	assert_int(Global.scrapCount).is_equal(50)
	assert_int(RobotResearchStation.planterSpeedLevel).is_equal(2)
	
	Global.potatoCount = 625
	Global.scrapCount = 625
	RobotResearchStation.planterSpeedLevel = 2
	RobotResearchStation.planterSpeedLevel = RobotResearchStation._update_global_values(RobotResearchStation.planterSpeedPrice, RobotResearchStation.planterSpeedLevel)
	assert_int(Global.potatoCount).is_equal(500)
	assert_int(Global.scrapCount).is_equal(500)
	assert_int(RobotResearchStation.planterSpeedLevel).is_equal(3)
	

func test_update_planter_speed_upkeep():
	var world = world_scene.instantiate()
	var starting_robots = world.get_node("robots")
	RobotShop._buy_robot(RobotShop.planterPrice, RobotShop.planter_scene,RobotShop.planter_ai_scene,starting_robots)
	var robots = world.find_child("robots").get_children()
	var planters = []
	for robot in robots:
		if is_instance_of(robot, planter_robot):
			robot.upkeep = Global.planterUpkeep
			planters.append(robot)

	RobotResearchStation.planterSpeedLevel = 0
	# + 1 upkeep
	Global.planterUpkeep += RobotResearchStation.update_robot_upkeep(planters, RobotResearchStation.planterSpeedUpkeepValues, RobotResearchStation.planterSpeedLevel)	
	assert_int(Global.planterUpkeep).is_equal(2)
	for planter in planters:
		assert_int(planter.upkeep).is_equal(2)
	
	RobotResearchStation.planterSpeedLevel = 1
	# + 3 upkeep
	Global.planterUpkeep += RobotResearchStation.update_robot_upkeep(planters, RobotResearchStation.planterSpeedUpkeepValues, RobotResearchStation.planterSpeedLevel)	
	assert_int(Global.planterUpkeep).is_equal(5)
	for planter in planters:
		assert_int(planter.upkeep).is_equal(5)
		
	RobotResearchStation.planterSpeedLevel = 2
	# + 9 upkeep
	Global.planterUpkeep += RobotResearchStation.update_robot_upkeep(planters, RobotResearchStation.planterSpeedUpkeepValues, RobotResearchStation.planterSpeedLevel)	
	assert_int(Global.planterUpkeep).is_equal(14)
	for planter in planters:
		assert_int(planter.upkeep).is_equal(14)
		
	world.queue_free()
	
	
func test_update_each_planters_speed():
	var world = world_scene.instantiate()
	var starting_robots = world.get_node("robots")
	RobotShop._buy_robot(RobotShop.planterPrice, RobotShop.planter_scene,RobotShop.planter_ai_scene,starting_robots)
	var robots = world.find_child("robots").get_children()
	var planters = []
	for robot in robots:
		if is_instance_of(robot, planter_robot):
			robot.speed = Global.planterSpeed
			planters.append(robot)

	RobotResearchStation.planterSpeedLevel = 0
	# 30 m/s
	Global.planterSpeed = RobotResearchStation.update_robot_speed(planters, RobotResearchStation.planterSpeedImprovementValues, RobotResearchStation.planterSpeedLevel)	
	assert_int(Global.planterSpeed).is_equal(30)
	for planter in planters:
		assert_int(planter.speed).is_equal(30)
	
	RobotResearchStation.planterSpeedLevel = 1
	# + 10 m/s
	Global.planterSpeed = RobotResearchStation.update_robot_speed(planters, RobotResearchStation.planterSpeedImprovementValues, RobotResearchStation.planterSpeedLevel)	
	assert_int(Global.planterSpeed).is_equal(40)
	for planter in planters:
		assert_int(planter.speed).is_equal(40)
		
	RobotResearchStation.planterSpeedLevel = 2
	# + 10 m/s
	Global.planterSpeed = RobotResearchStation.update_robot_speed(planters, RobotResearchStation.planterSpeedImprovementValues, RobotResearchStation.planterSpeedLevel)	
	assert_int(Global.planterSpeed).is_equal(50)
	for planter in planters:
		assert_int(planter.speed).is_equal(50)
		
	RobotResearchStation.planterSpeedLevel = 3
	# + 10 m/s
	Global.planterSpeed = RobotResearchStation.update_robot_speed(planters, RobotResearchStation.planterSpeedImprovementValues, RobotResearchStation.planterSpeedLevel)	
	assert_int(Global.planterSpeed).is_equal(60)
	for planter in planters:
		assert_int(planter.speed).is_equal(60)
		
	world.queue_free()


func test_reset_planter_speed_values():
	Global.reset()
	
	RobotResearchStation.planterSpeedLevel = RobotResearchStation.reset_feature(RobotResearchStation.planterSpeedLevel, RobotResearchStation.planterSpeedButton, RobotResearchStation.planterSpeedResources, RobotResearchStation.planterSpeedUpkeepLabel, RobotResearchStation.planterSpeedLevel1, RobotResearchStation.planterSpeedLevel2, RobotResearchStation.planterSpeedLevel3)
	
	assert_int(RobotResearchStation.planterSpeedLevel).is_equal(0)
	assert_str(RobotResearchStation.planterSpeedButton.text).is_equal("Upgrade")
	assert_bool(RobotResearchStation.planterSpeedButton.disabled).is_false()
	assert_bool(RobotResearchStation.planterSpeedResources.visible).is_true()
	assert_bool(RobotResearchStation.planterSpeedUpkeepLabel.visible).is_true()
#
