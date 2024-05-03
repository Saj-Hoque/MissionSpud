# GdUnit generated TestSuite
class_name ScrapTest
extends GdUnitTestSuite
@warning_ignore('unused_parameter')
@warning_ignore('return_value_discarded')

var world_scene = preload("res://World/world.tscn")
var scrap_scene = preload("res://Resources/scrap.tscn")

func test_scrap_collected_by_player():
	var world = world_scene.instantiate()
	Global.scrapCount = 0
	Global.scrapValue = 1
	
	var scrap = scrap_scene.instantiate()
	scrap.collect_by_player(world)
	var count = Global.scrapCount
	# scrapCount should be 1
	
	world.queue_free()
	scrap.queue_free()
	
	assert_int(count).is_equal(1)

func test_scrap_collected_by_valid_robot():
	var world = world_scene.instantiate()
	Global.scrapCount = 0
	Global.scrapValue = 1
	
	var scavenger = null
	var robots = world.find_child("robots").get_children()
	for robot in robots:
		if is_instance_of(robot, scavenger_robot):
			scavenger = robot
	var carrying = 0
	var scrap = scrap_scene.instantiate()
	if scavenger != null:
		scrap.collect_by_robot(scavenger)
		carrying = scavenger.carrying
		# Robot carrying value should now be 1
	
	world.queue_free()
	scrap.queue_free()
	
	assert_int(carrying).is_equal(1)
	
func test_scrap_collected_by_invalid_robot():
	var world = world_scene.instantiate()
	Global.scrapCount = 0
	Global.scrapValue = 1
	
	var collector = null
	var starting_robots = world.get_node("robots")
	RobotShop._buy_robot(RobotShop.collectorPrice, RobotShop.collector_scene,RobotShop.collector_ai_scene, starting_robots)
	var robots = world.find_child("robots").get_children()
	for robot in robots:
		if is_instance_of(robot, collector_robot):
			collector = robot
	var carrying = 0
	var scrap = scrap_scene.instantiate()
	if collector != null:
		scrap.collect_by_robot(collector)
		carrying = collector.carrying
		# Robot carrying value should not be 1 - collectors cant gather scrap
	
	world.queue_free()
	scrap.queue_free()
	
	assert_int(carrying).is_not_equal(1)
