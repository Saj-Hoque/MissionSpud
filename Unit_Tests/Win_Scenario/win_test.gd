# GdUnit generated TestSuite
class_name WinTest
extends GdUnitTestSuite
@warning_ignore('unused_parameter')
@warning_ignore('return_value_discarded')
var rocket_pad_scene = preload("res://World_Objects/rocket_pad.tscn")

func test_win_true():
	var rocket_pad = rocket_pad_scene.instantiate()
	Global.reset()
	Global.potatoCount = 40000
	Global.scrapCount = 40000
	
	var win = rocket_pad.can_buy()
	# Enough resources - which will lead to a win scenario - return true
	
	Global.reset()
	rocket_pad.queue_free()
	
	assert_bool(win).is_true()

func test_win_true_border():
	var rocket_pad = rocket_pad_scene.instantiate()
	Global.reset()
	Global.potatoCount = 25000
	Global.scrapCount = 25000
	
	var win = rocket_pad.can_buy()
	# Enough resources - which will lead to a win scenario - return true
	
	Global.reset()
	rocket_pad.queue_free()
	
	assert_bool(win).is_true()
	
func test_win_false():
	var rocket_pad = rocket_pad_scene.instantiate()
	Global.reset()
	Global.potatoCount = 0
	Global.scrapCount = 0
	
	var win = rocket_pad.can_buy()
	# Not enough resources - which will not lead to a win scenario - return false
	
	Global.reset()
	rocket_pad.queue_free()
	
	assert_bool(win).is_false()
	
func test_win_false_border():
	var rocket_pad = rocket_pad_scene.instantiate()
	Global.reset()
	Global.potatoCount = 24999
	Global.scrapCount = 24999
	
	var win = rocket_pad.can_buy()
	# Not enough resources - which will not lead to a win scenario - return false
	
	Global.reset()
	rocket_pad.queue_free()
	
	assert_bool(win).is_false()
	
func test_win_false_insufficient_potatoes():
	var rocket_pad = rocket_pad_scene.instantiate()
	Global.reset()
	Global.potatoCount = 24999
	Global.scrapCount = 25000
	
	var win = rocket_pad.can_buy()
	# Not enough potatoes - which will not lead to a win scenario - return false
	
	Global.reset()
	rocket_pad.queue_free()
	
	assert_bool(win).is_false()
	
func test_win_false_insufficient_scrap():
	var rocket_pad = rocket_pad_scene.instantiate()
	Global.reset()
	Global.potatoCount = 25000
	Global.scrapCount = 24999
	
	var win = rocket_pad.can_buy()
	# Not enough scrap - which will not lead to a win scenario - return false
	
	Global.reset()
	rocket_pad.queue_free()
	
	assert_bool(win).is_false()
