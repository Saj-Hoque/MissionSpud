# GdUnit generated TestSuite
class_name ResearchGrowthTest
extends GdUnitTestSuite
@warning_ignore('unused_parameter')
@warning_ignore('return_value_discarded')

func test_growth_button_disable_true():
	Global.reset()
	
	Global.potatoCount = 0
	Global.scrapCount = 0
	
	# Price, 25 potato, 25 scrap
	ResourceResearchStation.growthLevel = 0
	ResourceResearchStation._check_if_enough(ResourceResearchStation.growthLevel, ResourceResearchStation.growthPrice, ResourceResearchStation.growthButton)
	assert_bool(ResourceResearchStation.growthButton.disabled).is_true()
	# Price, 175 potato, 175 scrap
	ResourceResearchStation.growthLevel = 1
	ResourceResearchStation._check_if_enough(ResourceResearchStation.growthLevel, ResourceResearchStation.growthPrice, ResourceResearchStation.growthButton)
	assert_bool(ResourceResearchStation.growthButton.disabled).is_true()
	# Price, 1225 potato, 1225 scrap
	ResourceResearchStation.growthLevel = 2
	ResourceResearchStation._check_if_enough(ResourceResearchStation.growthLevel, ResourceResearchStation.growthPrice, ResourceResearchStation.growthButton)
	assert_bool(ResourceResearchStation.growthButton.disabled).is_true()
	
	
	Global.potatoCount = 25
	Global.scrapCount = 25
	
	# Price, 25 potato, 25 scrap
	ResourceResearchStation.growthLevel = 0
	ResourceResearchStation._check_if_enough(ResourceResearchStation.growthLevel, ResourceResearchStation.growthPrice, ResourceResearchStation.growthButton)
	assert_bool(ResourceResearchStation.growthButton.disabled).is_false()
	# Price, 175 potato, 175 scrap
	ResourceResearchStation.growthLevel = 1
	ResourceResearchStation._check_if_enough(ResourceResearchStation.growthLevel, ResourceResearchStation.growthPrice, ResourceResearchStation.growthButton)
	assert_bool(ResourceResearchStation.growthButton.disabled).is_true()
	# Price, 1225 potato, 1225 scrap
	ResourceResearchStation.growthLevel = 2
	ResourceResearchStation._check_if_enough(ResourceResearchStation.growthLevel, ResourceResearchStation.growthPrice, ResourceResearchStation.growthButton)
	assert_bool(ResourceResearchStation.growthButton.disabled).is_true()
	
	Global.potatoCount = 175
	Global.scrapCount = 175
	
	# Price, 25 potato, 25 scrap
	ResourceResearchStation.growthLevel = 0
	ResourceResearchStation._check_if_enough(ResourceResearchStation.growthLevel, ResourceResearchStation.growthPrice, ResourceResearchStation.growthButton)
	assert_bool(ResourceResearchStation.growthButton.disabled).is_false()
	# Price, 175 potato, 175 scrap
	ResourceResearchStation.growthLevel = 1
	ResourceResearchStation._check_if_enough(ResourceResearchStation.growthLevel, ResourceResearchStation.growthPrice, ResourceResearchStation.growthButton)
	assert_bool(ResourceResearchStation.growthButton.disabled).is_false()
	# Price, 1225 potato, 1225 scrap
	ResourceResearchStation.growthLevel = 2
	ResourceResearchStation._check_if_enough(ResourceResearchStation.growthLevel, ResourceResearchStation.growthPrice, ResourceResearchStation.growthButton)
	assert_bool(ResourceResearchStation.growthButton.disabled).is_true()
	
	
	
func test_growth_button_disable_false():
	Global.reset()
	
	Global.potatoCount = 1225
	Global.scrapCount = 1225
	
	# Price, 25 potato, 25 scrap
	ResourceResearchStation.growthLevel = 0
	ResourceResearchStation._check_if_enough(ResourceResearchStation.growthLevel, ResourceResearchStation.growthPrice, ResourceResearchStation.growthButton)
	assert_bool(ResourceResearchStation.growthButton.disabled).is_false()
	
	# Price, 175 potato, 175 scrap
	ResourceResearchStation.growthLevel = 1
	ResourceResearchStation._check_if_enough(ResourceResearchStation.growthLevel, ResourceResearchStation.growthPrice, ResourceResearchStation.growthButton)
	assert_bool(ResourceResearchStation.growthButton.disabled).is_false()
	
	# Price, 1225 potato, 1225 scrap
	ResourceResearchStation.growthLevel = 2
	ResourceResearchStation._check_if_enough(ResourceResearchStation.growthLevel, ResourceResearchStation.growthPrice, ResourceResearchStation.growthButton)
	assert_bool(ResourceResearchStation.growthButton.disabled).is_false()

func test_update_growth_label_values():
	Global.reset()
	
	# Price, 25 potato, 25 scrap
	Global.upkeep = 0
	Global.robot_upkeep = 0
	ResourceResearchStation.growthLevel = 0
	ResourceResearchStation._update_to_new_button_values(ResourceResearchStation.growthLevel, ResourceResearchStation.growthUpkeep, ResourceResearchStation.growthUpkeepValues, ResourceResearchStation.growthUpkeepLabel, ResourceResearchStation.growthImprovements, ResourceResearchStation.growthImprovementLabel, ResourceResearchStation.growthCurrentUpkeep, ResourceResearchStation.growthCurrentUpkeepLabel, ResourceResearchStation.growthButton, ResourceResearchStation.growthResources)
	assert_str(ResourceResearchStation.growthPotatoPrice.text).is_equal("25")
	assert_str(ResourceResearchStation.growthScrapPrice.text).is_equal("25")
	assert_str(ResourceResearchStation.growthImprovementLabel.text).is_equal("6s   ->   3s")
	assert_str(ResourceResearchStation.growthUpkeepLabel.text).is_equal("Upkeep	    +5")
	assert_str(ResourceResearchStation.growthCurrentUpkeepLabel.text).is_equal("+0")
	assert_str(ResourceResearchStation.totalUpkeep.text).is_equal("Upkeep:\n0   ->   5")

	# Price, 175 potato, 175 scrap
	Global.upkeep = 0
	Global.robot_upkeep = 0
	ResourceResearchStation.growthLevel = 1
	ResourceResearchStation._update_to_new_button_values(ResourceResearchStation.growthLevel, ResourceResearchStation.growthUpkeep, ResourceResearchStation.growthUpkeepValues, ResourceResearchStation.growthUpkeepLabel, ResourceResearchStation.growthImprovements, ResourceResearchStation.growthImprovementLabel, ResourceResearchStation.growthCurrentUpkeep, ResourceResearchStation.growthCurrentUpkeepLabel, ResourceResearchStation.growthButton, ResourceResearchStation.growthResources)
	assert_str(ResourceResearchStation.growthPotatoPrice.text).is_equal("175")
	assert_str(ResourceResearchStation.growthScrapPrice.text).is_equal("175")
	assert_str(ResourceResearchStation.growthImprovementLabel.text).is_equal("3s   ->   1.5s")
	assert_str(ResourceResearchStation.growthUpkeepLabel.text).is_equal("Upkeep	    +25")
	assert_str(ResourceResearchStation.growthCurrentUpkeepLabel.text).is_equal("+5")
	assert_str(ResourceResearchStation.totalUpkeep.text).is_equal("Upkeep:\n0   ->   25")
	
	# Price, 1225 potato, 1225 scrap
	Global.upkeep = 0
	Global.robot_upkeep = 0
	ResourceResearchStation.growthLevel = 2
	ResourceResearchStation._update_to_new_button_values(ResourceResearchStation.growthLevel, ResourceResearchStation.growthUpkeep, ResourceResearchStation.growthUpkeepValues, ResourceResearchStation.growthUpkeepLabel, ResourceResearchStation.growthImprovements, ResourceResearchStation.growthImprovementLabel, ResourceResearchStation.growthCurrentUpkeep, ResourceResearchStation.growthCurrentUpkeepLabel, ResourceResearchStation.growthButton, ResourceResearchStation.growthResources)
	assert_str(ResourceResearchStation.growthPotatoPrice.text).is_equal("1225")
	assert_str(ResourceResearchStation.growthScrapPrice.text).is_equal("1225")
	assert_str(ResourceResearchStation.growthImprovementLabel.text).is_equal("1.5s   ->   0.75s")
	assert_str(ResourceResearchStation.growthUpkeepLabel.text).is_equal("Upkeep	    +250")
	assert_str(ResourceResearchStation.growthCurrentUpkeepLabel.text).is_equal("+30")
	assert_str(ResourceResearchStation.totalUpkeep.text).is_equal("Upkeep:\n0   ->   250")

	# Maxed out
	Global.upkeep = 0
	Global.robot_upkeep = 0
	ResourceResearchStation.growthLevel = 3
	ResourceResearchStation._update_to_new_button_values(ResourceResearchStation.growthLevel, ResourceResearchStation.growthUpkeep, ResourceResearchStation.growthUpkeepValues, ResourceResearchStation.growthUpkeepLabel, ResourceResearchStation.growthImprovements, ResourceResearchStation.growthImprovementLabel, ResourceResearchStation.growthCurrentUpkeep, ResourceResearchStation.growthCurrentUpkeepLabel, ResourceResearchStation.growthButton, ResourceResearchStation.growthResources)
	assert_bool(ResourceResearchStation.totalUpkeep.visible).is_false()
	assert_bool(ResourceResearchStation.growthUpkeepLabel.visible).is_false()
	assert_str(ResourceResearchStation.growthCurrentUpkeepLabel.text).is_equal("+280")
	assert_str(ResourceResearchStation.growthImprovementLabel.text).is_equal("0.75s")
	assert_str(ResourceResearchStation.growthButton.text).is_equal("Maxed out")
	assert_bool(ResourceResearchStation.growthButton.disabled).is_true()
	assert_bool(ResourceResearchStation.growthResources.visible).is_false()


func test_update_global_growth_values():
	Global.reset()
	
	Global.robot_upkeep = 0
	
	Global.upkeep = 0
	Global.potatoCount = 30
	Global.scrapCount = 30
	ResourceResearchStation.growthLevel = 0
	ResourceResearchStation._update_global_values(ResourceResearchStation.growthPrice, ResourceResearchStation.growthLevel, ResourceResearchStation.growthUpkeepValues, ResourceResearchStation.growthImprovementValues)
	assert_int(Global.potatoCount).is_equal(5)
	assert_int(Global.scrapCount).is_equal(5)
	assert_int(Global.upkeep).is_equal(5)

	Global.upkeep = 0
	Global.potatoCount = 225
	Global.scrapCount = 225
	ResourceResearchStation.growthLevel = 1
	ResourceResearchStation._update_global_values(ResourceResearchStation.growthPrice, ResourceResearchStation.growthLevel, ResourceResearchStation.growthUpkeepValues, ResourceResearchStation.growthImprovementValues)
	assert_int(Global.potatoCount).is_equal(50)
	assert_int(Global.scrapCount).is_equal(50)
	assert_int(Global.upkeep).is_equal(25)
	
	Global.upkeep = 0
	Global.potatoCount = 1725
	Global.scrapCount = 1725
	ResourceResearchStation.growthLevel = 2
	ResourceResearchStation._update_global_values(ResourceResearchStation.growthPrice, ResourceResearchStation.growthLevel, ResourceResearchStation.growthUpkeepValues, ResourceResearchStation.growthImprovementValues)
	assert_int(Global.potatoCount).is_equal(500)
	assert_int(Global.scrapCount).is_equal(500)
	assert_int(Global.upkeep).is_equal(250)
	
	
func test_growth_button_pressed():
	Global.reset()
	Global.upkeep = 0
	Global.robot_upkeep = 0
	Global.potatoTimer = 6
	
	ResourceResearchStation.growthLevel = 0
	ResourceResearchStation._on_growth_button_pressed()
	assert_int(ResourceResearchStation.growthLevel).is_equal(1)
	assert_int(Global.potatoTimer).is_equal(3)
	
	ResourceResearchStation.growthLevel = 1
	ResourceResearchStation._on_growth_button_pressed()
	assert_int(ResourceResearchStation.growthLevel).is_equal(2)
	assert_float(Global.potatoTimer).is_equal(1.5)
	
	ResourceResearchStation.growthLevel = 2
	ResourceResearchStation._on_growth_button_pressed()
	assert_int(ResourceResearchStation.growthLevel).is_equal(3)
	assert_float(Global.potatoTimer).is_equal(0.75)


func test_reset_growth_values():
	Global.reset()
	
	ResourceResearchStation.growthLevel = ResourceResearchStation.reset_feature(ResourceResearchStation.growthLevel, ResourceResearchStation.growthButton, ResourceResearchStation.growthResources, ResourceResearchStation.growthUpkeepLabel)
	
	assert_int(ResourceResearchStation.growthLevel).is_equal(0)
	assert_str(ResourceResearchStation.growthButton.text).is_equal("Research")
	assert_bool(ResourceResearchStation.growthButton.disabled).is_false()
	assert_bool(ResourceResearchStation.growthResources.visible).is_true()
	assert_bool(ResourceResearchStation.growthUpkeepLabel.visible).is_true()

