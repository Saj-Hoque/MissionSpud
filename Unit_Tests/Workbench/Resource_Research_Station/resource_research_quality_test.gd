# GdUnit generated TestSuite
class_name ResearchQualityTest
extends GdUnitTestSuite
@warning_ignore('unused_parameter')
@warning_ignore('return_value_discarded')

func test_quality_button_disable_true():
	Global.reset()
	
	Global.potatoCount = 0
	Global.scrapCount = 0
	
	# Price, 50 potato, 50 scrap
	ResourceResearchStation.qualityLevel = 0
	ResourceResearchStation._check_if_enough(ResourceResearchStation.qualityLevel, ResourceResearchStation.qualityPrice, ResourceResearchStation.qualityButton)
	assert_bool(ResourceResearchStation.qualityButton.disabled).is_true()
	# Price, 500 potato, 500 scrap
	ResourceResearchStation.qualityLevel = 1
	ResourceResearchStation._check_if_enough(ResourceResearchStation.qualityLevel, ResourceResearchStation.qualityPrice, ResourceResearchStation.qualityButton)
	assert_bool(ResourceResearchStation.qualityButton.disabled).is_true()
	# Price, 5000 potato, 5000 scrap
	ResourceResearchStation.qualityLevel = 2
	ResourceResearchStation._check_if_enough(ResourceResearchStation.qualityLevel, ResourceResearchStation.qualityPrice, ResourceResearchStation.qualityButton)
	assert_bool(ResourceResearchStation.qualityButton.disabled).is_true()
	
	
	Global.potatoCount = 50
	Global.scrapCount = 50
	
	# Price, 50 potato, 50 scrap
	ResourceResearchStation.qualityLevel = 0
	ResourceResearchStation._check_if_enough(ResourceResearchStation.qualityLevel, ResourceResearchStation.qualityPrice, ResourceResearchStation.qualityButton)
	assert_bool(ResourceResearchStation.qualityButton.disabled).is_false()
	# Price, 500 potato, 500 scrap
	ResourceResearchStation.qualityLevel = 1
	ResourceResearchStation._check_if_enough(ResourceResearchStation.qualityLevel, ResourceResearchStation.qualityPrice, ResourceResearchStation.qualityButton)
	assert_bool(ResourceResearchStation.qualityButton.disabled).is_true()
	# Price, 5000 potato, 5000 scrap
	ResourceResearchStation.qualityLevel = 2
	ResourceResearchStation._check_if_enough(ResourceResearchStation.qualityLevel, ResourceResearchStation.qualityPrice, ResourceResearchStation.qualityButton)
	assert_bool(ResourceResearchStation.qualityButton.disabled).is_true()
	
	Global.potatoCount = 500
	Global.scrapCount = 500
	
	# Price, 50 potato, 50 scrap
	ResourceResearchStation.qualityLevel = 0
	ResourceResearchStation._check_if_enough(ResourceResearchStation.qualityLevel, ResourceResearchStation.qualityPrice, ResourceResearchStation.qualityButton)
	assert_bool(ResourceResearchStation.qualityButton.disabled).is_false()
	# Price, 500 potato, 500 scrap
	ResourceResearchStation.qualityLevel = 1
	ResourceResearchStation._check_if_enough(ResourceResearchStation.qualityLevel, ResourceResearchStation.qualityPrice, ResourceResearchStation.qualityButton)
	assert_bool(ResourceResearchStation.qualityButton.disabled).is_false()
	# Price, 5000 potato, 5000 scrap
	ResourceResearchStation.qualityLevel = 2
	ResourceResearchStation._check_if_enough(ResourceResearchStation.qualityLevel, ResourceResearchStation.qualityPrice, ResourceResearchStation.qualityButton)
	assert_bool(ResourceResearchStation.qualityButton.disabled).is_true()
	
	
	
func test_quality_button_disable_false():
	Global.reset()
	
	Global.potatoCount = 5000
	Global.scrapCount = 5000
	
	# Price, 50 potato, 50 scrap
	ResourceResearchStation.qualityLevel = 0
	ResourceResearchStation._check_if_enough(ResourceResearchStation.qualityLevel, ResourceResearchStation.qualityPrice, ResourceResearchStation.qualityButton)
	assert_bool(ResourceResearchStation.qualityButton.disabled).is_false()
	
	# Price, 500 potato, 500 scrap
	ResourceResearchStation.qualityLevel = 1
	ResourceResearchStation._check_if_enough(ResourceResearchStation.qualityLevel, ResourceResearchStation.qualityPrice, ResourceResearchStation.qualityButton)
	assert_bool(ResourceResearchStation.qualityButton.disabled).is_false()
	
	# Price, 5000 potato, 5000 scrap
	ResourceResearchStation.qualityLevel = 2
	ResourceResearchStation._check_if_enough(ResourceResearchStation.qualityLevel, ResourceResearchStation.qualityPrice, ResourceResearchStation.qualityButton)
	assert_bool(ResourceResearchStation.qualityButton.disabled).is_false()

func test_update_quality_label_values():
	Global.reset()
	
	# Price, 50 potato, 50 scrap
	Global.upkeep = 0
	Global.robot_upkeep = 0
	ResourceResearchStation.qualityLevel = 0
	ResourceResearchStation._update_to_new_button_values(ResourceResearchStation.qualityLevel, ResourceResearchStation.qualityUpkeep, ResourceResearchStation.qualityUpkeepValues, ResourceResearchStation.qualityUpkeepLabel, ResourceResearchStation.qualityImprovements, ResourceResearchStation.qualityImprovementLabel, ResourceResearchStation.qualityCurrentUpkeep, ResourceResearchStation.qualityCurrentUpkeepLabel, ResourceResearchStation.qualityButton, ResourceResearchStation.qualityResources)
	assert_str(ResourceResearchStation.qualityPotatoPrice.text).is_equal("50")
	assert_str(ResourceResearchStation.qualityScrapPrice.text).is_equal("50")
	assert_str(ResourceResearchStation.qualityImprovementLabel.text).is_equal("1   ->   2")
	assert_str(ResourceResearchStation.qualityUpkeepLabel.text).is_equal("Upkeep	    +8")
	assert_str(ResourceResearchStation.qualityCurrentUpkeepLabel.text).is_equal("+0")
	assert_str(ResourceResearchStation.totalUpkeep.text).is_equal("Upkeep:\n0   ->   8")

	# Price, 500 potato, 500 scrap
	Global.upkeep = 0
	Global.robot_upkeep = 0
	ResourceResearchStation.qualityLevel = 1
	ResourceResearchStation._update_to_new_button_values(ResourceResearchStation.qualityLevel, ResourceResearchStation.qualityUpkeep, ResourceResearchStation.qualityUpkeepValues, ResourceResearchStation.qualityUpkeepLabel, ResourceResearchStation.qualityImprovements, ResourceResearchStation.qualityImprovementLabel, ResourceResearchStation.qualityCurrentUpkeep, ResourceResearchStation.qualityCurrentUpkeepLabel, ResourceResearchStation.qualityButton, ResourceResearchStation.qualityResources)
	assert_str(ResourceResearchStation.qualityPotatoPrice.text).is_equal("500")
	assert_str(ResourceResearchStation.qualityScrapPrice.text).is_equal("500")
	assert_str(ResourceResearchStation.qualityImprovementLabel.text).is_equal("2   ->   4")
	assert_str(ResourceResearchStation.qualityUpkeepLabel.text).is_equal("Upkeep	    +80")
	assert_str(ResourceResearchStation.qualityCurrentUpkeepLabel.text).is_equal("+8")
	assert_str(ResourceResearchStation.totalUpkeep.text).is_equal("Upkeep:\n0   ->   80")
	
	# Price, 5000 potato, 5000 scrap
	Global.upkeep = 0
	Global.robot_upkeep = 0
	ResourceResearchStation.qualityLevel = 2
	ResourceResearchStation._update_to_new_button_values(ResourceResearchStation.qualityLevel, ResourceResearchStation.qualityUpkeep, ResourceResearchStation.qualityUpkeepValues, ResourceResearchStation.qualityUpkeepLabel, ResourceResearchStation.qualityImprovements, ResourceResearchStation.qualityImprovementLabel, ResourceResearchStation.qualityCurrentUpkeep, ResourceResearchStation.qualityCurrentUpkeepLabel, ResourceResearchStation.qualityButton, ResourceResearchStation.qualityResources)
	assert_str(ResourceResearchStation.qualityPotatoPrice.text).is_equal("5000")
	assert_str(ResourceResearchStation.qualityScrapPrice.text).is_equal("5000")
	assert_str(ResourceResearchStation.qualityImprovementLabel.text).is_equal("4   ->   8")
	assert_str(ResourceResearchStation.qualityUpkeepLabel.text).is_equal("Upkeep	    +800")
	assert_str(ResourceResearchStation.qualityCurrentUpkeepLabel.text).is_equal("+88")
	assert_str(ResourceResearchStation.totalUpkeep.text).is_equal("Upkeep:\n0   ->   800")

	# Maxed out
	Global.upkeep = 0
	Global.robot_upkeep = 0
	ResourceResearchStation.qualityLevel = 3
	ResourceResearchStation._update_to_new_button_values(ResourceResearchStation.qualityLevel, ResourceResearchStation.qualityUpkeep, ResourceResearchStation.qualityUpkeepValues, ResourceResearchStation.qualityUpkeepLabel, ResourceResearchStation.qualityImprovements, ResourceResearchStation.qualityImprovementLabel, ResourceResearchStation.qualityCurrentUpkeep, ResourceResearchStation.qualityCurrentUpkeepLabel, ResourceResearchStation.qualityButton, ResourceResearchStation.qualityResources)
	assert_bool(ResourceResearchStation.totalUpkeep.visible).is_false()
	assert_bool(ResourceResearchStation.qualityUpkeepLabel.visible).is_false()
	assert_str(ResourceResearchStation.qualityCurrentUpkeepLabel.text).is_equal("+888")
	assert_str(ResourceResearchStation.qualityImprovementLabel.text).is_equal("8")
	assert_str(ResourceResearchStation.qualityButton.text).is_equal("Maxed out")
	assert_bool(ResourceResearchStation.qualityButton.disabled).is_true()
	assert_bool(ResourceResearchStation.qualityResources.visible).is_false()


func test_update_global_quality_values():
	Global.reset()
	
	Global.robot_upkeep = 0
	
	Global.upkeep = 0
	Global.potatoCount = 55
	Global.scrapCount = 55
	ResourceResearchStation.qualityLevel = 0
	ResourceResearchStation._update_global_values(ResourceResearchStation.qualityPrice, ResourceResearchStation.qualityLevel, ResourceResearchStation.qualityUpkeepValues, ResourceResearchStation.qualityImprovementValues)
	assert_int(Global.potatoCount).is_equal(5)
	assert_int(Global.scrapCount).is_equal(5)
	assert_int(Global.upkeep).is_equal(8)

	Global.upkeep = 0
	Global.potatoCount = 550
	Global.scrapCount = 550
	ResourceResearchStation.qualityLevel = 1
	ResourceResearchStation._update_global_values(ResourceResearchStation.qualityPrice, ResourceResearchStation.qualityLevel, ResourceResearchStation.qualityUpkeepValues, ResourceResearchStation.qualityImprovementValues)
	assert_int(Global.potatoCount).is_equal(50)
	assert_int(Global.scrapCount).is_equal(50)
	assert_int(Global.upkeep).is_equal(80)
	
	Global.upkeep = 0
	Global.potatoCount = 5500
	Global.scrapCount = 5500
	ResourceResearchStation.qualityLevel = 2
	ResourceResearchStation._update_global_values(ResourceResearchStation.qualityPrice, ResourceResearchStation.qualityLevel, ResourceResearchStation.qualityUpkeepValues, ResourceResearchStation.qualityImprovementValues)
	assert_int(Global.potatoCount).is_equal(500)
	assert_int(Global.scrapCount).is_equal(500)
	assert_int(Global.upkeep).is_equal(800)
	
	
func test_quality_button_pressed():
	Global.reset()
	Global.upkeep = 0
	Global.robot_upkeep = 0
	Global.potatoValue = 1
	
	ResourceResearchStation.qualityLevel = 0
	ResourceResearchStation._on_quality_button_pressed()
	assert_int(ResourceResearchStation.qualityLevel).is_equal(1)
	assert_int(Global.potatoValue).is_equal(2)
	
	ResourceResearchStation.qualityLevel = 1
	ResourceResearchStation._on_quality_button_pressed()
	assert_int(ResourceResearchStation.qualityLevel).is_equal(2)
	assert_int(Global.potatoValue).is_equal(4)
	
	ResourceResearchStation.qualityLevel = 2
	ResourceResearchStation._on_quality_button_pressed()
	assert_int(ResourceResearchStation.qualityLevel).is_equal(3)
	assert_int(Global.potatoValue).is_equal(8)


func test_reset_quality_values():
	Global.reset()
	
	ResourceResearchStation.qualityLevel = ResourceResearchStation.reset_feature(ResourceResearchStation.qualityLevel, ResourceResearchStation.qualityButton, ResourceResearchStation.qualityResources, ResourceResearchStation.qualityUpkeepLabel)
	
	assert_int(ResourceResearchStation.qualityLevel).is_equal(0)
	assert_str(ResourceResearchStation.qualityButton.text).is_equal("Research")
	assert_bool(ResourceResearchStation.qualityButton.disabled).is_false()
	assert_bool(ResourceResearchStation.qualityResources.visible).is_true()
	assert_bool(ResourceResearchStation.qualityUpkeepLabel.visible).is_true()


