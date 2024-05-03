# GdUnit generated TestSuite
class_name ResearchPlanterProductivityTest
extends GdUnitTestSuite
@warning_ignore('unused_parameter')
@warning_ignore('return_value_discarded')

var world_scene = preload("res://World/world.tscn")

func test_planter_productivity_button_disable_true():
	Global.reset()
	
	Global.potatoCount = 0
	Global.scrapCount = 0
	
	# Price, 10 potato, 10 scrap
	RobotResearchStation.planterProductivityLevel = 0
	RobotResearchStation._check_if_enough(RobotResearchStation.planterProductivityLevel, RobotResearchStation.planterProductivityPrice, RobotResearchStation.planterProductivityButton)
	assert_bool(RobotResearchStation.planterProductivityButton.disabled).is_true()
	# Price, 100 potato, 100 scrap
	RobotResearchStation.planterProductivityLevel = 1
	RobotResearchStation._check_if_enough(RobotResearchStation.planterProductivityLevel, RobotResearchStation.planterProductivityPrice, RobotResearchStation.planterProductivityButton)
	assert_bool(RobotResearchStation.planterProductivityButton.disabled).is_true()
	# Price, 500 potato, 500 scrap
	RobotResearchStation.planterProductivityLevel = 2
	RobotResearchStation._check_if_enough(RobotResearchStation.planterProductivityLevel, RobotResearchStation.planterProductivityPrice, RobotResearchStation.planterProductivityButton)
	assert_bool(RobotResearchStation.planterProductivityButton.disabled).is_true()
	
	
	Global.potatoCount = 10
	Global.scrapCount = 10
	
	# Price, 10 potato, 10 scrap
	RobotResearchStation.planterProductivityLevel = 0
	RobotResearchStation._check_if_enough(RobotResearchStation.planterProductivityLevel, RobotResearchStation.planterProductivityPrice, RobotResearchStation.planterProductivityButton)
	assert_bool(RobotResearchStation.planterProductivityButton.disabled).is_false()
	# Price, 100 potato, 100 scrap
	RobotResearchStation.planterProductivityLevel = 1
	RobotResearchStation._check_if_enough(RobotResearchStation.planterProductivityLevel, RobotResearchStation.planterProductivityPrice, RobotResearchStation.planterProductivityButton)
	assert_bool(RobotResearchStation.planterProductivityButton.disabled).is_true()
	# Price, 500 potato, 500 scrap
	RobotResearchStation.planterProductivityLevel = 2
	RobotResearchStation._check_if_enough(RobotResearchStation.planterProductivityLevel, RobotResearchStation.planterProductivityPrice, RobotResearchStation.planterProductivityButton)
	assert_bool(RobotResearchStation.planterProductivityButton.disabled).is_true()
	
	Global.potatoCount = 100
	Global.scrapCount = 100
	
	# Price, 10 potato, 10 scrap
	RobotResearchStation.planterProductivityLevel = 0
	RobotResearchStation._check_if_enough(RobotResearchStation.planterProductivityLevel, RobotResearchStation.planterProductivityPrice, RobotResearchStation.planterProductivityButton)
	assert_bool(RobotResearchStation.planterProductivityButton.disabled).is_false()
	# Price, 100 potato, 100 scrap
	RobotResearchStation.planterProductivityLevel = 1
	RobotResearchStation._check_if_enough(RobotResearchStation.planterProductivityLevel, RobotResearchStation.planterProductivityPrice, RobotResearchStation.planterProductivityButton)
	assert_bool(RobotResearchStation.planterProductivityButton.disabled).is_false()
	# Price, 500 potato, 500 scrap
	RobotResearchStation.planterProductivityLevel = 2
	RobotResearchStation._check_if_enough(RobotResearchStation.planterProductivityLevel, RobotResearchStation.planterProductivityPrice, RobotResearchStation.planterProductivityButton)
	assert_bool(RobotResearchStation.planterProductivityButton.disabled).is_true()
	

func test_planter_productivity_button_disable_false():
	Global.reset()
	
	Global.potatoCount = 500
	Global.scrapCount = 500
	
	# Price, 10 potato, 10 scrap
	RobotResearchStation.planterProductivityLevel = 0
	RobotResearchStation._check_if_enough(RobotResearchStation.planterProductivityLevel, RobotResearchStation.planterProductivityPrice, RobotResearchStation.planterProductivityButton)
	assert_bool(RobotResearchStation.planterProductivityButton.disabled).is_false()
	
	# Price, 100 potato, 100 scrap
	RobotResearchStation.planterProductivityLevel = 1
	RobotResearchStation._check_if_enough(RobotResearchStation.planterProductivityLevel, RobotResearchStation.planterProductivityPrice, RobotResearchStation.planterProductivityButton)
	assert_bool(RobotResearchStation.planterProductivityButton.disabled).is_false()
	
	# Price, 500 potato, 500 scrap
	RobotResearchStation.planterProductivityLevel = 2
	RobotResearchStation._check_if_enough(RobotResearchStation.planterProductivityLevel, RobotResearchStation.planterProductivityPrice, RobotResearchStation.planterProductivityButton)
	assert_bool(RobotResearchStation.planterProductivityButton.disabled).is_false()


func test_update_planter_productivity_label_values():
	var world = world_scene.instantiate()
	var levelBox = RobotResearchStation.planterProductivityLevel1
	var starting_robots = world.get_node("robots")
	RobotShop._buy_robot(RobotShop.planterPrice, RobotShop.planter_scene,RobotShop.planter_ai_scene,starting_robots)
	var robots = world.find_child("robots").get_children()
	var planters = []
	for robot in robots:
		if is_instance_of(robot, planter_robot):
			planters.append(robot)
	
	# Price, 10 potato, 10 scrap
	Global.upkeep = 0
	Global.robot_upkeep = 0
	RobotResearchStation.planterProductivityLevel = 0
	RobotResearchStation._update_to_new_button_values(planters, RobotResearchStation.planterProductivityLevel, RobotResearchStation.planterProductivityUpkeep, RobotResearchStation.planterProductivityUpkeepValues, RobotResearchStation.planterProductivityUpkeepLabel, RobotResearchStation.planterProductivityImprovements, RobotResearchStation.planterProductivityImprovementLabel, RobotResearchStation.planterProductivityButton, RobotResearchStation.planterProductivityResources, levelBox)
	assert_str(RobotResearchStation.planterProductivityPotatoPrice.text).is_equal("10")
	assert_str(RobotResearchStation.planterProductivityScrapPrice.text).is_equal("10")
	assert_str(RobotResearchStation.planterProductivityImprovementLabel.text).is_equal("Reduce potato planting time.    5   ->   2.5 s")
	assert_str(RobotResearchStation.planterProductivityUpkeepLabel.text).is_equal("Upkeep	    +3")
	assert_str(RobotResearchStation.totalUpkeep.text).is_equal("Upkeep:\n0   ->   6")
	
	## Price, 100 potato, 100 scrap
	Global.upkeep = 0
	Global.robot_upkeep = 0
	RobotResearchStation.planterProductivityLevel = 1
	RobotResearchStation._update_to_new_button_values(planters, RobotResearchStation.planterProductivityLevel, RobotResearchStation.planterProductivityUpkeep, RobotResearchStation.planterProductivityUpkeepValues, RobotResearchStation.planterProductivityUpkeepLabel, RobotResearchStation.planterProductivityImprovements, RobotResearchStation.planterProductivityImprovementLabel, RobotResearchStation.planterProductivityButton, RobotResearchStation.planterProductivityResources, levelBox)
	assert_str(RobotResearchStation.planterProductivityPotatoPrice.text).is_equal("100")
	assert_str(RobotResearchStation.planterProductivityScrapPrice.text).is_equal("100")
	assert_str(RobotResearchStation.planterProductivityImprovementLabel.text).is_equal("Reduce potato planting time.    2.5   ->   1.25 s")
	assert_str(RobotResearchStation.planterProductivityUpkeepLabel.text).is_equal("Upkeep	    +9")
	assert_str(RobotResearchStation.totalUpkeep.text).is_equal("Upkeep:\n0   ->   18")
	
	# Price, 500 potato, 500 scrap
	Global.upkeep = 0
	Global.robot_upkeep = 0
	RobotResearchStation.planterProductivityLevel = 2
	RobotResearchStation._update_to_new_button_values(planters, RobotResearchStation.planterProductivityLevel, RobotResearchStation.planterProductivityUpkeep, RobotResearchStation.planterProductivityUpkeepValues, RobotResearchStation.planterProductivityUpkeepLabel, RobotResearchStation.planterProductivityImprovements, RobotResearchStation.planterProductivityImprovementLabel, RobotResearchStation.planterProductivityButton, RobotResearchStation.planterProductivityResources, levelBox)
	assert_str(RobotResearchStation.planterProductivityPotatoPrice.text).is_equal("500")
	assert_str(RobotResearchStation.planterProductivityScrapPrice.text).is_equal("500")
	assert_str(RobotResearchStation.planterProductivityImprovementLabel.text).is_equal("Reduce potato planting time.    1.25   ->   0.625 s")
	assert_str(RobotResearchStation.planterProductivityUpkeepLabel.text).is_equal("Upkeep	    +27")
	assert_str(RobotResearchStation.totalUpkeep.text).is_equal("Upkeep:\n0   ->   54")

	# Maxed out
	Global.upkeep = 0
	Global.robot_upkeep = 0
	RobotResearchStation.planterProductivityLevel = 3
	RobotResearchStation._update_to_new_button_values(planters, RobotResearchStation.planterProductivityLevel, RobotResearchStation.planterProductivityUpkeep, RobotResearchStation.planterProductivityUpkeepValues, RobotResearchStation.planterProductivityUpkeepLabel, RobotResearchStation.planterProductivityImprovements, RobotResearchStation.planterProductivityImprovementLabel, RobotResearchStation.planterProductivityButton, RobotResearchStation.planterProductivityResources, levelBox)
	
	assert_bool(RobotResearchStation.totalUpkeep.visible).is_false()
	assert_bool(RobotResearchStation.planterProductivityUpkeepLabel.visible).is_false()
	assert_str(RobotResearchStation.planterProductivityImprovementLabel.text).is_equal("0.625 s")
	assert_str(RobotResearchStation.planterProductivityButton.text).is_equal("Maxed out")
	assert_bool(RobotResearchStation.planterProductivityButton.disabled).is_true()
	assert_bool(RobotResearchStation.planterProductivityResources.visible).is_false()

	world.queue_free()

func test_update_global_planter_productivity_values():
	Global.reset()
	
	Global.potatoCount = 15
	Global.scrapCount = 15
	RobotResearchStation.planterProductivityLevel = 0
	RobotResearchStation.planterProductivityLevel = RobotResearchStation._update_global_values(RobotResearchStation.planterProductivityPrice, RobotResearchStation.planterProductivityLevel)

	assert_int(Global.potatoCount).is_equal(5)
	assert_int(Global.scrapCount).is_equal(5)
	assert_int(RobotResearchStation.planterProductivityLevel).is_equal(1)

	Global.potatoCount = 150
	Global.scrapCount = 150
	RobotResearchStation.planterProductivityLevel = 1
	RobotResearchStation.planterProductivityLevel = RobotResearchStation._update_global_values(RobotResearchStation.planterProductivityPrice, RobotResearchStation.planterProductivityLevel)
	assert_int(Global.potatoCount).is_equal(50)
	assert_int(Global.scrapCount).is_equal(50)
	assert_int(RobotResearchStation.planterProductivityLevel).is_equal(2)
	
	Global.potatoCount = 1000
	Global.scrapCount = 1000
	RobotResearchStation.planterProductivityLevel = 2
	RobotResearchStation.planterProductivityLevel = RobotResearchStation._update_global_values(RobotResearchStation.planterProductivityPrice, RobotResearchStation.planterProductivityLevel)
	assert_int(Global.potatoCount).is_equal(500)
	assert_int(Global.scrapCount).is_equal(500)
	assert_int(RobotResearchStation.planterProductivityLevel).is_equal(3)
	

func test_update_planter_productivity_upkeep():
	var world = world_scene.instantiate()
	var starting_robots = world.get_node("robots")
	RobotShop._buy_robot(RobotShop.planterPrice, RobotShop.planter_scene,RobotShop.planter_ai_scene,starting_robots)
	var robots = world.find_child("robots").get_children()
	var planters = []
	for robot in robots:
		if is_instance_of(robot, planter_robot):
			robot.upkeep = Global.planterUpkeep
			planters.append(robot)

	RobotResearchStation.planterProductivityLevel = 0
	# + 3 upkeep
	Global.planterUpkeep += RobotResearchStation.update_robot_upkeep(planters, RobotResearchStation.planterProductivityUpkeepValues, RobotResearchStation.planterProductivityLevel)	
	assert_int(Global.planterUpkeep).is_equal(4)
	for planter in planters:
		assert_int(planter.upkeep).is_equal(4)
	
	RobotResearchStation.planterProductivityLevel = 1
	# + 9 upkeep
	Global.planterUpkeep += RobotResearchStation.update_robot_upkeep(planters, RobotResearchStation.planterProductivityUpkeepValues, RobotResearchStation.planterProductivityLevel)	
	assert_int(Global.planterUpkeep).is_equal(13)
	for planter in planters:
		assert_int(planter.upkeep).is_equal(13)
		
	RobotResearchStation.planterProductivityLevel = 2
	# + 27 upkeep
	Global.planterUpkeep += RobotResearchStation.update_robot_upkeep(planters, RobotResearchStation.planterProductivityUpkeepValues, RobotResearchStation.planterProductivityLevel)	
	assert_int(Global.planterUpkeep).is_equal(40)
	for planter in planters:
		assert_int(planter.upkeep).is_equal(40)
		
	world.queue_free()
	
	
func test_update_each_planters_productivity():
	var world = world_scene.instantiate()
	var starting_robots = world.get_node("robots")
	RobotShop._buy_robot(RobotShop.planterPrice, RobotShop.planter_scene,RobotShop.planter_ai_scene,starting_robots)
	var robots = world.find_child("robots").get_children()
	var planters = []
	for robot in robots:
		if is_instance_of(robot, planter_robot):
			robot.productivity = Global.planterProductivity
			planters.append(robot)

	RobotResearchStation.planterProductivityLevel = 0
	# 5s
	Global.planterProductivity = RobotResearchStation.update_robot_productivity(RobotResearchStation.planterProductivityImprovementValues, RobotResearchStation.planterProductivityLevel)	
	assert_int(Global.planterProductivity).is_equal(5)
	
	RobotResearchStation.planterProductivityLevel = 1
	# - 2.5s
	Global.planterProductivity = RobotResearchStation.update_robot_productivity(RobotResearchStation.planterProductivityImprovementValues, RobotResearchStation.planterProductivityLevel)	
	assert_float(Global.planterProductivity).is_equal(2.5)
		
	RobotResearchStation.planterProductivityLevel = 2
	# - 1.25s
	Global.planterProductivity = RobotResearchStation.update_robot_productivity(RobotResearchStation.planterProductivityImprovementValues, RobotResearchStation.planterProductivityLevel)	
	assert_float(Global.planterProductivity).is_equal(1.25)

	RobotResearchStation.planterProductivityLevel = 3
	# - 0.625s
	Global.planterProductivity = RobotResearchStation.update_robot_productivity(RobotResearchStation.planterProductivityImprovementValues, RobotResearchStation.planterProductivityLevel)	
	assert_float(Global.planterProductivity).is_equal(0.625)

	world.queue_free()


func test_reset_planter_productivity_values():
	Global.reset()
	
	RobotResearchStation.planterProductivityLevel = RobotResearchStation.reset_feature(RobotResearchStation.planterProductivityLevel, RobotResearchStation.planterProductivityButton, RobotResearchStation.planterProductivityResources, RobotResearchStation.planterProductivityUpkeepLabel, RobotResearchStation.planterProductivityLevel1, RobotResearchStation.planterProductivityLevel2, RobotResearchStation.planterProductivityLevel3)
	
	assert_int(RobotResearchStation.planterProductivityLevel).is_equal(0)
	assert_str(RobotResearchStation.planterProductivityButton.text).is_equal("Upgrade")
	assert_bool(RobotResearchStation.planterProductivityButton.disabled).is_false()
	assert_bool(RobotResearchStation.planterProductivityResources.visible).is_true()
	assert_bool(RobotResearchStation.planterProductivityUpkeepLabel.visible).is_true()
#
