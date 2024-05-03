# GdUnit generated TestSuite
class_name ResearchHarvesterProductivityTest
extends GdUnitTestSuite
@warning_ignore('unused_parameter')
@warning_ignore('return_value_discarded')

var world_scene = preload("res://World/world.tscn")

func test_harvester_productivity_button_disable_true():
	Global.reset()
	
	Global.potatoCount = 0
	Global.scrapCount = 0
	
	# Price, 10 potato, 10 scrap
	RobotResearchStation.harvesterProductivityLevel = 0
	RobotResearchStation._check_if_enough(RobotResearchStation.harvesterProductivityLevel, RobotResearchStation.harvesterProductivityPrice, RobotResearchStation.harvesterProductivityButton)
	assert_bool(RobotResearchStation.harvesterProductivityButton.disabled).is_true()
	# Price, 160 potato, 160 scrap
	RobotResearchStation.harvesterProductivityLevel = 1
	RobotResearchStation._check_if_enough(RobotResearchStation.harvesterProductivityLevel, RobotResearchStation.harvesterProductivityPrice, RobotResearchStation.harvesterProductivityButton)
	assert_bool(RobotResearchStation.harvesterProductivityButton.disabled).is_true()
	# Price, 700 potato, 700 scrap
	RobotResearchStation.harvesterProductivityLevel = 2
	RobotResearchStation._check_if_enough(RobotResearchStation.harvesterProductivityLevel, RobotResearchStation.harvesterProductivityPrice, RobotResearchStation.harvesterProductivityButton)
	assert_bool(RobotResearchStation.harvesterProductivityButton.disabled).is_true()
	
	
	Global.potatoCount = 10
	Global.scrapCount = 10
	
	# Price, 10 potato, 10 scrap
	RobotResearchStation.harvesterProductivityLevel = 0
	RobotResearchStation._check_if_enough(RobotResearchStation.harvesterProductivityLevel, RobotResearchStation.harvesterProductivityPrice, RobotResearchStation.harvesterProductivityButton)
	assert_bool(RobotResearchStation.harvesterProductivityButton.disabled).is_false()
	# Price, 160 potato, 160 scrap
	RobotResearchStation.harvesterProductivityLevel = 1
	RobotResearchStation._check_if_enough(RobotResearchStation.harvesterProductivityLevel, RobotResearchStation.harvesterProductivityPrice, RobotResearchStation.harvesterProductivityButton)
	assert_bool(RobotResearchStation.harvesterProductivityButton.disabled).is_true()
	# Price, 700 potato, 700 scrap
	RobotResearchStation.harvesterProductivityLevel = 2
	RobotResearchStation._check_if_enough(RobotResearchStation.harvesterProductivityLevel, RobotResearchStation.harvesterProductivityPrice, RobotResearchStation.harvesterProductivityButton)
	assert_bool(RobotResearchStation.harvesterProductivityButton.disabled).is_true()
	
	Global.potatoCount = 160
	Global.scrapCount = 160
	
	# Price, 10 potato, 10 scrap
	RobotResearchStation.harvesterProductivityLevel = 0
	RobotResearchStation._check_if_enough(RobotResearchStation.harvesterProductivityLevel, RobotResearchStation.harvesterProductivityPrice, RobotResearchStation.harvesterProductivityButton)
	assert_bool(RobotResearchStation.harvesterProductivityButton.disabled).is_false()
	# Price, 160 potato, 160 scrap
	RobotResearchStation.harvesterProductivityLevel = 1
	RobotResearchStation._check_if_enough(RobotResearchStation.harvesterProductivityLevel, RobotResearchStation.harvesterProductivityPrice, RobotResearchStation.harvesterProductivityButton)
	assert_bool(RobotResearchStation.harvesterProductivityButton.disabled).is_false()
	# Price, 700 potato, 700 scrap
	RobotResearchStation.harvesterProductivityLevel = 2
	RobotResearchStation._check_if_enough(RobotResearchStation.harvesterProductivityLevel, RobotResearchStation.harvesterProductivityPrice, RobotResearchStation.harvesterProductivityButton)
	assert_bool(RobotResearchStation.harvesterProductivityButton.disabled).is_true()
	

func test_harvester_productivity_button_disable_false():
	Global.reset()
	
	Global.potatoCount = 700
	Global.scrapCount = 700
	
	# Price, 10 potato, 10 scrap
	RobotResearchStation.harvesterProductivityLevel = 0
	RobotResearchStation._check_if_enough(RobotResearchStation.harvesterProductivityLevel, RobotResearchStation.harvesterProductivityPrice, RobotResearchStation.harvesterProductivityButton)
	assert_bool(RobotResearchStation.harvesterProductivityButton.disabled).is_false()
	
	# Price, 160 potato, 160 scrap
	RobotResearchStation.harvesterProductivityLevel = 1
	RobotResearchStation._check_if_enough(RobotResearchStation.harvesterProductivityLevel, RobotResearchStation.harvesterProductivityPrice, RobotResearchStation.harvesterProductivityButton)
	assert_bool(RobotResearchStation.harvesterProductivityButton.disabled).is_false()
	
	# Price, 700 potato, 700 scrap
	RobotResearchStation.harvesterProductivityLevel = 2
	RobotResearchStation._check_if_enough(RobotResearchStation.harvesterProductivityLevel, RobotResearchStation.harvesterProductivityPrice, RobotResearchStation.harvesterProductivityButton)
	assert_bool(RobotResearchStation.harvesterProductivityButton.disabled).is_false()

func test_update_harvester_productivity_label_values():
	var world = world_scene.instantiate()
	var levelBox = RobotResearchStation.harvesterProductivityLevel1
	var starting_robots = world.get_node("robots")
	RobotShop._buy_robot(RobotShop.harvesterPrice, RobotShop.harvester_scene,RobotShop.harvester_ai_scene,starting_robots)
	var robots = world.find_child("robots").get_children()
	var harvesters = []
	for robot in robots:
		if is_instance_of(robot, harvester_robot):
			harvesters.append(robot)
	
	# Price, 10 potato, 10 scrap
	Global.upkeep = 0
	Global.robot_upkeep = 0
	RobotResearchStation.harvesterProductivityLevel = 0
	RobotResearchStation._update_to_new_button_values(harvesters, RobotResearchStation.harvesterProductivityLevel, RobotResearchStation.harvesterProductivityUpkeep, RobotResearchStation.harvesterProductivityUpkeepValues, RobotResearchStation.harvesterProductivityUpkeepLabel, RobotResearchStation.harvesterProductivityImprovements, RobotResearchStation.harvesterProductivityImprovementLabel, RobotResearchStation.harvesterProductivityButton, RobotResearchStation.harvesterProductivityResources, levelBox)
	assert_str(RobotResearchStation.harvesterProductivityPotatoPrice.text).is_equal("10")
	assert_str(RobotResearchStation.harvesterProductivityScrapPrice.text).is_equal("10")
	assert_str(RobotResearchStation.harvesterProductivityImprovementLabel.text).is_equal("Reduce potato harvesting time.    2.5   ->   1.25 s")
	assert_str(RobotResearchStation.harvesterProductivityUpkeepLabel.text).is_equal("Upkeep	    +3")
	assert_str(RobotResearchStation.totalUpkeep.text).is_equal("Upkeep:\n0   ->   6")
	
	## Price, 160 potato, 160 scrap
	Global.upkeep = 0
	Global.robot_upkeep = 0
	RobotResearchStation.harvesterProductivityLevel = 1
	RobotResearchStation._update_to_new_button_values(harvesters, RobotResearchStation.harvesterProductivityLevel, RobotResearchStation.harvesterProductivityUpkeep, RobotResearchStation.harvesterProductivityUpkeepValues, RobotResearchStation.harvesterProductivityUpkeepLabel, RobotResearchStation.harvesterProductivityImprovements, RobotResearchStation.harvesterProductivityImprovementLabel, RobotResearchStation.harvesterProductivityButton, RobotResearchStation.harvesterProductivityResources, levelBox)
	assert_str(RobotResearchStation.harvesterProductivityPotatoPrice.text).is_equal("160")
	assert_str(RobotResearchStation.harvesterProductivityScrapPrice.text).is_equal("160")
	assert_str(RobotResearchStation.harvesterProductivityImprovementLabel.text).is_equal("Reduce potato harvesting time.    1.25   ->   0.625 s")
	assert_str(RobotResearchStation.harvesterProductivityUpkeepLabel.text).is_equal("Upkeep	    +9")
	assert_str(RobotResearchStation.totalUpkeep.text).is_equal("Upkeep:\n0   ->   18")
	
	# Price, 700 potato, 700 scrap
	Global.upkeep = 0
	Global.robot_upkeep = 0
	RobotResearchStation.harvesterProductivityLevel = 2
	RobotResearchStation._update_to_new_button_values(harvesters, RobotResearchStation.harvesterProductivityLevel, RobotResearchStation.harvesterProductivityUpkeep, RobotResearchStation.harvesterProductivityUpkeepValues, RobotResearchStation.harvesterProductivityUpkeepLabel, RobotResearchStation.harvesterProductivityImprovements, RobotResearchStation.harvesterProductivityImprovementLabel, RobotResearchStation.harvesterProductivityButton, RobotResearchStation.harvesterProductivityResources, levelBox)
	assert_str(RobotResearchStation.harvesterProductivityPotatoPrice.text).is_equal("700")
	assert_str(RobotResearchStation.harvesterProductivityScrapPrice.text).is_equal("700")
	assert_str(RobotResearchStation.harvesterProductivityImprovementLabel.text).is_equal("Reduce potato harvesting time.    0.625   ->   0.3125 s")
	assert_str(RobotResearchStation.harvesterProductivityUpkeepLabel.text).is_equal("Upkeep	    +27")
	assert_str(RobotResearchStation.totalUpkeep.text).is_equal("Upkeep:\n0   ->   54")

	# Maxed out
	Global.upkeep = 0
	Global.robot_upkeep = 0
	RobotResearchStation.harvesterProductivityLevel = 3
	RobotResearchStation._update_to_new_button_values(harvesters, RobotResearchStation.harvesterProductivityLevel, RobotResearchStation.harvesterProductivityUpkeep, RobotResearchStation.harvesterProductivityUpkeepValues, RobotResearchStation.harvesterProductivityUpkeepLabel, RobotResearchStation.harvesterProductivityImprovements, RobotResearchStation.harvesterProductivityImprovementLabel, RobotResearchStation.harvesterProductivityButton, RobotResearchStation.harvesterProductivityResources, levelBox)
	
	assert_bool(RobotResearchStation.totalUpkeep.visible).is_false()
	assert_bool(RobotResearchStation.harvesterProductivityUpkeepLabel.visible).is_false()
	assert_str(RobotResearchStation.harvesterProductivityImprovementLabel.text).is_equal("0.3125 s")
	assert_str(RobotResearchStation.harvesterProductivityButton.text).is_equal("Maxed out")
	assert_bool(RobotResearchStation.harvesterProductivityButton.disabled).is_true()
	assert_bool(RobotResearchStation.harvesterProductivityResources.visible).is_false()

	world.queue_free()


func test_update_global_harvester_productivity_values():
	Global.reset()
	
	Global.potatoCount = 15
	Global.scrapCount = 15
	RobotResearchStation.harvesterProductivityLevel = 0
	RobotResearchStation.harvesterProductivityLevel = RobotResearchStation._update_global_values(RobotResearchStation.harvesterProductivityPrice, RobotResearchStation.harvesterProductivityLevel)

	assert_int(Global.potatoCount).is_equal(5)
	assert_int(Global.scrapCount).is_equal(5)
	assert_int(RobotResearchStation.harvesterProductivityLevel).is_equal(1)

	Global.potatoCount = 210
	Global.scrapCount = 210
	RobotResearchStation.harvesterProductivityLevel = 1
	RobotResearchStation.harvesterProductivityLevel = RobotResearchStation._update_global_values(RobotResearchStation.harvesterProductivityPrice, RobotResearchStation.harvesterProductivityLevel)
	assert_int(Global.potatoCount).is_equal(50)
	assert_int(Global.scrapCount).is_equal(50)
	assert_int(RobotResearchStation.harvesterProductivityLevel).is_equal(2)
	
	Global.potatoCount = 1200
	Global.scrapCount = 1200
	RobotResearchStation.harvesterProductivityLevel = 2
	RobotResearchStation.harvesterProductivityLevel = RobotResearchStation._update_global_values(RobotResearchStation.harvesterProductivityPrice, RobotResearchStation.harvesterProductivityLevel)
	assert_int(Global.potatoCount).is_equal(500)
	assert_int(Global.scrapCount).is_equal(500)
	assert_int(RobotResearchStation.harvesterProductivityLevel).is_equal(3)
	

func test_update_harvester_productivity_upkeep():
	var world = world_scene.instantiate()
	var starting_robots = world.get_node("robots")
	RobotShop._buy_robot(RobotShop.harvesterPrice, RobotShop.harvester_scene,RobotShop.harvester_ai_scene,starting_robots)
	var robots = world.find_child("robots").get_children()
	var harvesters = []
	for robot in robots:
		if is_instance_of(robot, harvester_robot):
			robot.upkeep = Global.harvesterUpkeep
			harvesters.append(robot)

	RobotResearchStation.harvesterProductivityLevel = 0
	# + 3 upkeep
	Global.harvesterUpkeep += RobotResearchStation.update_robot_upkeep(harvesters, RobotResearchStation.harvesterProductivityUpkeepValues, RobotResearchStation.harvesterProductivityLevel)	
	assert_int(Global.harvesterUpkeep).is_equal(4)
	for harvester in harvesters:
		assert_int(harvester.upkeep).is_equal(4)
	
	RobotResearchStation.harvesterProductivityLevel = 1
	# + 9 upkeep
	Global.harvesterUpkeep += RobotResearchStation.update_robot_upkeep(harvesters, RobotResearchStation.harvesterProductivityUpkeepValues, RobotResearchStation.harvesterProductivityLevel)	
	assert_int(Global.harvesterUpkeep).is_equal(13)
	for harvester in harvesters:
		assert_int(harvester.upkeep).is_equal(13)
		
	RobotResearchStation.harvesterProductivityLevel = 2
	# + 27 upkeep
	Global.harvesterUpkeep += RobotResearchStation.update_robot_upkeep(harvesters, RobotResearchStation.harvesterProductivityUpkeepValues, RobotResearchStation.harvesterProductivityLevel)	
	assert_int(Global.harvesterUpkeep).is_equal(40)
	for harvester in harvesters:
		assert_int(harvester.upkeep).is_equal(40)
		
	world.queue_free()
	
	
func test_update_each_harvesters_productivity():
	var world = world_scene.instantiate()
	var starting_robots = world.get_node("robots")
	RobotShop._buy_robot(RobotShop.harvesterPrice, RobotShop.harvester_scene,RobotShop.harvester_ai_scene,starting_robots)
	var robots = world.find_child("robots").get_children()
	var harvesters = []
	for robot in robots:
		if is_instance_of(robot, harvester_robot):
			robot.productivity = Global.harvesterProductivity
			harvesters.append(robot)

	RobotResearchStation.harvesterProductivityLevel = 0
	# 2.5s
	Global.harvesterProductivity = RobotResearchStation.update_robot_productivity(RobotResearchStation.harvesterProductivityImprovementValues, RobotResearchStation.harvesterProductivityLevel)	
	assert_float(Global.harvesterProductivity).is_equal(2.5)
	
	RobotResearchStation.harvesterProductivityLevel = 1
	# - 1.25s
	Global.harvesterProductivity = RobotResearchStation.update_robot_productivity(RobotResearchStation.harvesterProductivityImprovementValues, RobotResearchStation.harvesterProductivityLevel)	
	assert_float(Global.harvesterProductivity).is_equal(1.25)
		
	RobotResearchStation.harvesterProductivityLevel = 2
	# - 0.625s
	Global.harvesterProductivity = RobotResearchStation.update_robot_productivity(RobotResearchStation.harvesterProductivityImprovementValues, RobotResearchStation.harvesterProductivityLevel)	
	assert_float(Global.harvesterProductivity).is_equal(0.625)

	RobotResearchStation.harvesterProductivityLevel = 3
	# - 0.3125s
	Global.harvesterProductivity = RobotResearchStation.update_robot_productivity(RobotResearchStation.harvesterProductivityImprovementValues, RobotResearchStation.harvesterProductivityLevel)	
	assert_float(Global.harvesterProductivity).is_equal(0.3125)

	world.queue_free()


func test_reset_harvester_productivity_values():
	Global.reset()
	
	RobotResearchStation.harvesterProductivityLevel = RobotResearchStation.reset_feature(RobotResearchStation.harvesterProductivityLevel, RobotResearchStation.harvesterProductivityButton, RobotResearchStation.harvesterProductivityResources, RobotResearchStation.harvesterProductivityUpkeepLabel, RobotResearchStation.harvesterProductivityLevel1, RobotResearchStation.harvesterProductivityLevel2, RobotResearchStation.harvesterProductivityLevel3)
	
	assert_int(RobotResearchStation.harvesterProductivityLevel).is_equal(0)
	assert_str(RobotResearchStation.harvesterProductivityButton.text).is_equal("Upgrade")
	assert_bool(RobotResearchStation.harvesterProductivityButton.disabled).is_false()
	assert_bool(RobotResearchStation.harvesterProductivityResources.visible).is_true()
	assert_bool(RobotResearchStation.harvesterProductivityUpkeepLabel.visible).is_true()
#
