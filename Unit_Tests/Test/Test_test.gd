# GdUnit generated TestSuite
class_name TestingTest
extends GdUnitTestSuite
@warning_ignore('unused_parameter')
@warning_ignore('return_value_discarded')

func test_testtrue():
	assert_bool(true).is_true()

func test_testfalse():
	assert_bool(false).is_false()
