# GdUnit generated TestSuite
class_name WorldTest
extends GdUnitTestSuite
@warning_ignore('unused_parameter')
@warning_ignore('return_value_discarded')

# TestSuite generated from
const __source = 'res://World/world.gd'


func test_testing() -> void:
	var world = load("res://World/world.gd")
	assert_bool(true).is_true()
