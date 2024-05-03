# GdUnit generated TestSuite
class_name ResearchTurbineTest
extends GdUnitTestSuite
@warning_ignore('unused_parameter')
@warning_ignore('return_value_discarded')

func test_turbine_button_disable_true():
	Global.reset()
	
	Global.potatoCount = 0
	Global.scrapCount = 0
	
	# Price, 20 potato, 20 scrap
	ResourceResearchStation.turbineLevel = 0
	ResourceResearchStation._check_if_enough(ResourceResearchStation.turbineLevel, ResourceResearchStation.turbinePrice, ResourceResearchStation.turbineButton)
	assert_bool(ResourceResearchStation.turbineButton.disabled).is_true()
	# Price, 140 potato, 140 scrap
	ResourceResearchStation.turbineLevel = 1
	ResourceResearchStation._check_if_enough(ResourceResearchStation.turbineLevel, ResourceResearchStation.turbinePrice, ResourceResearchStation.turbineButton)
	assert_bool(ResourceResearchStation.turbineButton.disabled).is_true()
	# Price, 1600 potato, 1600 scrap
	ResourceResearchStation.turbineLevel = 2
	ResourceResearchStation._check_if_enough(ResourceResearchStation.turbineLevel, ResourceResearchStation.turbinePrice, ResourceResearchStation.turbineButton)
	assert_bool(ResourceResearchStation.turbineButton.disabled).is_true()
	
	
	Global.potatoCount = 20
	Global.scrapCount = 20
	
	# Price, 20 potato, 20 scrap
	ResourceResearchStation.turbineLevel = 0
	ResourceResearchStation._check_if_enough(ResourceResearchStation.turbineLevel, ResourceResearchStation.turbinePrice, ResourceResearchStation.turbineButton)
	assert_bool(ResourceResearchStation.turbineButton.disabled).is_false()
	# Price, 140 potato, 140 scrap
	ResourceResearchStation.turbineLevel = 1
	ResourceResearchStation._check_if_enough(ResourceResearchStation.turbineLevel, ResourceResearchStation.turbinePrice, ResourceResearchStation.turbineButton)
	assert_bool(ResourceResearchStation.turbineButton.disabled).is_true()
	# Price, 1600 potato, 1600 scrap
	ResourceResearchStation.turbineLevel = 2
	ResourceResearchStation._check_if_enough(ResourceResearchStation.turbineLevel, ResourceResearchStation.turbinePrice, ResourceResearchStation.turbineButton)
	assert_bool(ResourceResearchStation.turbineButton.disabled).is_true()
	
	Global.potatoCount = 140
	Global.scrapCount = 140
	
	# Price, 20 potato, 20 scrap
	ResourceResearchStation.turbineLevel = 0
	ResourceResearchStation._check_if_enough(ResourceResearchStation.turbineLevel, ResourceResearchStation.turbinePrice, ResourceResearchStation.turbineButton)
	assert_bool(ResourceResearchStation.turbineButton.disabled).is_false()
	# Price, 140 potato, 140 scrap
	ResourceResearchStation.turbineLevel = 1
	ResourceResearchStation._check_if_enough(ResourceResearchStation.turbineLevel, ResourceResearchStation.turbinePrice, ResourceResearchStation.turbineButton)
	assert_bool(ResourceResearchStation.turbineButton.disabled).is_false()
	# Price, 1600 potato, 1600 scrap
	ResourceResearchStation.turbineLevel = 2
	ResourceResearchStation._check_if_enough(ResourceResearchStation.turbineLevel, ResourceResearchStation.turbinePrice, ResourceResearchStation.turbineButton)
	assert_bool(ResourceResearchStation.turbineButton.disabled).is_true()
	
	
	
func test_turbine_button_disable_false():
	Global.reset()
	
	Global.potatoCount = 1600
	Global.scrapCount = 1600
	
	# Price, 20 potato, 20 scrap
	ResourceResearchStation.turbineLevel = 0
	ResourceResearchStation._check_if_enough(ResourceResearchStation.turbineLevel, ResourceResearchStation.turbinePrice, ResourceResearchStation.turbineButton)
	assert_bool(ResourceResearchStation.turbineButton.disabled).is_false()
	
	# Price, 140 potato, 140 scrap
	ResourceResearchStation.turbineLevel = 1
	ResourceResearchStation._check_if_enough(ResourceResearchStation.turbineLevel, ResourceResearchStation.turbinePrice, ResourceResearchStation.turbineButton)
	assert_bool(ResourceResearchStation.turbineButton.disabled).is_false()
	
	# Price, 1600 potato, 1600 scrap
	ResourceResearchStation.turbineLevel = 2
	ResourceResearchStation._check_if_enough(ResourceResearchStation.turbineLevel, ResourceResearchStation.turbinePrice, ResourceResearchStation.turbineButton)
	assert_bool(ResourceResearchStation.turbineButton.disabled).is_false()

func test_update_turbine_label_values():
	Global.reset()
	
	# Price, 20 potato, 20 scrap
	Global.upkeep = 0
	Global.robot_upkeep = 0
	ResourceResearchStation.turbineLevel = 0
	ResourceResearchStation._update_to_new_button_values(ResourceResearchStation.turbineLevel, ResourceResearchStation.turbineUpkeep, ResourceResearchStation.turbineUpkeepValues, ResourceResearchStation.turbineUpkeepLabel, ResourceResearchStation.turbineImprovements, ResourceResearchStation.turbineImprovementLabel, ResourceResearchStation.turbineCurrentUpkeep, ResourceResearchStation.turbineCurrentUpkeepLabel, ResourceResearchStation.turbineButton, ResourceResearchStation.turbineResources)
	assert_str(ResourceResearchStation.turbinePotatoPrice.text).is_equal("20")
	assert_str(ResourceResearchStation.turbineScrapPrice.text).is_equal("20")
	assert_str(ResourceResearchStation.turbineImprovementLabel.text).is_equal("6s   ->   3s")
	assert_str(ResourceResearchStation.turbineUpkeepLabel.text).is_equal("Upkeep	    +5")
	assert_str(ResourceResearchStation.turbineCurrentUpkeepLabel.text).is_equal("+0")
	assert_str(ResourceResearchStation.totalUpkeep.text).is_equal("Upkeep:\n0   ->   5")

	# Price, 140 potato, 140 scrap
	Global.upkeep = 0
	Global.robot_upkeep = 0
	ResourceResearchStation.turbineLevel = 1
	ResourceResearchStation._update_to_new_button_values(ResourceResearchStation.turbineLevel, ResourceResearchStation.turbineUpkeep, ResourceResearchStation.turbineUpkeepValues, ResourceResearchStation.turbineUpkeepLabel, ResourceResearchStation.turbineImprovements, ResourceResearchStation.turbineImprovementLabel, ResourceResearchStation.turbineCurrentUpkeep, ResourceResearchStation.turbineCurrentUpkeepLabel, ResourceResearchStation.turbineButton, ResourceResearchStation.turbineResources)
	assert_str(ResourceResearchStation.turbinePotatoPrice.text).is_equal("140")
	assert_str(ResourceResearchStation.turbineScrapPrice.text).is_equal("140")
	assert_str(ResourceResearchStation.turbineImprovementLabel.text).is_equal("3s   ->   2s")
	assert_str(ResourceResearchStation.turbineUpkeepLabel.text).is_equal("Upkeep	    +25")
	print(ResourceResearchStation.turbineCurrentUpkeepLabel.text)
	assert_str(ResourceResearchStation.turbineCurrentUpkeepLabel.text).is_equal("+5")
	assert_str(ResourceResearchStation.totalUpkeep.text).is_equal("Upkeep:\n0   ->   25")
	
	# Price, 1600 potato, 1600 scrap
	Global.upkeep = 0
	Global.robot_upkeep = 0
	ResourceResearchStation.turbineLevel = 2
	ResourceResearchStation._update_to_new_button_values(ResourceResearchStation.turbineLevel, ResourceResearchStation.turbineUpkeep, ResourceResearchStation.turbineUpkeepValues, ResourceResearchStation.turbineUpkeepLabel, ResourceResearchStation.turbineImprovements, ResourceResearchStation.turbineImprovementLabel, ResourceResearchStation.turbineCurrentUpkeep, ResourceResearchStation.turbineCurrentUpkeepLabel, ResourceResearchStation.turbineButton, ResourceResearchStation.turbineResources)
	assert_str(ResourceResearchStation.turbinePotatoPrice.text).is_equal("1600")
	assert_str(ResourceResearchStation.turbineScrapPrice.text).is_equal("1600")
	assert_str(ResourceResearchStation.turbineImprovementLabel.text).is_equal("2s   ->   1s")
	assert_str(ResourceResearchStation.turbineUpkeepLabel.text).is_equal("Upkeep	    +250")
	assert_str(ResourceResearchStation.turbineCurrentUpkeepLabel.text).is_equal("+30")
	assert_str(ResourceResearchStation.totalUpkeep.text).is_equal("Upkeep:\n0   ->   250")

	# Maxed out
	Global.upkeep = 0
	Global.robot_upkeep = 0
	ResourceResearchStation.turbineLevel = 3
	ResourceResearchStation._update_to_new_button_values(ResourceResearchStation.turbineLevel, ResourceResearchStation.turbineUpkeep, ResourceResearchStation.turbineUpkeepValues, ResourceResearchStation.turbineUpkeepLabel, ResourceResearchStation.turbineImprovements, ResourceResearchStation.turbineImprovementLabel, ResourceResearchStation.turbineCurrentUpkeep, ResourceResearchStation.turbineCurrentUpkeepLabel, ResourceResearchStation.turbineButton, ResourceResearchStation.turbineResources)
	assert_bool(ResourceResearchStation.totalUpkeep.visible).is_false()
	assert_bool(ResourceResearchStation.turbineUpkeepLabel.visible).is_false()
	assert_str(ResourceResearchStation.turbineCurrentUpkeepLabel.text).is_equal("+280")
	assert_str(ResourceResearchStation.turbineImprovementLabel.text).is_equal("1s")
	assert_str(ResourceResearchStation.turbineButton.text).is_equal("Maxed out")
	assert_bool(ResourceResearchStation.turbineButton.disabled).is_true()
	assert_bool(ResourceResearchStation.turbineResources.visible).is_false()


func test_update_global_turbine_values():
	Global.reset()
	
	Global.robot_upkeep = 0
	
	Global.upkeep = 0
	Global.potatoCount = 25
	Global.scrapCount = 25
	ResourceResearchStation.turbineLevel = 0
	ResourceResearchStation._update_global_values(ResourceResearchStation.turbinePrice, ResourceResearchStation.turbineLevel, ResourceResearchStation.turbineUpkeepValues, ResourceResearchStation.turbineImprovementValues)
	assert_int(Global.potatoCount).is_equal(5)
	assert_int(Global.scrapCount).is_equal(5)
	assert_int(Global.upkeep).is_equal(5)

	Global.upkeep = 0
	Global.potatoCount = 190
	Global.scrapCount = 190
	ResourceResearchStation.turbineLevel = 1
	ResourceResearchStation._update_global_values(ResourceResearchStation.turbinePrice, ResourceResearchStation.turbineLevel, ResourceResearchStation.turbineUpkeepValues, ResourceResearchStation.turbineImprovementValues)
	assert_int(Global.potatoCount).is_equal(50)
	assert_int(Global.scrapCount).is_equal(50)
	assert_int(Global.upkeep).is_equal(25)
	
	Global.upkeep = 0
	Global.potatoCount = 2100
	Global.scrapCount = 2100
	ResourceResearchStation.turbineLevel = 2
	ResourceResearchStation._update_global_values(ResourceResearchStation.turbinePrice, ResourceResearchStation.turbineLevel, ResourceResearchStation.turbineUpkeepValues, ResourceResearchStation.turbineImprovementValues)
	assert_int(Global.potatoCount).is_equal(500)
	assert_int(Global.scrapCount).is_equal(500)
	assert_int(Global.upkeep).is_equal(250)
	
	
func test_turbine_button_pressed():
	Global.reset()
	Global.upkeep = 0
	Global.robot_upkeep = 0
	Global.scrapTimer = 6
	
	ResourceResearchStation.turbineLevel = 0
	ResourceResearchStation._on_turbine_button_pressed()
	assert_int(ResourceResearchStation.turbineLevel).is_equal(1)
	assert_int(Global.scrapTimer).is_equal(3)
	
	ResourceResearchStation.turbineLevel = 1
	ResourceResearchStation._on_turbine_button_pressed()
	assert_int(ResourceResearchStation.turbineLevel).is_equal(2)
	assert_int(Global.scrapTimer).is_equal(2)
	
	ResourceResearchStation.turbineLevel = 2
	ResourceResearchStation._on_turbine_button_pressed()
	assert_int(ResourceResearchStation.turbineLevel).is_equal(3)
	assert_int(Global.scrapTimer).is_equal(1)


func test_reset_turbine_values():
	Global.reset()
	
	ResourceResearchStation.turbineLevel = ResourceResearchStation.reset_feature(ResourceResearchStation.turbineLevel, ResourceResearchStation.turbineButton, ResourceResearchStation.turbineResources, ResourceResearchStation.turbineUpkeepLabel)
	
	assert_int(ResourceResearchStation.turbineLevel).is_equal(0)
	assert_str(ResourceResearchStation.turbineButton.text).is_equal("Research")
	assert_bool(ResourceResearchStation.turbineButton.disabled).is_false()
	assert_bool(ResourceResearchStation.turbineResources.visible).is_true()
	assert_bool(ResourceResearchStation.turbineUpkeepLabel.visible).is_true()

