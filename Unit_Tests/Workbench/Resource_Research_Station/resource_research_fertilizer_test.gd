# GdUnit generated TestSuite
class_name ResearchFertilizerTest
extends GdUnitTestSuite
@warning_ignore('unused_parameter')
@warning_ignore('return_value_discarded')

func test_fertilizer_button_disable_true():
	Global.reset()
	
	Global.potatoCount = 0
	Global.scrapCount = 0
	
	# Price, 35 potato, 35 scrap
	ResourceResearchStation.fertilizerLevel = 0
	ResourceResearchStation._check_if_enough(ResourceResearchStation.fertilizerLevel, ResourceResearchStation.fertilizerPrice, ResourceResearchStation.fertilizerButton)
	assert_bool(ResourceResearchStation.fertilizerButton.disabled).is_true()
	# Price, 350 potato, 350 scrap
	ResourceResearchStation.fertilizerLevel = 1
	ResourceResearchStation._check_if_enough(ResourceResearchStation.fertilizerLevel, ResourceResearchStation.fertilizerPrice, ResourceResearchStation.fertilizerButton)
	assert_bool(ResourceResearchStation.fertilizerButton.disabled).is_true()
	# Price, 3500 potato, 3500 scrap
	ResourceResearchStation.fertilizerLevel = 2
	ResourceResearchStation._check_if_enough(ResourceResearchStation.fertilizerLevel, ResourceResearchStation.fertilizerPrice, ResourceResearchStation.fertilizerButton)
	assert_bool(ResourceResearchStation.fertilizerButton.disabled).is_true()
	
	
	Global.potatoCount = 35
	Global.scrapCount = 35
	
	# Price, 35 potato, 35 scrap
	ResourceResearchStation.fertilizerLevel = 0
	ResourceResearchStation._check_if_enough(ResourceResearchStation.fertilizerLevel, ResourceResearchStation.fertilizerPrice, ResourceResearchStation.fertilizerButton)
	assert_bool(ResourceResearchStation.fertilizerButton.disabled).is_false()
	# Price, 350 potato, 350 scrap
	ResourceResearchStation.fertilizerLevel = 1
	ResourceResearchStation._check_if_enough(ResourceResearchStation.fertilizerLevel, ResourceResearchStation.fertilizerPrice, ResourceResearchStation.fertilizerButton)
	assert_bool(ResourceResearchStation.fertilizerButton.disabled).is_true()
	# Price, 3500 potato, 3500 scrap
	ResourceResearchStation.fertilizerLevel = 2
	ResourceResearchStation._check_if_enough(ResourceResearchStation.fertilizerLevel, ResourceResearchStation.fertilizerPrice, ResourceResearchStation.fertilizerButton)
	assert_bool(ResourceResearchStation.fertilizerButton.disabled).is_true()
	
	Global.potatoCount = 350
	Global.scrapCount = 350
	
	# Price, 35 potato, 35 scrap
	ResourceResearchStation.fertilizerLevel = 0
	ResourceResearchStation._check_if_enough(ResourceResearchStation.fertilizerLevel, ResourceResearchStation.fertilizerPrice, ResourceResearchStation.fertilizerButton)
	assert_bool(ResourceResearchStation.fertilizerButton.disabled).is_false()
	# Price, 350 potato, 350 scrap
	ResourceResearchStation.fertilizerLevel = 1
	ResourceResearchStation._check_if_enough(ResourceResearchStation.fertilizerLevel, ResourceResearchStation.fertilizerPrice, ResourceResearchStation.fertilizerButton)
	assert_bool(ResourceResearchStation.fertilizerButton.disabled).is_false()
	# Price, 3500 potato, 3500 scrap
	ResourceResearchStation.fertilizerLevel = 2
	ResourceResearchStation._check_if_enough(ResourceResearchStation.fertilizerLevel, ResourceResearchStation.fertilizerPrice, ResourceResearchStation.fertilizerButton)
	assert_bool(ResourceResearchStation.fertilizerButton.disabled).is_true()
	
	
	
func test_fertilizer_button_disable_false():
	Global.reset()
	
	Global.potatoCount = 3500
	Global.scrapCount = 3500
	
	# Price, 35 potato, 35 scrap
	ResourceResearchStation.fertilizerLevel = 0
	ResourceResearchStation._check_if_enough(ResourceResearchStation.fertilizerLevel, ResourceResearchStation.fertilizerPrice, ResourceResearchStation.fertilizerButton)
	assert_bool(ResourceResearchStation.fertilizerButton.disabled).is_false()
	
	# Price, 350 potato, 350 scrap
	ResourceResearchStation.fertilizerLevel = 1
	ResourceResearchStation._check_if_enough(ResourceResearchStation.fertilizerLevel, ResourceResearchStation.fertilizerPrice, ResourceResearchStation.fertilizerButton)
	assert_bool(ResourceResearchStation.fertilizerButton.disabled).is_false()
	
	# Price, 3500 potato, 3500 scrap
	ResourceResearchStation.fertilizerLevel = 2
	ResourceResearchStation._check_if_enough(ResourceResearchStation.fertilizerLevel, ResourceResearchStation.fertilizerPrice, ResourceResearchStation.fertilizerButton)
	assert_bool(ResourceResearchStation.fertilizerButton.disabled).is_false()

func test_update_fertilizer_label_values():
	Global.reset()
	
	# Price, 35 potato, 35 scrap
	Global.upkeep = 0
	Global.robot_upkeep = 0
	ResourceResearchStation.fertilizerLevel = 0
	ResourceResearchStation._update_to_new_button_values(ResourceResearchStation.fertilizerLevel, ResourceResearchStation.fertilizerUpkeep, ResourceResearchStation.fertilizerUpkeepValues, ResourceResearchStation.fertilizerUpkeepLabel, ResourceResearchStation.fertilizerImprovements, ResourceResearchStation.fertilizerImprovementLabel, ResourceResearchStation.fertilizerCurrentUpkeep, ResourceResearchStation.fertilizerCurrentUpkeepLabel, ResourceResearchStation.fertilizerButton, ResourceResearchStation.fertilizerResources)
	assert_str(ResourceResearchStation.fertilizerPotatoPrice.text).is_equal("35")
	assert_str(ResourceResearchStation.fertilizerScrapPrice.text).is_equal("35")
	assert_str(ResourceResearchStation.fertilizerImprovementLabel.text).is_equal("x 2   ->   x 3")
	assert_str(ResourceResearchStation.fertilizerUpkeepLabel.text).is_equal("Upkeep	    +6")
	assert_str(ResourceResearchStation.fertilizerCurrentUpkeepLabel.text).is_equal("+0")
	assert_str(ResourceResearchStation.totalUpkeep.text).is_equal("Upkeep:\n0   ->   6")

	# Price, 350 potato, 350 scrap
	Global.upkeep = 0
	Global.robot_upkeep = 0
	ResourceResearchStation.fertilizerLevel = 1
	ResourceResearchStation._update_to_new_button_values(ResourceResearchStation.fertilizerLevel, ResourceResearchStation.fertilizerUpkeep, ResourceResearchStation.fertilizerUpkeepValues, ResourceResearchStation.fertilizerUpkeepLabel, ResourceResearchStation.fertilizerImprovements, ResourceResearchStation.fertilizerImprovementLabel, ResourceResearchStation.fertilizerCurrentUpkeep, ResourceResearchStation.fertilizerCurrentUpkeepLabel, ResourceResearchStation.fertilizerButton, ResourceResearchStation.fertilizerResources)
	assert_str(ResourceResearchStation.fertilizerPotatoPrice.text).is_equal("350")
	assert_str(ResourceResearchStation.fertilizerScrapPrice.text).is_equal("350")
	assert_str(ResourceResearchStation.fertilizerImprovementLabel.text).is_equal("x 3   ->   x 4")
	assert_str(ResourceResearchStation.fertilizerUpkeepLabel.text).is_equal("Upkeep	    +60")
	assert_str(ResourceResearchStation.fertilizerCurrentUpkeepLabel.text).is_equal("+6")
	assert_str(ResourceResearchStation.totalUpkeep.text).is_equal("Upkeep:\n0   ->   60")
	
	# Price, 3500 potato, 3500 scrap
	Global.upkeep = 0
	Global.robot_upkeep = 0
	ResourceResearchStation.fertilizerLevel = 2
	ResourceResearchStation._update_to_new_button_values(ResourceResearchStation.fertilizerLevel, ResourceResearchStation.fertilizerUpkeep, ResourceResearchStation.fertilizerUpkeepValues, ResourceResearchStation.fertilizerUpkeepLabel, ResourceResearchStation.fertilizerImprovements, ResourceResearchStation.fertilizerImprovementLabel, ResourceResearchStation.fertilizerCurrentUpkeep, ResourceResearchStation.fertilizerCurrentUpkeepLabel, ResourceResearchStation.fertilizerButton, ResourceResearchStation.fertilizerResources)
	assert_str(ResourceResearchStation.fertilizerPotatoPrice.text).is_equal("3500")
	assert_str(ResourceResearchStation.fertilizerScrapPrice.text).is_equal("3500")
	assert_str(ResourceResearchStation.fertilizerImprovementLabel.text).is_equal("x 4   ->   x 5")
	assert_str(ResourceResearchStation.fertilizerUpkeepLabel.text).is_equal("Upkeep	    +600")
	assert_str(ResourceResearchStation.fertilizerCurrentUpkeepLabel.text).is_equal("+66")
	assert_str(ResourceResearchStation.totalUpkeep.text).is_equal("Upkeep:\n0   ->   600")

	# Maxed out
	Global.upkeep = 0
	Global.robot_upkeep = 0
	ResourceResearchStation.fertilizerLevel = 3
	ResourceResearchStation._update_to_new_button_values(ResourceResearchStation.fertilizerLevel, ResourceResearchStation.fertilizerUpkeep, ResourceResearchStation.fertilizerUpkeepValues, ResourceResearchStation.fertilizerUpkeepLabel, ResourceResearchStation.fertilizerImprovements, ResourceResearchStation.fertilizerImprovementLabel, ResourceResearchStation.fertilizerCurrentUpkeep, ResourceResearchStation.fertilizerCurrentUpkeepLabel, ResourceResearchStation.fertilizerButton, ResourceResearchStation.fertilizerResources)
	assert_bool(ResourceResearchStation.totalUpkeep.visible).is_false()
	assert_bool(ResourceResearchStation.fertilizerUpkeepLabel.visible).is_false()
	assert_str(ResourceResearchStation.fertilizerCurrentUpkeepLabel.text).is_equal("+666")
	assert_str(ResourceResearchStation.fertilizerImprovementLabel.text).is_equal("x 5")
	assert_str(ResourceResearchStation.fertilizerButton.text).is_equal("Maxed out")
	assert_bool(ResourceResearchStation.fertilizerButton.disabled).is_true()
	assert_bool(ResourceResearchStation.fertilizerResources.visible).is_false()


func test_update_global_fertilizer_values():
	Global.reset()
	
	Global.robot_upkeep = 0
	
	Global.upkeep = 0
	Global.potatoCount = 40
	Global.scrapCount = 40
	ResourceResearchStation.fertilizerLevel = 0
	ResourceResearchStation._update_global_values(ResourceResearchStation.fertilizerPrice, ResourceResearchStation.fertilizerLevel, ResourceResearchStation.fertilizerUpkeepValues, ResourceResearchStation.fertilizerImprovementValues)
	assert_int(Global.potatoCount).is_equal(5)
	assert_int(Global.scrapCount).is_equal(5)
	assert_int(Global.upkeep).is_equal(6)

	Global.upkeep = 0
	Global.potatoCount = 400
	Global.scrapCount = 400
	ResourceResearchStation.fertilizerLevel = 1
	ResourceResearchStation._update_global_values(ResourceResearchStation.fertilizerPrice, ResourceResearchStation.fertilizerLevel, ResourceResearchStation.fertilizerUpkeepValues, ResourceResearchStation.fertilizerImprovementValues)
	assert_int(Global.potatoCount).is_equal(50)
	assert_int(Global.scrapCount).is_equal(50)
	assert_int(Global.upkeep).is_equal(60)
	
	Global.upkeep = 0
	Global.potatoCount = 4000
	Global.scrapCount = 4000
	ResourceResearchStation.fertilizerLevel = 2
	ResourceResearchStation._update_global_values(ResourceResearchStation.fertilizerPrice, ResourceResearchStation.fertilizerLevel, ResourceResearchStation.fertilizerUpkeepValues, ResourceResearchStation.fertilizerImprovementValues)
	assert_int(Global.potatoCount).is_equal(500)
	assert_int(Global.scrapCount).is_equal(500)
	assert_int(Global.upkeep).is_equal(600)
	
	
func test_fertilizer_button_pressed():
	Global.reset()
	Global.upkeep = 0
	Global.robot_upkeep = 0
	Global.potatoQuantity = 2
	
	ResourceResearchStation.fertilizerLevel = 0
	ResourceResearchStation._on_fertilizer_button_pressed()
	assert_int(ResourceResearchStation.fertilizerLevel).is_equal(1)
	assert_int(Global.potatoQuantity).is_equal(3)
	
	ResourceResearchStation.fertilizerLevel = 1
	ResourceResearchStation._on_fertilizer_button_pressed()
	assert_int(ResourceResearchStation.fertilizerLevel).is_equal(2)
	assert_int(Global.potatoQuantity).is_equal(4)
	
	ResourceResearchStation.fertilizerLevel = 2
	ResourceResearchStation._on_fertilizer_button_pressed()
	assert_int(ResourceResearchStation.fertilizerLevel).is_equal(3)
	assert_int(Global.potatoQuantity).is_equal(5)




