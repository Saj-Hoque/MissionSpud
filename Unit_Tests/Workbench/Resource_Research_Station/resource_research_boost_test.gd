# GdUnit generated TestSuite
class_name ResearchBoostTest
extends GdUnitTestSuite
@warning_ignore('unused_parameter')
@warning_ignore('return_value_discarded')

func test_boost_button_disable_true():
	Global.reset()
	
	Global.potatoCount = 0
	Global.scrapCount = 0
	
	# Price, 25 potato, 25 scrap
	ResourceResearchStation.boostLevel = 0
	ResourceResearchStation._check_if_enough(ResourceResearchStation.boostLevel, ResourceResearchStation.boostPrice, ResourceResearchStation.boostButton)
	assert_bool(ResourceResearchStation.boostButton.disabled).is_true()
	# Price, 175 potato, 175 scrap
	ResourceResearchStation.boostLevel = 1
	ResourceResearchStation._check_if_enough(ResourceResearchStation.boostLevel, ResourceResearchStation.boostPrice, ResourceResearchStation.boostButton)
	assert_bool(ResourceResearchStation.boostButton.disabled).is_true()
	# Price, 1225 potato, 1225 scrap
	ResourceResearchStation.boostLevel = 2
	ResourceResearchStation._check_if_enough(ResourceResearchStation.boostLevel, ResourceResearchStation.boostPrice, ResourceResearchStation.boostButton)
	assert_bool(ResourceResearchStation.boostButton.disabled).is_true()
	
	
	Global.potatoCount = 25
	Global.scrapCount = 25
	
	# Price, 25 potato, 25 scrap
	ResourceResearchStation.boostLevel = 0
	ResourceResearchStation._check_if_enough(ResourceResearchStation.boostLevel, ResourceResearchStation.boostPrice, ResourceResearchStation.boostButton)
	assert_bool(ResourceResearchStation.boostButton.disabled).is_false()
	# Price, 175 potato, 175 scrap
	ResourceResearchStation.boostLevel = 1
	ResourceResearchStation._check_if_enough(ResourceResearchStation.boostLevel, ResourceResearchStation.boostPrice, ResourceResearchStation.boostButton)
	assert_bool(ResourceResearchStation.boostButton.disabled).is_true()
	# Price, 1225 potato, 1225 scrap
	ResourceResearchStation.boostLevel = 2
	ResourceResearchStation._check_if_enough(ResourceResearchStation.boostLevel, ResourceResearchStation.boostPrice, ResourceResearchStation.boostButton)
	assert_bool(ResourceResearchStation.boostButton.disabled).is_true()
	
	Global.potatoCount = 175
	Global.scrapCount = 175
	
	# Price, 25 potato, 25 scrap
	ResourceResearchStation.boostLevel = 0
	ResourceResearchStation._check_if_enough(ResourceResearchStation.boostLevel, ResourceResearchStation.boostPrice, ResourceResearchStation.boostButton)
	assert_bool(ResourceResearchStation.boostButton.disabled).is_false()
	# Price, 175 potato, 175 scrap
	ResourceResearchStation.boostLevel = 1
	ResourceResearchStation._check_if_enough(ResourceResearchStation.boostLevel, ResourceResearchStation.boostPrice, ResourceResearchStation.boostButton)
	assert_bool(ResourceResearchStation.boostButton.disabled).is_false()
	# Price, 1225 potato, 1225 scrap
	ResourceResearchStation.boostLevel = 2
	ResourceResearchStation._check_if_enough(ResourceResearchStation.boostLevel, ResourceResearchStation.boostPrice, ResourceResearchStation.boostButton)
	assert_bool(ResourceResearchStation.boostButton.disabled).is_true()
	
	
	
func test_boost_button_disable_false():
	Global.reset()
	
	Global.potatoCount = 1225
	Global.scrapCount = 1225
	
	# Price, 25 potato, 25 scrap
	ResourceResearchStation.boostLevel = 0
	ResourceResearchStation._check_if_enough(ResourceResearchStation.boostLevel, ResourceResearchStation.boostPrice, ResourceResearchStation.boostButton)
	assert_bool(ResourceResearchStation.boostButton.disabled).is_false()
	
	# Price, 175 potato, 175 scrap
	ResourceResearchStation.boostLevel = 1
	ResourceResearchStation._check_if_enough(ResourceResearchStation.boostLevel, ResourceResearchStation.boostPrice, ResourceResearchStation.boostButton)
	assert_bool(ResourceResearchStation.boostButton.disabled).is_false()
	
	# Price, 1225 potato, 1225 scrap
	ResourceResearchStation.boostLevel = 2
	ResourceResearchStation._check_if_enough(ResourceResearchStation.boostLevel, ResourceResearchStation.boostPrice, ResourceResearchStation.boostButton)
	assert_bool(ResourceResearchStation.boostButton.disabled).is_false()

func test_update_boost_label_values():
	Global.reset()
	
	# Price, 25 potato, 25 scrap
	Global.upkeep = 0
	Global.robot_upkeep = 0
	ResourceResearchStation.boostLevel = 0
	ResourceResearchStation._update_to_new_button_values(ResourceResearchStation.boostLevel, ResourceResearchStation.boostUpkeep, ResourceResearchStation.boostUpkeepValues, ResourceResearchStation.boostUpkeepLabel, ResourceResearchStation.boostImprovements, ResourceResearchStation.boostImprovementLabel, ResourceResearchStation.boostCurrentUpkeep, ResourceResearchStation.boostCurrentUpkeepLabel, ResourceResearchStation.boostButton, ResourceResearchStation.boostResources)
	assert_str(ResourceResearchStation.boostPotatoPrice.text).is_equal("25")
	assert_str(ResourceResearchStation.boostScrapPrice.text).is_equal("25")
	assert_str(ResourceResearchStation.boostImprovementLabel.text).is_equal("x 1   ->   x 2")
	assert_str(ResourceResearchStation.boostUpkeepLabel.text).is_equal("Upkeep	    +6")
	assert_str(ResourceResearchStation.boostCurrentUpkeepLabel.text).is_equal("+0")
	assert_str(ResourceResearchStation.totalUpkeep.text).is_equal("Upkeep:\n0   ->   6")

	# Price, 175 potato, 175 scrap
	Global.upkeep = 0
	Global.robot_upkeep = 0
	ResourceResearchStation.boostLevel = 1
	ResourceResearchStation._update_to_new_button_values(ResourceResearchStation.boostLevel, ResourceResearchStation.boostUpkeep, ResourceResearchStation.boostUpkeepValues, ResourceResearchStation.boostUpkeepLabel, ResourceResearchStation.boostImprovements, ResourceResearchStation.boostImprovementLabel, ResourceResearchStation.boostCurrentUpkeep, ResourceResearchStation.boostCurrentUpkeepLabel, ResourceResearchStation.boostButton, ResourceResearchStation.boostResources)
	assert_str(ResourceResearchStation.boostPotatoPrice.text).is_equal("175")
	assert_str(ResourceResearchStation.boostScrapPrice.text).is_equal("175")
	assert_str(ResourceResearchStation.boostImprovementLabel.text).is_equal("x 2   ->   x 4")
	assert_str(ResourceResearchStation.boostUpkeepLabel.text).is_equal("Upkeep	    +60")
	assert_str(ResourceResearchStation.boostCurrentUpkeepLabel.text).is_equal("+6")
	assert_str(ResourceResearchStation.totalUpkeep.text).is_equal("Upkeep:\n0   ->   60")
	
	# Price, 1225 potato, 1225 scrap
	Global.upkeep = 0
	Global.robot_upkeep = 0
	ResourceResearchStation.boostLevel = 2
	ResourceResearchStation._update_to_new_button_values(ResourceResearchStation.boostLevel, ResourceResearchStation.boostUpkeep, ResourceResearchStation.boostUpkeepValues, ResourceResearchStation.boostUpkeepLabel, ResourceResearchStation.boostImprovements, ResourceResearchStation.boostImprovementLabel, ResourceResearchStation.boostCurrentUpkeep, ResourceResearchStation.boostCurrentUpkeepLabel, ResourceResearchStation.boostButton, ResourceResearchStation.boostResources)
	assert_str(ResourceResearchStation.boostPotatoPrice.text).is_equal("1225")
	assert_str(ResourceResearchStation.boostScrapPrice.text).is_equal("1225")
	assert_str(ResourceResearchStation.boostImprovementLabel.text).is_equal("x 4   ->   x 8")
	assert_str(ResourceResearchStation.boostUpkeepLabel.text).is_equal("Upkeep	    +600")
	assert_str(ResourceResearchStation.boostCurrentUpkeepLabel.text).is_equal("+66")
	assert_str(ResourceResearchStation.totalUpkeep.text).is_equal("Upkeep:\n0   ->   600")

	# Maxed out
	Global.upkeep = 0
	Global.robot_upkeep = 0
	ResourceResearchStation.boostLevel = 3
	ResourceResearchStation._update_to_new_button_values(ResourceResearchStation.boostLevel, ResourceResearchStation.boostUpkeep, ResourceResearchStation.boostUpkeepValues, ResourceResearchStation.boostUpkeepLabel, ResourceResearchStation.boostImprovements, ResourceResearchStation.boostImprovementLabel, ResourceResearchStation.boostCurrentUpkeep, ResourceResearchStation.boostCurrentUpkeepLabel, ResourceResearchStation.boostButton, ResourceResearchStation.boostResources)
	assert_bool(ResourceResearchStation.totalUpkeep.visible).is_false()
	assert_bool(ResourceResearchStation.boostUpkeepLabel.visible).is_false()
	assert_str(ResourceResearchStation.boostCurrentUpkeepLabel.text).is_equal("+666")
	assert_str(ResourceResearchStation.boostImprovementLabel.text).is_equal("x 8")
	assert_str(ResourceResearchStation.boostButton.text).is_equal("Maxed out")
	assert_bool(ResourceResearchStation.boostButton.disabled).is_true()
	assert_bool(ResourceResearchStation.boostResources.visible).is_false()


func test_update_global_boost_values():
	Global.reset()
	
	Global.robot_upkeep = 0
	
	Global.upkeep = 0
	Global.potatoCount = 30
	Global.scrapCount = 30
	ResourceResearchStation.boostLevel = 0
	ResourceResearchStation._update_global_values(ResourceResearchStation.boostPrice, ResourceResearchStation.boostLevel, ResourceResearchStation.boostUpkeepValues, ResourceResearchStation.boostImprovementValues)
	assert_int(Global.potatoCount).is_equal(5)
	assert_int(Global.scrapCount).is_equal(5)
	assert_int(Global.upkeep).is_equal(6)

	Global.upkeep = 0
	Global.potatoCount = 225
	Global.scrapCount = 225
	ResourceResearchStation.boostLevel = 1
	ResourceResearchStation._update_global_values(ResourceResearchStation.boostPrice, ResourceResearchStation.boostLevel, ResourceResearchStation.boostUpkeepValues, ResourceResearchStation.boostImprovementValues)
	assert_int(Global.potatoCount).is_equal(50)
	assert_int(Global.scrapCount).is_equal(50)
	assert_int(Global.upkeep).is_equal(60)
	
	Global.upkeep = 0
	Global.potatoCount = 1725
	Global.scrapCount = 1725
	ResourceResearchStation.boostLevel = 2
	ResourceResearchStation._update_global_values(ResourceResearchStation.boostPrice, ResourceResearchStation.boostLevel, ResourceResearchStation.boostUpkeepValues, ResourceResearchStation.boostImprovementValues)
	assert_int(Global.potatoCount).is_equal(500)
	assert_int(Global.scrapCount).is_equal(500)
	assert_int(Global.upkeep).is_equal(600)
	
	
func test_boost_button_pressed():
	Global.reset()
	Global.upkeep = 0
	Global.robot_upkeep = 0
	Global.scrapQuantity = 1
	
	ResourceResearchStation.boostLevel = 0
	ResourceResearchStation._on_boost_button_pressed()
	assert_int(ResourceResearchStation.boostLevel).is_equal(1)
	assert_int(Global.scrapQuantity).is_equal(2)
	
	ResourceResearchStation.boostLevel = 1
	ResourceResearchStation._on_boost_button_pressed()
	assert_int(ResourceResearchStation.boostLevel).is_equal(2)
	assert_int(Global.scrapQuantity).is_equal(4)
	
	ResourceResearchStation.boostLevel = 2
	ResourceResearchStation._on_boost_button_pressed()
	assert_int(ResourceResearchStation.boostLevel).is_equal(3)
	assert_int(Global.scrapQuantity).is_equal(8)


func test_reset_boost_values():
	Global.reset()
	
	ResourceResearchStation.boostLevel = ResourceResearchStation.reset_feature(ResourceResearchStation.boostLevel, ResourceResearchStation.boostButton, ResourceResearchStation.boostResources, ResourceResearchStation.boostUpkeepLabel)
	
	assert_int(ResourceResearchStation.boostLevel).is_equal(0)
	assert_str(ResourceResearchStation.boostButton.text).is_equal("Research")
	assert_bool(ResourceResearchStation.boostButton.disabled).is_false()
	assert_bool(ResourceResearchStation.boostResources.visible).is_true()
	assert_bool(ResourceResearchStation.boostUpkeepLabel.visible).is_true()

