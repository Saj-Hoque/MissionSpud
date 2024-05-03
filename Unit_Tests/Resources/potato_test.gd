# GdUnit generated TestSuite
class_name PotatoTest
extends GdUnitTestSuite
@warning_ignore('unused_parameter')
@warning_ignore('return_value_discarded')

var world_scene = preload("res://World/world.tscn")
var potato_scene = preload("res://Resources/potato.tscn")

func test_potato_collected_by_player():
	var world = world_scene.instantiate()
	Global.potatoCount = 0
	Global.potatoValue = 1
	
	var potato = potato_scene.instantiate()
	potato.collect_by_player(world)
	var count = Global.potatoCount
	# potatoCount should be 1
	
	world.queue_free()
	potato.queue_free()
	
	assert_int(count).is_equal(1)

func test_potato_collected_by_valid_robot():
	var world = world_scene.instantiate()
	Global.potatoCount = 0
	Global.potatoValue = 1
	
	var collector = null
	var starting_robots = world.get_node("robots")
	RobotShop._buy_robot(RobotShop.collectorPrice, RobotShop.collector_scene,RobotShop.collector_ai_scene, starting_robots)
	var robots = world.find_child("robots").get_children()
	for robot in robots:
		if is_instance_of(robot, collector_robot):
			collector = robot
	var carrying = 0
	var potato = potato_scene.instantiate()
	if collector != null:
		potato.collect_by_robot(collector)
		carrying = collector.carrying
		# Robot carrying value should now be 1
	
	world.queue_free()
	potato.queue_free()
	
	assert_int(carrying).is_equal(1)
	
func test_potato_collected_by_invalid_robot():
	var world = world_scene.instantiate()
	Global.potatoCount = 0
	Global.potatoValue = 1
	
	var scavenger = null
	var robots = world.find_child("robots").get_children()
	for robot in robots:
		if is_instance_of(robot, scavenger_robot):
			scavenger = robot
	var carrying = 0
	var potato = potato_scene.instantiate()
	if scavenger != null:
		potato.collect_by_robot(scavenger)
		carrying = scavenger.carrying
		# Robot carrying value should not be 1 - scavengers cant gather potato
	
	world.queue_free()
	potato.queue_free()
	
	assert_int(carrying).is_not_equal(1)

