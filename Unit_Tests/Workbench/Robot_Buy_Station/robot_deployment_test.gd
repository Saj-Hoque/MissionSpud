# GdUnit generated TestSuite
class_name RobotDeploymentTest
extends GdUnitTestSuite
@warning_ignore('unused_parameter')
@warning_ignore('return_value_discarded')

var world_scene = preload("res://World/world.tscn")

func test_buy_planter():
	
	var world = world_scene.instantiate()
	# Starts with 3 robots, 1 planter, 1 harvester, 1 scavenger, 0 collectors
	var starting_robots = world.get_node("robots")
	
	RobotShop._buy_robot(RobotShop.planterPrice, RobotShop.planter_scene,RobotShop.planter_ai_scene,starting_robots)
	
	var robots = world.find_child("robots").get_children()
	var planters = 0
	var harvesters = 0
	var scavengers = 0
	var collectors = 0
	for robot in robots:
		if is_instance_of(robot, planter_robot):
			planters += 1
		if is_instance_of(robot, harvester_robot):
			harvesters += 1
		if is_instance_of(robot, scavenger_robot):
			scavengers += 1
		if is_instance_of(robot, collector_robot):
			collectors += 1
	# Should end with 4 robots, 2 planters, 1 harvester, 1 scavenger, 0 collectors
	
	world.queue_free()
	
	assert_int(len(robots)).is_equal(4)
	assert_int(planters).is_equal(2)
	assert_int(harvesters).is_equal(1)
	assert_int(scavengers).is_equal(1)
	assert_int(collectors).is_equal(0)


func test_buy_harvester():
	
	var world = world_scene.instantiate()
	# Starts with 3 robots, 1 planter, 1 harvester, 1 scavenger, 0 collectors
	var starting_robots = world.get_node("robots")
	
	RobotShop._buy_robot(RobotShop.harvesterPrice, RobotShop.harvester_scene,RobotShop.harvester_ai_scene,starting_robots)
	
	var robots = world.find_child("robots").get_children()
	var planters = 0
	var harvesters = 0
	var scavengers = 0
	var collectors = 0
	for robot in robots:
		if is_instance_of(robot, planter_robot):
			planters += 1
		if is_instance_of(robot, harvester_robot):
			harvesters += 1
		if is_instance_of(robot, scavenger_robot):
			scavengers += 1
		if is_instance_of(robot, collector_robot):
			collectors += 1
	# Should end with 4 robots, 1 planter, 2 harvesters, 1 scavenger, 0 collectors
	
	world.queue_free()
	
	assert_int(len(robots)).is_equal(4)
	assert_int(planters).is_equal(1)
	assert_int(harvesters).is_equal(2)
	assert_int(scavengers).is_equal(1)
	assert_int(collectors).is_equal(0)


func test_buy_scavenger():
	
	var world = world_scene.instantiate()
	# Starts with 3 robots, 1 planter, 1 harvester, 1 scavenger, 0 collectors
	var starting_robots = world.get_node("robots")
	
	RobotShop._buy_robot(RobotShop.scavengerPrice, RobotShop.scavenger_scene,RobotShop.scavenger_ai_scene,starting_robots)
	
	var robots = world.find_child("robots").get_children()
	var planters = 0
	var harvesters = 0
	var scavengers = 0
	var collectors = 0
	for robot in robots:
		if is_instance_of(robot, planter_robot):
			planters += 1
		if is_instance_of(robot, harvester_robot):
			harvesters += 1
		if is_instance_of(robot, scavenger_robot):
			scavengers += 1
		if is_instance_of(robot, collector_robot):
			collectors += 1
	# Should end with 4 robots, 1 planter, 1 harvester, 2 scavengers, 0 collectors
	
	world.queue_free()
	
	assert_int(len(robots)).is_equal(4)
	assert_int(planters).is_equal(1)
	assert_int(harvesters).is_equal(1)
	assert_int(scavengers).is_equal(2)
	assert_int(collectors).is_equal(0)


func test_buy_collector():
	
	var world = world_scene.instantiate()
	# Starts with 3 robots, 1 planter, 1 harvester, 1 scavenger, 0 collectors
	var starting_robots = world.get_node("robots")
	
	RobotShop._buy_robot(RobotShop.collectorPrice, RobotShop.collector_scene,RobotShop.collector_ai_scene,starting_robots)
	
	var robots = world.find_child("robots").get_children()
	var planters = 0
	var harvesters = 0
	var scavengers = 0
	var collectors = 0
	for robot in robots:
		if is_instance_of(robot, planter_robot):
			planters += 1
		if is_instance_of(robot, harvester_robot):
			harvesters += 1
		if is_instance_of(robot, scavenger_robot):
			scavengers += 1
		if is_instance_of(robot, collector_robot):
			collectors += 1
	# Should end with 4 robots, 1 planter, 1 harvester, 1 scavenger, 1 collector
	
	world.queue_free()
	
	assert_int(len(robots)).is_equal(4)
	assert_int(planters).is_equal(1)
	assert_int(harvesters).is_equal(1)
	assert_int(scavengers).is_equal(1)
	assert_int(collectors).is_equal(1)
