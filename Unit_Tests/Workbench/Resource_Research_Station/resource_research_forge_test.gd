# GdUnit generated TestSuite
class_name ResearchForgeTest
extends GdUnitTestSuite
@warning_ignore('unused_parameter')
@warning_ignore('return_value_discarded')

func test_forge_button_disable_true():
	Global.reset()
	
	Global.potatoCount = 0
	Global.scrapCount = 0
	
	# Price, 35 potato, 35 scrap
	ResourceResearchStation.forgeLevel = 0
	ResourceResearchStation._check_if_enough(ResourceResearchStation.forgeLevel, ResourceResearchStation.forgePrice, ResourceResearchStation.forgeButton)
	assert_bool(ResourceResearchStation.forgeButton.disabled).is_true()
	# Price, 350 potato, 350 scrap
	ResourceResearchStation.forgeLevel = 1
	ResourceResearchStation._check_if_enough(ResourceResearchStation.forgeLevel, ResourceResearchStation.forgePrice, ResourceResearchStation.forgeButton)
	assert_bool(ResourceResearchStation.forgeButton.disabled).is_true()
	# Price, 3500 potato, 3500 scrap
	ResourceResearchStation.forgeLevel = 2
	ResourceResearchStation._check_if_enough(ResourceResearchStation.forgeLevel, ResourceResearchStation.forgePrice, ResourceResearchStation.forgeButton)
	assert_bool(ResourceResearchStation.forgeButton.disabled).is_true()
	
	
	Global.potatoCount = 35
	Global.scrapCount = 35
	
	# Price, 35 potato, 35 scrap
	ResourceResearchStation.forgeLevel = 0
	ResourceResearchStation._check_if_enough(ResourceResearchStation.forgeLevel, ResourceResearchStation.forgePrice, ResourceResearchStation.forgeButton)
	assert_bool(ResourceResearchStation.forgeButton.disabled).is_false()
	# Price, 350 potato, 350 scrap
	ResourceResearchStation.forgeLevel = 1
	ResourceResearchStation._check_if_enough(ResourceResearchStation.forgeLevel, ResourceResearchStation.forgePrice, ResourceResearchStation.forgeButton)
	assert_bool(ResourceResearchStation.forgeButton.disabled).is_true()
	# Price, 3500 potato, 3500 scrap
	ResourceResearchStation.forgeLevel = 2
	ResourceResearchStation._check_if_enough(ResourceResearchStation.forgeLevel, ResourceResearchStation.forgePrice, ResourceResearchStation.forgeButton)
	assert_bool(ResourceResearchStation.forgeButton.disabled).is_true()
	
	Global.potatoCount = 350
	Global.scrapCount = 350
	
	# Price, 35 potato, 35 scrap
	ResourceResearchStation.forgeLevel = 0
	ResourceResearchStation._check_if_enough(ResourceResearchStation.forgeLevel, ResourceResearchStation.forgePrice, ResourceResearchStation.forgeButton)
	assert_bool(ResourceResearchStation.forgeButton.disabled).is_false()
	# Price, 350 potato, 350 scrap
	ResourceResearchStation.forgeLevel = 1
	ResourceResearchStation._check_if_enough(ResourceResearchStation.forgeLevel, ResourceResearchStation.forgePrice, ResourceResearchStation.forgeButton)
	assert_bool(ResourceResearchStation.forgeButton.disabled).is_false()
	# Price, 3500 potato, 3500 scrap
	ResourceResearchStation.forgeLevel = 2
	ResourceResearchStation._check_if_enough(ResourceResearchStation.forgeLevel, ResourceResearchStation.forgePrice, ResourceResearchStation.forgeButton)
	assert_bool(ResourceResearchStation.forgeButton.disabled).is_true()
	
	
	
func test_forge_button_disable_false():
	Global.reset()
	
	Global.potatoCount = 3500
	Global.scrapCount = 3500
	
	# Price, 35 potato, 35 scrap
	ResourceResearchStation.forgeLevel = 0
	ResourceResearchStation._check_if_enough(ResourceResearchStation.forgeLevel, ResourceResearchStation.forgePrice, ResourceResearchStation.forgeButton)
	assert_bool(ResourceResearchStation.forgeButton.disabled).is_false()
	
	# Price, 350 potato, 350 scrap
	ResourceResearchStation.forgeLevel = 1
	ResourceResearchStation._check_if_enough(ResourceResearchStation.forgeLevel, ResourceResearchStation.forgePrice, ResourceResearchStation.forgeButton)
	assert_bool(ResourceResearchStation.forgeButton.disabled).is_false()
	
	# Price, 3500 potato, 3500 scrap
	ResourceResearchStation.forgeLevel = 2
	ResourceResearchStation._check_if_enough(ResourceResearchStation.forgeLevel, ResourceResearchStation.forgePrice, ResourceResearchStation.forgeButton)
	assert_bool(ResourceResearchStation.forgeButton.disabled).is_false()

func test_update_forge_label_values():
	Global.reset()
	
	# Price, 35 potato, 35 scrap
	Global.upkeep = 0
	Global.robot_upkeep = 0
	ResourceResearchStation.forgeLevel = 0
	ResourceResearchStation._update_to_new_button_values(ResourceResearchStation.forgeLevel, ResourceResearchStation.forgeUpkeep, ResourceResearchStation.forgeUpkeepValues, ResourceResearchStation.forgeUpkeepLabel, ResourceResearchStation.forgeImprovements, ResourceResearchStation.forgeImprovementLabel, ResourceResearchStation.forgeCurrentUpkeep, ResourceResearchStation.forgeCurrentUpkeepLabel, ResourceResearchStation.forgeButton, ResourceResearchStation.forgeResources)
	assert_str(ResourceResearchStation.forgePotatoPrice.text).is_equal("35")
	assert_str(ResourceResearchStation.forgeScrapPrice.text).is_equal("35")
	assert_str(ResourceResearchStation.forgeImprovementLabel.text).is_equal("1   ->   2")
	assert_str(ResourceResearchStation.forgeUpkeepLabel.text).is_equal("Upkeep	    +8")
	assert_str(ResourceResearchStation.forgeCurrentUpkeepLabel.text).is_equal("+0")
	assert_str(ResourceResearchStation.totalUpkeep.text).is_equal("Upkeep:\n0   ->   8")

	# Price, 350 potato, 350 scrap
	Global.upkeep = 0
	Global.robot_upkeep = 0
	ResourceResearchStation.forgeLevel = 1
	ResourceResearchStation._update_to_new_button_values(ResourceResearchStation.forgeLevel, ResourceResearchStation.forgeUpkeep, ResourceResearchStation.forgeUpkeepValues, ResourceResearchStation.forgeUpkeepLabel, ResourceResearchStation.forgeImprovements, ResourceResearchStation.forgeImprovementLabel, ResourceResearchStation.forgeCurrentUpkeep, ResourceResearchStation.forgeCurrentUpkeepLabel, ResourceResearchStation.forgeButton, ResourceResearchStation.forgeResources)
	assert_str(ResourceResearchStation.forgePotatoPrice.text).is_equal("350")
	assert_str(ResourceResearchStation.forgeScrapPrice.text).is_equal("350")
	assert_str(ResourceResearchStation.forgeImprovementLabel.text).is_equal("2   ->   4")
	assert_str(ResourceResearchStation.forgeUpkeepLabel.text).is_equal("Upkeep	    +80")
	assert_str(ResourceResearchStation.forgeCurrentUpkeepLabel.text).is_equal("+8")
	assert_str(ResourceResearchStation.totalUpkeep.text).is_equal("Upkeep:\n0   ->   80")
	
	# Price, 3500 potato, 3500 scrap
	Global.upkeep = 0
	Global.robot_upkeep = 0
	ResourceResearchStation.forgeLevel = 2
	ResourceResearchStation._update_to_new_button_values(ResourceResearchStation.forgeLevel, ResourceResearchStation.forgeUpkeep, ResourceResearchStation.forgeUpkeepValues, ResourceResearchStation.forgeUpkeepLabel, ResourceResearchStation.forgeImprovements, ResourceResearchStation.forgeImprovementLabel, ResourceResearchStation.forgeCurrentUpkeep, ResourceResearchStation.forgeCurrentUpkeepLabel, ResourceResearchStation.forgeButton, ResourceResearchStation.forgeResources)
	assert_str(ResourceResearchStation.forgePotatoPrice.text).is_equal("3500")
	assert_str(ResourceResearchStation.forgeScrapPrice.text).is_equal("3500")
	assert_str(ResourceResearchStation.forgeImprovementLabel.text).is_equal("4   ->   16")
	assert_str(ResourceResearchStation.forgeUpkeepLabel.text).is_equal("Upkeep	    +800")
	assert_str(ResourceResearchStation.forgeCurrentUpkeepLabel.text).is_equal("+88")
	assert_str(ResourceResearchStation.totalUpkeep.text).is_equal("Upkeep:\n0   ->   800")

	# Maxed out
	Global.upkeep = 0
	Global.robot_upkeep = 0
	ResourceResearchStation.forgeLevel = 3
	ResourceResearchStation._update_to_new_button_values(ResourceResearchStation.forgeLevel, ResourceResearchStation.forgeUpkeep, ResourceResearchStation.forgeUpkeepValues, ResourceResearchStation.forgeUpkeepLabel, ResourceResearchStation.forgeImprovements, ResourceResearchStation.forgeImprovementLabel, ResourceResearchStation.forgeCurrentUpkeep, ResourceResearchStation.forgeCurrentUpkeepLabel, ResourceResearchStation.forgeButton, ResourceResearchStation.forgeResources)
	assert_bool(ResourceResearchStation.totalUpkeep.visible).is_false()
	assert_bool(ResourceResearchStation.forgeUpkeepLabel.visible).is_false()
	assert_str(ResourceResearchStation.forgeCurrentUpkeepLabel.text).is_equal("+888")
	assert_str(ResourceResearchStation.forgeImprovementLabel.text).is_equal("16")
	assert_str(ResourceResearchStation.forgeButton.text).is_equal("Maxed out")
	assert_bool(ResourceResearchStation.forgeButton.disabled).is_true()
	assert_bool(ResourceResearchStation.forgeResources.visible).is_false()


func test_update_global_forge_values():
	Global.reset()
	
	Global.robot_upkeep = 0
	
	Global.upkeep = 0
	Global.potatoCount = 40
	Global.scrapCount = 40
	ResourceResearchStation.forgeLevel = 0
	ResourceResearchStation._update_global_values(ResourceResearchStation.forgePrice, ResourceResearchStation.forgeLevel, ResourceResearchStation.forgeUpkeepValues, ResourceResearchStation.forgeImprovementValues)
	assert_int(Global.potatoCount).is_equal(5)
	assert_int(Global.scrapCount).is_equal(5)
	assert_int(Global.upkeep).is_equal(8)

	Global.upkeep = 0
	Global.potatoCount = 400
	Global.scrapCount = 400
	ResourceResearchStation.forgeLevel = 1
	ResourceResearchStation._update_global_values(ResourceResearchStation.forgePrice, ResourceResearchStation.forgeLevel, ResourceResearchStation.forgeUpkeepValues, ResourceResearchStation.forgeImprovementValues)
	assert_int(Global.potatoCount).is_equal(50)
	assert_int(Global.scrapCount).is_equal(50)
	assert_int(Global.upkeep).is_equal(80)
	
	Global.upkeep = 0
	Global.potatoCount = 4000
	Global.scrapCount = 4000
	ResourceResearchStation.forgeLevel = 2
	ResourceResearchStation._update_global_values(ResourceResearchStation.forgePrice, ResourceResearchStation.forgeLevel, ResourceResearchStation.forgeUpkeepValues, ResourceResearchStation.forgeImprovementValues)
	assert_int(Global.potatoCount).is_equal(500)
	assert_int(Global.scrapCount).is_equal(500)
	assert_int(Global.upkeep).is_equal(800)
	
	
func test_forge_button_pressed():
	Global.reset()
	Global.upkeep = 0
	Global.robot_upkeep = 0
	Global.scrapValue = 1
	
	ResourceResearchStation.forgeLevel = 0
	ResourceResearchStation._on_forge_button_pressed()
	assert_int(ResourceResearchStation.forgeLevel).is_equal(1)
	assert_int(Global.scrapValue).is_equal(2)
	
	ResourceResearchStation.forgeLevel = 1
	ResourceResearchStation._on_forge_button_pressed()
	assert_int(ResourceResearchStation.forgeLevel).is_equal(2)
	assert_int(Global.scrapValue).is_equal(4)
	
	ResourceResearchStation.forgeLevel = 2
	ResourceResearchStation._on_forge_button_pressed()
	assert_int(ResourceResearchStation.forgeLevel).is_equal(3)
	assert_int(Global.scrapValue).is_equal(16)


func test_reset_forge_values():
	Global.reset()
	
	ResourceResearchStation.forgeLevel = ResourceResearchStation.reset_feature(ResourceResearchStation.forgeLevel, ResourceResearchStation.forgeButton, ResourceResearchStation.forgeResources, ResourceResearchStation.forgeUpkeepLabel)
	
	assert_int(ResourceResearchStation.forgeLevel).is_equal(0)
	assert_str(ResourceResearchStation.forgeButton.text).is_equal("Research")
	assert_bool(ResourceResearchStation.forgeButton.disabled).is_false()
	assert_bool(ResourceResearchStation.forgeResources.visible).is_true()
	assert_bool(ResourceResearchStation.forgeUpkeepLabel.visible).is_true()

