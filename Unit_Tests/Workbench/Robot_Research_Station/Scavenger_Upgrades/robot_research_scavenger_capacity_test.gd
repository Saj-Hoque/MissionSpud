# GdUnit generated TestSuite
class_name ResearchScavengerCapacityTest
extends GdUnitTestSuite
@warning_ignore('unused_parameter')
@warning_ignore('return_value_discarded')

var world_scene = preload("res://World/world.tscn")

func test_scavenger_capacity_button_disable_true():
	Global.reset()
	
	Global.potatoCount = 0
	Global.scrapCount = 0
	
	# Price, 10 potato, 10 scrap
	RobotResearchStation.scavengerCapacityLevel = 0
	RobotResearchStation._check_if_enough(RobotResearchStation.scavengerCapacityLevel, RobotResearchStation.scavengerCapacityPrice, RobotResearchStation.scavengerCapacityButton)
	assert_bool(RobotResearchStation.scavengerCapacityButton.disabled).is_true()
	# Price, 160 potato, 160 scrap
	RobotResearchStation.scavengerCapacityLevel = 1
	RobotResearchStation._check_if_enough(RobotResearchStation.scavengerCapacityLevel, RobotResearchStation.scavengerCapacityPrice, RobotResearchStation.scavengerCapacityButton)
	assert_bool(RobotResearchStation.scavengerCapacityButton.disabled).is_true()
	# Price, 750 potato, 750 scrap
	RobotResearchStation.scavengerCapacityLevel = 2
	RobotResearchStation._check_if_enough(RobotResearchStation.scavengerCapacityLevel, RobotResearchStation.scavengerCapacityPrice, RobotResearchStation.scavengerCapacityButton)
	assert_bool(RobotResearchStation.scavengerCapacityButton.disabled).is_true()
	
	
	Global.potatoCount = 10
	Global.scrapCount = 10
	
	# Price, 10 potato, 10 scrap
	RobotResearchStation.scavengerCapacityLevel = 0
	RobotResearchStation._check_if_enough(RobotResearchStation.scavengerCapacityLevel, RobotResearchStation.scavengerCapacityPrice, RobotResearchStation.scavengerCapacityButton)
	assert_bool(RobotResearchStation.scavengerCapacityButton.disabled).is_false()
	# Price, 160 potato, 160 scrap
	RobotResearchStation.scavengerCapacityLevel = 1
	RobotResearchStation._check_if_enough(RobotResearchStation.scavengerCapacityLevel, RobotResearchStation.scavengerCapacityPrice, RobotResearchStation.scavengerCapacityButton)
	assert_bool(RobotResearchStation.scavengerCapacityButton.disabled).is_true()
	# Price, 750 potato, 750 scrap
	RobotResearchStation.scavengerCapacityLevel = 2
	RobotResearchStation._check_if_enough(RobotResearchStation.scavengerCapacityLevel, RobotResearchStation.scavengerCapacityPrice, RobotResearchStation.scavengerCapacityButton)
	assert_bool(RobotResearchStation.scavengerCapacityButton.disabled).is_true()
	
	Global.potatoCount = 160
	Global.scrapCount = 160
	
	# Price, 10 potato, 10 scrap
	RobotResearchStation.scavengerCapacityLevel = 0
	RobotResearchStation._check_if_enough(RobotResearchStation.scavengerCapacityLevel, RobotResearchStation.scavengerCapacityPrice, RobotResearchStation.scavengerCapacityButton)
	assert_bool(RobotResearchStation.scavengerCapacityButton.disabled).is_false()
	# Price, 160 potato, 160 scrap
	RobotResearchStation.scavengerCapacityLevel = 1
	RobotResearchStation._check_if_enough(RobotResearchStation.scavengerCapacityLevel, RobotResearchStation.scavengerCapacityPrice, RobotResearchStation.scavengerCapacityButton)
	assert_bool(RobotResearchStation.scavengerCapacityButton.disabled).is_false()
	# Price, 750 potato, 750 scrap
	RobotResearchStation.scavengerCapacityLevel = 2
	RobotResearchStation._check_if_enough(RobotResearchStation.scavengerCapacityLevel, RobotResearchStation.scavengerCapacityPrice, RobotResearchStation.scavengerCapacityButton)
	assert_bool(RobotResearchStation.scavengerCapacityButton.disabled).is_true()
	

func test_scavenger_capacity_button_disable_false():
	Global.reset()
	
	Global.potatoCount = 750
	Global.scrapCount = 750
	
	# Price, 10 potato, 10 scrap
	RobotResearchStation.scavengerCapacityLevel = 0
	RobotResearchStation._check_if_enough(RobotResearchStation.scavengerCapacityLevel, RobotResearchStation.scavengerCapacityPrice, RobotResearchStation.scavengerCapacityButton)
	assert_bool(RobotResearchStation.scavengerCapacityButton.disabled).is_false()
	
	# Price, 160 potato, 160 scrap
	RobotResearchStation.scavengerCapacityLevel = 1
	RobotResearchStation._check_if_enough(RobotResearchStation.scavengerCapacityLevel, RobotResearchStation.scavengerCapacityPrice, RobotResearchStation.scavengerCapacityButton)
	assert_bool(RobotResearchStation.scavengerCapacityButton.disabled).is_false()
	
	# Price, 750 potato, 750 scrap
	RobotResearchStation.scavengerCapacityLevel = 2
	RobotResearchStation._check_if_enough(RobotResearchStation.scavengerCapacityLevel, RobotResearchStation.scavengerCapacityPrice, RobotResearchStation.scavengerCapacityButton)
	assert_bool(RobotResearchStation.scavengerCapacityButton.disabled).is_false()


func test_update_scavenger_capacity_label_values():
	var world = world_scene.instantiate()
	var levelBox = RobotResearchStation.scavengerCapacityLevel1
	var starting_robots = world.get_node("robots")
	RobotShop._buy_robot(RobotShop.scavengerPrice, RobotShop.scavenger_scene,RobotShop.scavenger_ai_scene,starting_robots)
	var robots = world.find_child("robots").get_children()
	var scavengers = []
	for robot in robots:
		if is_instance_of(robot, scavenger_robot):
			scavengers.append(robot)
	
	# Price, 10 potato, 10 scrap
	Global.upkeep = 0
	Global.robot_upkeep = 0
	RobotResearchStation.scavengerCapacityLevel = 0
	RobotResearchStation._update_to_new_button_values(scavengers, RobotResearchStation.scavengerCapacityLevel, RobotResearchStation.scavengerCapacityUpkeep, RobotResearchStation.scavengerCapacityUpkeepValues, RobotResearchStation.scavengerCapacityUpkeepLabel, RobotResearchStation.scavengerCapacityImprovements, RobotResearchStation.scavengerCapacityImprovementLabel, RobotResearchStation.scavengerCapacityButton, RobotResearchStation.scavengerCapacityResources, levelBox)
	assert_str(RobotResearchStation.scavengerCapacityPotatoPrice.text).is_equal("10")
	assert_str(RobotResearchStation.scavengerCapacityScrapPrice.text).is_equal("10")
	assert_str(RobotResearchStation.scavengerCapacityImprovementLabel.text).is_equal("Increase carrying capacity.    2   ->   4")
	assert_str(RobotResearchStation.scavengerCapacityUpkeepLabel.text).is_equal("Upkeep	    +3")
	assert_str(RobotResearchStation.totalUpkeep.text).is_equal("Upkeep:\n0   ->   6")
	
	## Price, 160 potato, 160 scrap
	Global.upkeep = 0
	Global.robot_upkeep = 0
	RobotResearchStation.scavengerCapacityLevel = 1
	RobotResearchStation._update_to_new_button_values(scavengers, RobotResearchStation.scavengerCapacityLevel, RobotResearchStation.scavengerCapacityUpkeep, RobotResearchStation.scavengerCapacityUpkeepValues, RobotResearchStation.scavengerCapacityUpkeepLabel, RobotResearchStation.scavengerCapacityImprovements, RobotResearchStation.scavengerCapacityImprovementLabel, RobotResearchStation.scavengerCapacityButton, RobotResearchStation.scavengerCapacityResources, levelBox)
	assert_str(RobotResearchStation.scavengerCapacityPotatoPrice.text).is_equal("160")
	assert_str(RobotResearchStation.scavengerCapacityScrapPrice.text).is_equal("160")
	assert_str(RobotResearchStation.scavengerCapacityImprovementLabel.text).is_equal("Increase carrying capacity.    4   ->   8")
	assert_str(RobotResearchStation.scavengerCapacityUpkeepLabel.text).is_equal("Upkeep	    +9")
	assert_str(RobotResearchStation.totalUpkeep.text).is_equal("Upkeep:\n0   ->   18")
	
	# Price, 750 potato, 750 scrap
	Global.upkeep = 0
	Global.robot_upkeep = 0
	RobotResearchStation.scavengerCapacityLevel = 2
	RobotResearchStation._update_to_new_button_values(scavengers, RobotResearchStation.scavengerCapacityLevel, RobotResearchStation.scavengerCapacityUpkeep, RobotResearchStation.scavengerCapacityUpkeepValues, RobotResearchStation.scavengerCapacityUpkeepLabel, RobotResearchStation.scavengerCapacityImprovements, RobotResearchStation.scavengerCapacityImprovementLabel, RobotResearchStation.scavengerCapacityButton, RobotResearchStation.scavengerCapacityResources, levelBox)
	assert_str(RobotResearchStation.scavengerCapacityPotatoPrice.text).is_equal("750")
	assert_str(RobotResearchStation.scavengerCapacityScrapPrice.text).is_equal("750")
	assert_str(RobotResearchStation.scavengerCapacityImprovementLabel.text).is_equal("Increase carrying capacity.    8   ->   16")
	assert_str(RobotResearchStation.scavengerCapacityUpkeepLabel.text).is_equal("Upkeep	    +27")
	assert_str(RobotResearchStation.totalUpkeep.text).is_equal("Upkeep:\n0   ->   54")

	# Maxed out
	Global.upkeep = 0
	Global.robot_upkeep = 0
	RobotResearchStation.scavengerCapacityLevel = 3
	RobotResearchStation._update_to_new_button_values(scavengers, RobotResearchStation.scavengerCapacityLevel, RobotResearchStation.scavengerCapacityUpkeep, RobotResearchStation.scavengerCapacityUpkeepValues, RobotResearchStation.scavengerCapacityUpkeepLabel, RobotResearchStation.scavengerCapacityImprovements, RobotResearchStation.scavengerCapacityImprovementLabel, RobotResearchStation.scavengerCapacityButton, RobotResearchStation.scavengerCapacityResources, levelBox)
	
	assert_bool(RobotResearchStation.totalUpkeep.visible).is_false()
	assert_bool(RobotResearchStation.scavengerCapacityUpkeepLabel.visible).is_false()
	assert_str(RobotResearchStation.scavengerCapacityImprovementLabel.text).is_equal("16")
	assert_str(RobotResearchStation.scavengerCapacityButton.text).is_equal("Maxed out")
	assert_bool(RobotResearchStation.scavengerCapacityButton.disabled).is_true()
	assert_bool(RobotResearchStation.scavengerCapacityResources.visible).is_false()

	world.queue_free()
	


func test_update_global_scavenger_capacity_values():
	Global.reset()
	
	Global.potatoCount = 15
	Global.scrapCount = 15
	RobotResearchStation.scavengerCapacityLevel = 0
	RobotResearchStation.scavengerCapacityLevel = RobotResearchStation._update_global_values(RobotResearchStation.scavengerCapacityPrice, RobotResearchStation.scavengerCapacityLevel)

	assert_int(Global.potatoCount).is_equal(5)
	assert_int(Global.scrapCount).is_equal(5)
	assert_int(RobotResearchStation.scavengerCapacityLevel).is_equal(1)

	Global.potatoCount = 210
	Global.scrapCount = 210
	RobotResearchStation.scavengerCapacityLevel = 1
	RobotResearchStation.scavengerCapacityLevel = RobotResearchStation._update_global_values(RobotResearchStation.scavengerCapacityPrice, RobotResearchStation.scavengerCapacityLevel)
	assert_int(Global.potatoCount).is_equal(50)
	assert_int(Global.scrapCount).is_equal(50)
	assert_int(RobotResearchStation.scavengerCapacityLevel).is_equal(2)
	
	Global.potatoCount = 1250
	Global.scrapCount = 1250
	RobotResearchStation.scavengerCapacityLevel = 2
	RobotResearchStation.scavengerCapacityLevel = RobotResearchStation._update_global_values(RobotResearchStation.scavengerCapacityPrice, RobotResearchStation.scavengerCapacityLevel)
	assert_int(Global.potatoCount).is_equal(500)
	assert_int(Global.scrapCount).is_equal(500)
	assert_int(RobotResearchStation.scavengerCapacityLevel).is_equal(3)
	

func test_update_scavenger_capacity_upkeep():
	var world = world_scene.instantiate()
	var starting_robots = world.get_node("robots")
	RobotShop._buy_robot(RobotShop.scavengerPrice, RobotShop.scavenger_scene,RobotShop.scavenger_ai_scene,starting_robots)
	var robots = world.find_child("robots").get_children()
	var scavengers = []
	for robot in robots:
		if is_instance_of(robot, scavenger_robot):
			robot.upkeep = Global.scavengerUpkeep
			scavengers.append(robot)

	RobotResearchStation.scavengerCapacityLevel = 0
	# + 3 upkeep
	Global.scavengerUpkeep += RobotResearchStation.update_robot_upkeep(scavengers, RobotResearchStation.scavengerCapacityUpkeepValues, RobotResearchStation.scavengerCapacityLevel)	
	assert_int(Global.scavengerUpkeep).is_equal(4)
	for scavenger in scavengers:
		assert_int(scavenger.upkeep).is_equal(4)
	
	RobotResearchStation.scavengerCapacityLevel = 1
	# + 9 upkeep
	Global.scavengerUpkeep += RobotResearchStation.update_robot_upkeep(scavengers, RobotResearchStation.scavengerCapacityUpkeepValues, RobotResearchStation.scavengerCapacityLevel)	
	assert_int(Global.scavengerUpkeep).is_equal(13)
	for scavenger in scavengers:
		assert_int(scavenger.upkeep).is_equal(13)
		
	RobotResearchStation.scavengerCapacityLevel = 2
	# + 27 upkeep
	Global.scavengerUpkeep += RobotResearchStation.update_robot_upkeep(scavengers, RobotResearchStation.scavengerCapacityUpkeepValues, RobotResearchStation.scavengerCapacityLevel)	
	assert_int(Global.scavengerUpkeep).is_equal(40)
	for scavenger in scavengers:
		assert_int(scavenger.upkeep).is_equal(40)
		
	world.queue_free()
	
	
func test_update_each_scavengers_capacity():
	var world = world_scene.instantiate()
	var starting_robots = world.get_node("robots")
	RobotShop._buy_robot(RobotShop.scavengerPrice, RobotShop.scavenger_scene,RobotShop.scavenger_ai_scene,starting_robots)
	var robots = world.find_child("robots").get_children()
	var scavengers = []
	for robot in robots:
		if is_instance_of(robot, scavenger_robot):
			robot.capacity = Global.scavengerCapacity
			scavengers.append(robot)

	RobotResearchStation.scavengerCapacityLevel = 0
	# 2
	Global.scavengerCapacity = RobotResearchStation.update_robot_capacity(scavengers, RobotResearchStation.scavengerCapacityImprovementValues, RobotResearchStation.scavengerCapacityLevel)	
	assert_int(Global.scavengerCapacity).is_equal(2)
	for scavenger in scavengers:
		assert_int(scavenger.capacity).is_equal(2)
		
	RobotResearchStation.scavengerCapacityLevel = 1
	# + 2
	Global.scavengerCapacity = RobotResearchStation.update_robot_capacity(scavengers, RobotResearchStation.scavengerCapacityImprovementValues, RobotResearchStation.scavengerCapacityLevel)	
	assert_int(Global.scavengerCapacity).is_equal(4)
	for scavenger in scavengers:
		assert_int(scavenger.capacity).is_equal(4)
		
	RobotResearchStation.scavengerCapacityLevel = 2
	# + 4
	Global.scavengerCapacity = RobotResearchStation.update_robot_capacity(scavengers, RobotResearchStation.scavengerCapacityImprovementValues, RobotResearchStation.scavengerCapacityLevel)	
	assert_int(Global.scavengerCapacity).is_equal(8)
	for scavenger in scavengers:
		assert_int(scavenger.capacity).is_equal(8)
		
	RobotResearchStation.scavengerCapacityLevel = 3
	# + 8
	Global.scavengerCapacity = RobotResearchStation.update_robot_capacity(scavengers, RobotResearchStation.scavengerCapacityImprovementValues, RobotResearchStation.scavengerCapacityLevel)	
	assert_int(Global.scavengerCapacity).is_equal(16)
	for scavenger in scavengers:
		assert_int(scavenger.capacity).is_equal(16)
	
	world.queue_free()


func test_reset_scavenger_capacity_values():
	Global.reset()
	
	RobotResearchStation.scavengerCapacityLevel = RobotResearchStation.reset_feature(RobotResearchStation.scavengerCapacityLevel, RobotResearchStation.scavengerCapacityButton, RobotResearchStation.scavengerCapacityResources, RobotResearchStation.scavengerCapacityUpkeepLabel, RobotResearchStation.scavengerCapacityLevel1, RobotResearchStation.scavengerCapacityLevel2, RobotResearchStation.scavengerCapacityLevel3)
	
	assert_int(RobotResearchStation.scavengerCapacityLevel).is_equal(0)
	assert_str(RobotResearchStation.scavengerCapacityButton.text).is_equal("Upgrade")
	assert_bool(RobotResearchStation.scavengerCapacityButton.disabled).is_false()
	assert_bool(RobotResearchStation.scavengerCapacityResources.visible).is_true()
	assert_bool(RobotResearchStation.scavengerCapacityUpkeepLabel.visible).is_true()
#
