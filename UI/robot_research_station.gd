extends CanvasLayer

@onready var all_robots = get_tree().get_nodes_in_group("robots")

var greenStyleBox = load("res://UI/green_style_box_flat.tres")
var grayStyleBox = load("res://UI/gray_style_box_flat.tres")

@onready var potatoButton = $potatoSwitch/potatoButton
@onready var scrapButton = $scrapSwitch/scrapButton
@onready var potatoSection = $potato
@onready var scrapSection = $scrap

@onready var totalUpkeep = $totalUpkeep

@onready var planterCurrentUpkeep = $potato/BUY/robots/Planter/Name/currentUpkeep
@onready var planterSpeedButton = $potato/BUY/robots/Planter/Speed/label_and_build/planterSpeedButton
@onready var planterSpeedLevel1 = $potato/BUY/robots/Planter/Speed/label_and_build/box/level1
@onready var planterSpeedLevel2 = $potato/BUY/robots/Planter/Speed/label_and_build/box/level2
@onready var planterSpeedLevel3 = $potato/BUY/robots/Planter/Speed/label_and_build/box/level3
@onready var planterSpeedPotatoPrice = $potato/BUY/robots/Planter/Speed/price_and_upkeep/Price/potatoPrice
@onready var planterSpeedScrapPrice = $potato/BUY/robots/Planter/Speed/price_and_upkeep/Price/scrapPrice
@onready var planterSpeedImprovementLabel = $potato/BUY/robots/Planter/Speed/description/improvement
@onready var planterSpeedUpkeepLabel = $potato/BUY/robots/Planter/Speed/price_and_upkeep/upkeep/upkeepLabel
@onready var planterSpeedResources = $potato/BUY/robots/Planter/Speed/price_and_upkeep

@onready var planterProductivityButton = $potato/BUY/robots/Planter/Productivity/label_and_build/planterProductivityButton
@onready var planterProductivityLevel1 = $potato/BUY/robots/Planter/Productivity/label_and_build/box/level1
@onready var planterProductivityLevel2 = $potato/BUY/robots/Planter/Productivity/label_and_build/box/level2
@onready var planterProductivityLevel3 = $potato/BUY/robots/Planter/Productivity/label_and_build/box/level3
@onready var planterProductivityPotatoPrice = $potato/BUY/robots/Planter/Productivity/price_and_upkeep/Price/potatoPrice
@onready var planterProductivityScrapPrice = $potato/BUY/robots/Planter/Productivity/price_and_upkeep/Price/scrapPrice
@onready var planterProductivityImprovementLabel = $potato/BUY/robots/Planter/Productivity/description/improvement
@onready var planterProductivityUpkeepLabel = $potato/BUY/robots/Planter/Productivity/price_and_upkeep/upkeep/upkeepLabel
@onready var planterProductivityResources = $potato/BUY/robots/Planter/Productivity/price_and_upkeep

@onready var planterPowerButton = $potato/BUY/robots/Planter/Power_Efficiency/label_and_build/planterPowerButton
@onready var planterPowerLevel1 = $potato/BUY/robots/Planter/Power_Efficiency/label_and_build/box/level1
@onready var planterPowerLevel2 = $potato/BUY/robots/Planter/Power_Efficiency/label_and_build/box/level2
@onready var planterPowerLevel3 = $potato/BUY/robots/Planter/Power_Efficiency/label_and_build/box/level3
@onready var planterPowerPotatoPrice = $potato/BUY/robots/Planter/Power_Efficiency/price_and_upkeep/Price/potatoPrice
@onready var planterPowerScrapPrice = $potato/BUY/robots/Planter/Power_Efficiency/price_and_upkeep/Price/scrapPrice
@onready var planterPowerImprovementLabel = $potato/BUY/robots/Planter/Power_Efficiency/description/improvement
@onready var planterPowerUpkeepLabel = $potato/BUY/robots/Planter/Power_Efficiency/price_and_upkeep/upkeep/upkeepLabel
@onready var planterPowerResources = $potato/BUY/robots/Planter/Power_Efficiency/price_and_upkeep


@onready var harvesterCurrentUpkeep = $potato/BUY/robots/Harvester/Name/currentUpkeep
@onready var harvesterSpeedButton = $potato/BUY/robots/Harvester/Speed/label_and_build/harvesterSpeedButton
@onready var harvesterSpeedLevel1 = $potato/BUY/robots/Harvester/Speed/label_and_build/box/level1
@onready var harvesterSpeedLevel2 = $potato/BUY/robots/Harvester/Speed/label_and_build/box/level2
@onready var harvesterSpeedLevel3 = $potato/BUY/robots/Harvester/Speed/label_and_build/box/level3
@onready var harvesterSpeedPotatoPrice = $potato/BUY/robots/Harvester/Speed/price_and_upkeep/Price/potatoPrice
@onready var harvesterSpeedScrapPrice = $potato/BUY/robots/Harvester/Speed/price_and_upkeep/Price/scrapPrice
@onready var harvesterSpeedImprovementLabel = $potato/BUY/robots/Harvester/Speed/description/improvement
@onready var harvesterSpeedUpkeepLabel = $potato/BUY/robots/Harvester/Speed/price_and_upkeep/upkeep/upkeepLabel
@onready var harvesterSpeedResources = $potato/BUY/robots/Harvester/Speed/price_and_upkeep

@onready var harvesterProductivityButton = $potato/BUY/robots/Harvester/Productivity/label_and_build/harvesterProductivityButton
@onready var harvesterProductivityLevel1 = $potato/BUY/robots/Harvester/Productivity/label_and_build/box/level1
@onready var harvesterProductivityLevel2 = $potato/BUY/robots/Harvester/Productivity/label_and_build/box/level2
@onready var harvesterProductivityLevel3 = $potato/BUY/robots/Harvester/Productivity/label_and_build/box/level3
@onready var harvesterProductivityPotatoPrice = $potato/BUY/robots/Harvester/Productivity/price_and_upkeep/Price/potatoPrice
@onready var harvesterProductivityScrapPrice = $potato/BUY/robots/Harvester/Productivity/price_and_upkeep/Price/scrapPrice
@onready var harvesterProductivityImprovementLabel = $potato/BUY/robots/Harvester/Productivity/description/improvement
@onready var harvesterProductivityUpkeepLabel = $potato/BUY/robots/Harvester/Productivity/price_and_upkeep/upkeep/upkeepLabel
@onready var harvesterProductivityResources = $potato/BUY/robots/Harvester/Productivity/price_and_upkeep

@onready var harvesterPowerButton = $potato/BUY/robots/Harvester/Power_Efficiency/label_and_build/harvesterPowerButton
@onready var harvesterPowerLevel1 = $potato/BUY/robots/Harvester/Power_Efficiency/label_and_build/box/level1
@onready var harvesterPowerLevel2 = $potato/BUY/robots/Harvester/Power_Efficiency/label_and_build/box/level2
@onready var harvesterPowerLevel3 = $potato/BUY/robots/Harvester/Power_Efficiency/label_and_build/box/level3
@onready var harvesterPowerPotatoPrice = $potato/BUY/robots/Harvester/Power_Efficiency/price_and_upkeep/Price/potatoPrice
@onready var harvesterPowerScrapPrice = $potato/BUY/robots/Harvester/Power_Efficiency/price_and_upkeep/Price/scrapPrice
@onready var harvesterPowerImprovementLabel = $potato/BUY/robots/Harvester/Power_Efficiency/description/improvement
@onready var harvesterPowerUpkeepLabel = $potato/BUY/robots/Harvester/Power_Efficiency/price_and_upkeep/upkeep/upkeepLabel
@onready var harvesterPowerResources = $potato/BUY/robots/Harvester/Power_Efficiency/price_and_upkeep

@onready var collectorCurrentUpkeep = $potato/BUY/robots/Collector/Name/currentUpkeep
@onready var collectorSpeedButton = $potato/BUY/robots/Collector/Speed/label_and_build/collectorSpeedButton
@onready var collectorSpeedLevel1 = $potato/BUY/robots/Collector/Speed/label_and_build/box/level1
@onready var collectorSpeedLevel2 = $potato/BUY/robots/Collector/Speed/label_and_build/box/level2
@onready var collectorSpeedLevel3 = $potato/BUY/robots/Collector/Speed/label_and_build/box/level3
@onready var collectorSpeedPotatoPrice = $potato/BUY/robots/Collector/Speed/price_and_upkeep/Price/potatoPrice
@onready var collectorSpeedScrapPrice = $potato/BUY/robots/Collector/Speed/price_and_upkeep/Price/scrapPrice
@onready var collectorSpeedImprovementLabel = $potato/BUY/robots/Collector/Speed/description/improvement
@onready var collectorSpeedUpkeepLabel = $potato/BUY/robots/Collector/Speed/price_and_upkeep/upkeep/upkeepLabel
@onready var collectorSpeedResources = $potato/BUY/robots/Collector/Speed/price_and_upkeep

@onready var collectorRangeButton = $potato/BUY/robots/Collector/Range/label_and_build/collectorRangeButton
@onready var collectorRangeLevel1 = $potato/BUY/robots/Collector/Range/label_and_build/box/level1
@onready var collectorRangeLevel2 = $potato/BUY/robots/Collector/Range/label_and_build/box/level2
@onready var collectorRangeLevel3 = $potato/BUY/robots/Collector/Range/label_and_build/box/level3
@onready var collectorRangePotatoPrice = $potato/BUY/robots/Collector/Range/price_and_upkeep/Price/potatoPrice
@onready var collectorRangeScrapPrice = $potato/BUY/robots/Collector/Range/price_and_upkeep/Price/scrapPrice
@onready var collectorRangeImprovementLabel = $potato/BUY/robots/Collector/Range/description/improvement
@onready var collectorRangeUpkeepLabel = $potato/BUY/robots/Collector/Range/price_and_upkeep/upkeep/upkeepLabel
@onready var collectorRangeResources = $potato/BUY/robots/Collector/Range/price_and_upkeep

@onready var collectorPowerButton = $potato/BUY/robots/Collector/Power_Efficiency/label_and_build/collectorPowerButton
@onready var collectorPowerLevel1 = $potato/BUY/robots/Collector/Power_Efficiency/label_and_build/box/level1
@onready var collectorPowerLevel2 = $potato/BUY/robots/Collector/Power_Efficiency/label_and_build/box/level2
@onready var collectorPowerLevel3 = $potato/BUY/robots/Collector/Power_Efficiency/label_and_build/box/level3
@onready var collectorPowerPotatoPrice = $potato/BUY/robots/Collector/Power_Efficiency/price_and_upkeep/Price/potatoPrice
@onready var collectorPowerScrapPrice = $potato/BUY/robots/Collector/Power_Efficiency/price_and_upkeep/Price/scrapPrice
@onready var collectorPowerImprovementLabel = $potato/BUY/robots/Collector/Power_Efficiency/description/improvement
@onready var collectorPowerUpkeepLabel = $potato/BUY/robots/Collector/Power_Efficiency/price_and_upkeep/upkeep/upkeepLabel
@onready var collectorPowerResources = $potato/BUY/robots/Collector/Power_Efficiency/price_and_upkeep


@onready var scavengerCurrentUpkeep = $scrap/BUY/robots/Scavenger/Name/currentUpkeep
@onready var scavengerSpeedButton = $scrap/BUY/robots/Scavenger/Speed/label_and_build/scavengerSpeedButton
@onready var scavengerSpeedLevel1 = $scrap/BUY/robots/Scavenger/Speed/label_and_build/box/level1
@onready var scavengerSpeedLevel2 = $scrap/BUY/robots/Scavenger/Speed/label_and_build/box/level2
@onready var scavengerSpeedLevel3 = $scrap/BUY/robots/Scavenger/Speed/label_and_build/box/level3
@onready var scavengerSpeedPotatoPrice = $scrap/BUY/robots/Scavenger/Speed/price_and_upkeep/Price/potatoPrice
@onready var scavengerSpeedScrapPrice = $scrap/BUY/robots/Scavenger/Speed/price_and_upkeep/Price/scrapPrice
@onready var scavengerSpeedImprovementLabel = $scrap/BUY/robots/Scavenger/Speed/description/improvement
@onready var scavengerSpeedUpkeepLabel = $scrap/BUY/robots/Scavenger/Speed/price_and_upkeep/upkeep/upkeepLabel
@onready var scavengerSpeedResources = $scrap/BUY/robots/Scavenger/Speed/price_and_upkeep

@onready var scavengerCapacityButton = $scrap/BUY/robots/Scavenger/Capacity/label_and_build/scavengerCapacityButton
@onready var scavengerCapacityLevel1 = $scrap/BUY/robots/Scavenger/Capacity/label_and_build/box/level1
@onready var scavengerCapacityLevel2 = $scrap/BUY/robots/Scavenger/Capacity/label_and_build/box/level2
@onready var scavengerCapacityLevel3 = $scrap/BUY/robots/Scavenger/Capacity/label_and_build/box/level3
@onready var scavengerCapacityPotatoPrice = $scrap/BUY/robots/Scavenger/Capacity/price_and_upkeep/Price/potatoPrice
@onready var scavengerCapacityScrapPrice = $scrap/BUY/robots/Scavenger/Capacity/price_and_upkeep/Price/scrapPrice
@onready var scavengerCapacityImprovementLabel = $scrap/BUY/robots/Scavenger/Capacity/description/improvement
@onready var scavengerCapacityUpkeepLabel = $scrap/BUY/robots/Scavenger/Capacity/price_and_upkeep/upkeep/upkeepLabel
@onready var scavengerCapacityResources = $scrap/BUY/robots/Scavenger/Capacity/price_and_upkeep

@onready var scavengerPowerButton = $scrap/BUY/robots/Scavenger/Power_Efficiency/label_and_build/scavengerPowerButton
@onready var scavengerPowerLevel1 = $scrap/BUY/robots/Scavenger/Power_Efficiency/label_and_build/box/level1
@onready var scavengerPowerLevel2 = $scrap/BUY/robots/Scavenger/Power_Efficiency/label_and_build/box/level2
@onready var scavengerPowerLevel3 = $scrap/BUY/robots/Scavenger/Power_Efficiency/label_and_build/box/level3
@onready var scavengerPowerPotatoPrice = $scrap/BUY/robots/Scavenger/Power_Efficiency/price_and_upkeep/Price/potatoPrice
@onready var scavengerPowerScrapPrice = $scrap/BUY/robots/Scavenger/Power_Efficiency/price_and_upkeep/Price/scrapPrice
@onready var scavengerPowerImprovementLabel = $scrap/BUY/robots/Scavenger/Power_Efficiency/description/improvement
@onready var scavengerPowerUpkeepLabel = $scrap/BUY/robots/Scavenger/Power_Efficiency/price_and_upkeep/upkeep/upkeepLabel
@onready var scavengerPowerResources = $scrap/BUY/robots/Scavenger/Power_Efficiency/price_and_upkeep

var planterSpeedLevel = 0
var planterSpeedPrice = { 0 : {"potato" : 5,
							   "scrap"  : 5 },
						  1 : {"potato" : 25,
							   "scrap"  : 25 },
						  2 : {"potato" : 125,
							   "scrap"  : 125 }
						}
var planterSpeedImprovementPrompt = "Enhance robots mobility.    "
var planterSpeedImprovements = { 0 : "30   ->   40 m/s",
								 1 : "40   ->   50 m/s",
								 2 : "50   ->   60 m/s",
								 3 : "60 m/s"
							   }
var planterSpeedImprovementValues = { 0 : 30,
							   		  1 : 40,
							   		  2 : 50,
							   		  3 : 60	
									}
var planterSpeedUpkeep = { 0 : "Upkeep	    +1",
						   1 : "Upkeep	    +3",
						   2 : "Upkeep	    +9"
						 }
var planterSpeedUpkeepValues = { 0 : 1,
								 1 : 3, 
								 2 : 9
							   }

var planterProductivityLevel = 0
var planterProductivityPrice = { 0 : {"potato" : 10,
							   		  "scrap"  : 10 },
						  		 1 : {"potato" : 100,
							   		  "scrap"  : 100 },
						  		 2 : {"potato" : 500,
									  "scrap"  : 500 }
							   }
var planterProductivityImprovementPrompt = "Reduce potato planting time.    "
var planterProductivityImprovements = { 0 : "5   ->   2.5 s",
								 		1 : "2.5   ->   1.25 s",
								 		2 : "1.25   ->   0.625 s",
								 		3 : "0.625 s"
							   		  }
var planterProductivityImprovementValues = { 0 : 5,
							   		  		 1 : 2.5,
							   		  		 2 : 1.25,
							   		  		 3 : 0.625
										   }
var planterProductivityUpkeep = { 0 : "Upkeep	    +3",
						   		  1 : "Upkeep	    +9",
								  2 : "Upkeep	    +27"
								}
var planterProductivityUpkeepValues = { 0 : 3,
										1 : 9, 
										2 : 27
									  }
									
var planterPowerLevel = 0
var planterPowerPrice = { 0 : {"potato" : 30,
							   "scrap"  : 30 },
						  1 : {"potato" : 200,
							   "scrap"  : 200 },
						  2 : {"potato" : 600,
							   "scrap"  : 600 }
						}
var planterPowerImprovementPrompt = "Optimize power usage. Reduce upkeep by up to "
var planterPowerImprovements = { 0 : "3 per robot",
								 1 : "5 per robot",
								 2 : "9 per robot",
								 3 : "Up to -17 per robot"
							   }
var planterPowerUpkeep = { 0 : "Upkeep	    -3",
						   1 : "Upkeep	    -5",
						   2 : "Upkeep	    -9"
						 }
var planterPowerUpkeepValues = { 0 : -3,
								 1 : -5, 
								 2 : -9
							   }




var harvesterSpeedLevel = 0
var harvesterSpeedPrice = { 0 : {"potato" : 5,
							   "scrap"  : 5 },
						  1 : {"potato" : 25,
							   "scrap"  : 25 },
						  2 : {"potato" : 125,
							   "scrap"  : 125 }
						}
var harvesterSpeedImprovementPrompt = "Enhance robots mobility.    "
var harvesterSpeedImprovements = { 0 : "20   ->   30 m/s",
								 1 : "30   ->   40 m/s",
								 2 : "40   ->   50 m/s",
								 3 : "50 m/s"
							   }
var harvesterSpeedImprovementValues = { 0 : 20,
							   		  1 : 30,
							   		  2 : 40,
							   		  3 : 50	
									}
var harvesterSpeedUpkeep = { 0 : "Upkeep	    +1",
						   1 : "Upkeep	    +3",
						   2 : "Upkeep	    +9"
						 }
var harvesterSpeedUpkeepValues = { 0 : 1,
								 1 : 3, 
								 2 : 9
							   }

var harvesterProductivityLevel = 0
var harvesterProductivityPrice = { 0 : {"potato" : 10,
							   		  "scrap"  : 10 },
						  		 1 : {"potato" : 160,
							   		  "scrap"  : 160 },
						  		 2 : {"potato" : 700,
									  "scrap"  : 700 }
							   }
var harvesterProductivityImprovementPrompt = "Reduce potato harvesting time.    "
var harvesterProductivityImprovements = { 0 : "2.5   ->   1.25 s",
								 		1 : "1.25   ->   0.625 s",
								 		2 : "0.625   ->   0.3125 s",
								 		3 : "0.3125 s"
							   		  }
var harvesterProductivityImprovementValues = { 0 : 2.5,
							   		  		 1 : 1.25,
							   		  		 2 : 0.625,
							   		  		 3 : 0.3125
										   }
var harvesterProductivityUpkeep = { 0 : "Upkeep	    +3",
						   		  1 : "Upkeep	    +9",
								  2 : "Upkeep	    +27"
								}
var harvesterProductivityUpkeepValues = { 0 : 3,
										1 : 9, 
										2 : 27
									  }
									
var harvesterPowerLevel = 0
var harvesterPowerPrice = { 0 : {"potato" : 30,
							   "scrap"  : 30 },
						  1 : {"potato" : 250,
							   "scrap"  : 250 },
						  2 : {"potato" : 600,
							   "scrap"  : 600 }
						}
var harvesterPowerImprovementPrompt = "Optimize power usage. Reduce upkeep by up to "
var harvesterPowerImprovements = { 0 : "3 per robot",
								 1 : "5 per robot",
								 2 : "9 per robot",
								 3 : "Up to -17 per robot"
							   }
var harvesterPowerUpkeep = { 0 : "Upkeep	    -3",
						   1 : "Upkeep	    -5",
						   2 : "Upkeep	    -9"
						 }
var harvesterPowerUpkeepValues = { 0 : -3,
								 1 : -5, 
								 2 : -9
							   }





var collectorSpeedLevel = 0
var collectorSpeedPrice = { 0 : {"potato" : 5,
							   "scrap"  : 5 },
						  1 : {"potato" : 25,
							   "scrap"  : 25 },
						  2 : {"potato" : 125,
							   "scrap"  : 125 }
						}
var collectorSpeedImprovementPrompt = "Enhance robots mobility.    "
var collectorSpeedImprovements = { 0 : "10   ->   20 m/s",
								 1 : "20   ->   30 m/s",
								 2 : "30   ->   40 m/s",
								 3 : "40 m/s"
							   }
var collectorSpeedImprovementValues = { 0 : 10,
							   		  1 : 20,
							   		  2 : 30,
							   		  3 : 40	
									}
var collectorSpeedUpkeep = { 0 : "Upkeep	    +1",
						   1 : "Upkeep	    +3",
						   2 : "Upkeep	    +9"
						 }
var collectorSpeedUpkeepValues = { 0 : 1,
								 1 : 3, 
								 2 : 9
							   }

var collectorRangeLevel = 0
var collectorRangePrice = { 0 : {"potato" : 40,
							   		  "scrap"  : 40 },
						  		 1 : {"potato" : 200,
							   		  "scrap"  : 200 },
						  		 2 : {"potato" : 500,
									  "scrap"  : 500 }
							   }
var collectorRangeImprovementPrompt = "Increase collecting radius.    "
var collectorRangeImprovements = { 0 : "1m",
								 		1 : "2m",
								 		2 : "3m",
								 		3 : "4m"
							   		  }
var collectorRangeImprovementValues = { 0 : 1,
							   		  		 1 : 2,
							   		  		 2 : 3,
							   		  		 3 : 4
										   }
var collectorRangeUpkeep = { 0 : "Upkeep	    +4",
						   		  1 : "Upkeep	    +16",
								  2 : "Upkeep	    +64"
								}
var collectorRangeUpkeepValues = { 0 : 4,
										1 : 16, 
										2 : 64
									  }
									
var collectorPowerLevel = 0
var collectorPowerPrice = { 0 : {"potato" : 60,
							   "scrap"  : 60 },
						  1 : {"potato" : 250,
							   "scrap"  : 250 },
						  2 : {"potato" : 600,
							   "scrap"  : 600 }
						}
var collectorPowerImprovementPrompt = "Optimize power usage. Reduce upkeep by up to "
var collectorPowerImprovements = { 0 : "3 per robot",
								 1 : "5 per robot",
								 2 : "9 per robot",
								 3 : "Up to -17 per robot"
							   }
var collectorPowerUpkeep = { 0 : "Upkeep	    -3",
						   1 : "Upkeep	    -5",
						   2 : "Upkeep	    -9"
						 }
var collectorPowerUpkeepValues = { 0 : -3,
								 1 : -5, 
								 2 : -9
							   }




var scavengerSpeedLevel = 0
var scavengerSpeedPrice = { 0 : {"potato" : 5,
							   "scrap"  : 5 },
						  1 : {"potato" : 25,
							   "scrap"  : 25 },
						  2 : {"potato" : 125,
							   "scrap"  : 125 }
						}
var scavengerSpeedImprovementPrompt = "Enhance robots mobility.    "
var scavengerSpeedImprovements = { 0 : "50   ->   60 m/s",
								 1 : "60   ->   70 m/s",
								 2 : "70   ->   80 m/s",
								 3 : "80 m/s"
							   }
var scavengerSpeedImprovementValues = { 0 : 50,
							   		  1 : 60,
							   		  2 : 70,
							   		  3 : 80	
									}
var scavengerSpeedUpkeep = { 0 : "Upkeep	    +1",
						   1 : "Upkeep	    +3",
						   2 : "Upkeep	    +9"
						 }
var scavengerSpeedUpkeepValues = { 0 : 1,
								 1 : 3, 
								 2 : 9
							   }

var scavengerCapacityLevel = 0
var scavengerCapacityPrice = { 0 : {"potato" : 10,
							   		  "scrap"  : 10 },
						  		 1 : {"potato" : 160,
							   		  "scrap"  : 160 },
						  		 2 : {"potato" : 750,
									  "scrap"  : 750 }
							   }
var scavengerCapacityImprovementPrompt = "Increase carrying capacity.    "
var scavengerCapacityImprovements = { 0 : "2   ->   4",
								 		1 : "4   ->   8",
								 		2 : "8   ->   16",
								 		3 : "16"
							   		  }
var scavengerCapacityImprovementValues = { 0 : 2,
							   		  		 1 : 4,
							   		  		 2 : 8,
							   		  		 3 : 16
										   }
var scavengerCapacityUpkeep = { 0 : "Upkeep	    +3",
						   		  1 : "Upkeep	    +9",
								  2 : "Upkeep	    +27"
								}
var scavengerCapacityUpkeepValues = { 0 : 3,
										1 : 9, 
										2 : 27
									  }
									
var scavengerPowerLevel = 0
var scavengerPowerPrice = { 0 : {"potato" : 30,
							   "scrap"  : 30 },
						  1 : {"potato" : 250,
							   "scrap"  : 250 },
						  2 : {"potato" : 600,
							   "scrap"  : 600 }
						}
var scavengerPowerImprovementPrompt = "Optimize power usage. Reduce upkeep by up to "
var scavengerPowerImprovements = { 0 : "3 per robot",
								 1 : "5 per robot",
								 2 : "9 per robot",
								 3 : "Up to -17 per robot"
							   }
var scavengerPowerUpkeep = { 0 : "Upkeep	    -3",
						   1 : "Upkeep	    -5",
						   2 : "Upkeep	    -9"
						 }
var scavengerPowerUpkeepValues = { 0 : -3,
								 1 : -5, 
								 2 : -9
							   }


func _ready():
	close_shop()
	await get_tree().get_root().ready
	
func open_shop():
	visible = true
	_update()
	if potatoSection.visible:
		potatoButton.grab_focus()
	if scrapSection.visible:
		scrapButton.grab_focus()
	RobotShop.close_shop()
	ResourceResearchStation.close_shop()
	
func close_shop():
	visible = false

func _on_close_button_pressed():
	close_shop()
	Global.menu_active = false
	
	
	
func _check_if_enough(level, prices, button):
	if level < 3:
		if Global.potatoCount >= prices[level]["potato"] and Global.scrapCount >= prices[level]["scrap"]:
			button.disabled = false
		else:
			button.disabled = true	
	
func _process(delta):
	if all_robots == []:
		all_robots = get_tree().get_nodes_in_group("robots")
		recalibrate_robot_upkeep()
		
	if visible:
		_check_if_enough(planterSpeedLevel, planterSpeedPrice, planterSpeedButton)
		_check_if_enough(planterProductivityLevel, planterProductivityPrice, planterProductivityButton)
		_check_if_enough(planterPowerLevel, planterPowerPrice, planterPowerButton)
		
		_check_if_enough(harvesterSpeedLevel, harvesterSpeedPrice, harvesterSpeedButton)
		_check_if_enough(harvesterProductivityLevel, harvesterProductivityPrice, harvesterProductivityButton)
		_check_if_enough(harvesterPowerLevel, harvesterPowerPrice, harvesterPowerButton)
		
		_check_if_enough(collectorSpeedLevel, collectorSpeedPrice, collectorSpeedButton)
		_check_if_enough(collectorRangeLevel, collectorRangePrice, collectorRangeButton)
		_check_if_enough(collectorPowerLevel, collectorPowerPrice, collectorPowerButton)
		
		_check_if_enough(scavengerSpeedLevel, scavengerSpeedPrice, scavengerSpeedButton)
		_check_if_enough(scavengerCapacityLevel, scavengerCapacityPrice, scavengerCapacityButton)
		_check_if_enough(scavengerPowerLevel, scavengerPowerPrice, scavengerPowerButton)
		

func _update_values(prices, level, potatoPrice, scrapPrice, improvementPrompt, impovementLabel, improvement, upkeepLabel, upkeep):
	if level < 3:
		potatoPrice.text = str(prices[level]["potato"])
		scrapPrice.text = str(prices[level]["scrap"])
		impovementLabel.text = improvementPrompt + improvement[level]
		upkeepLabel.text = upkeep[level]
		

func _update():
	_update_values(planterSpeedPrice, planterSpeedLevel, planterSpeedPotatoPrice, planterSpeedScrapPrice, planterSpeedImprovementPrompt, planterSpeedImprovementLabel, planterSpeedImprovements, planterSpeedUpkeepLabel, planterSpeedUpkeep)
	_update_values(planterProductivityPrice, planterProductivityLevel, planterProductivityPotatoPrice, planterProductivityScrapPrice, planterProductivityImprovementPrompt, planterProductivityImprovementLabel, planterProductivityImprovements, planterProductivityUpkeepLabel, planterProductivityUpkeep)
	_update_values(planterPowerPrice, planterPowerLevel, planterPowerPotatoPrice, planterPowerScrapPrice, planterPowerImprovementPrompt, planterPowerImprovementLabel, planterPowerImprovements, planterPowerUpkeepLabel, planterPowerUpkeep)
	
	_update_values(harvesterSpeedPrice, harvesterSpeedLevel, harvesterSpeedPotatoPrice, harvesterSpeedScrapPrice, harvesterSpeedImprovementPrompt, harvesterSpeedImprovementLabel, harvesterSpeedImprovements, harvesterSpeedUpkeepLabel, harvesterSpeedUpkeep)
	_update_values(harvesterProductivityPrice, harvesterProductivityLevel, harvesterProductivityPotatoPrice, harvesterProductivityScrapPrice, harvesterProductivityImprovementPrompt, harvesterProductivityImprovementLabel, harvesterProductivityImprovements, harvesterProductivityUpkeepLabel, harvesterProductivityUpkeep)
	_update_values(harvesterPowerPrice, harvesterPowerLevel, harvesterPowerPotatoPrice, harvesterPowerScrapPrice, harvesterPowerImprovementPrompt, harvesterPowerImprovementLabel, harvesterPowerImprovements, harvesterPowerUpkeepLabel, harvesterPowerUpkeep)

	_update_values(collectorSpeedPrice, collectorSpeedLevel, collectorSpeedPotatoPrice, collectorSpeedScrapPrice, collectorSpeedImprovementPrompt, collectorSpeedImprovementLabel, collectorSpeedImprovements, collectorSpeedUpkeepLabel, collectorSpeedUpkeep)
	_update_values(collectorRangePrice, collectorRangeLevel, collectorRangePotatoPrice, collectorRangeScrapPrice, collectorRangeImprovementPrompt, collectorRangeImprovementLabel, collectorRangeImprovements, collectorRangeUpkeepLabel, collectorRangeUpkeep)
	_update_values(collectorPowerPrice, collectorPowerLevel, collectorPowerPotatoPrice, collectorPowerScrapPrice, collectorPowerImprovementPrompt, collectorPowerImprovementLabel, collectorPowerImprovements, collectorPowerUpkeepLabel, collectorPowerUpkeep)

	_update_values(scavengerSpeedPrice, scavengerSpeedLevel, scavengerSpeedPotatoPrice, scavengerSpeedScrapPrice, scavengerSpeedImprovementPrompt, scavengerSpeedImprovementLabel, scavengerSpeedImprovements, scavengerSpeedUpkeepLabel, scavengerSpeedUpkeep)
	_update_values(scavengerCapacityPrice, scavengerCapacityLevel, scavengerCapacityPotatoPrice, scavengerCapacityScrapPrice, scavengerCapacityImprovementPrompt, scavengerCapacityImprovementLabel, scavengerCapacityImprovements, scavengerCapacityUpkeepLabel, scavengerCapacityUpkeep)
	_update_values(scavengerPowerPrice, scavengerPowerLevel, scavengerPowerPotatoPrice, scavengerPowerScrapPrice, scavengerPowerImprovementPrompt, scavengerPowerImprovementLabel, scavengerPowerImprovements, scavengerPowerUpkeepLabel, scavengerPowerUpkeep)


func _update_global_values(prices, level):
	Global.potatoCount -= prices[level]["potato"]
	Global.scrapCount -= prices[level]["scrap"]
	recalibrate_robot_upkeep()
	level += 1
	return level

func _update_to_new_button_values(robots, level, upkeep, upkeepValues, upkeepLabel, improvements, improvementLabel, button, resources, levelBox):

	if level < 3:
		_update()
		_refresh_upkeep(robots, upkeepValues, level)
	else:
		totalUpkeep.visible = false
		upkeepLabel.visible = false
		improvementLabel.text = improvements[level]
		button.text = "Maxed out"
		button.disabled = true
		resources.visible = false
	
	levelBox.add_theme_stylebox_override("normal", greenStyleBox)

func _refresh_upkeep(robots, upkeepValues, level):
	var no_change = false
	var upkeep = Global.upkeep + Global.robot_upkeep
	for robot in robots:
		if robot.upkeep <= 0 and upkeepValues[level] < 0:
			no_change = true
			break
		elif robot.upkeep <= 0 and (robot.upkeep + upkeepValues[level]) <= 0:
			no_change = true
			break
		elif robot.upkeep < 0:
			upkeep += robot.upkeep + upkeepValues[level]
		elif (robot.upkeep + upkeepValues[level]) < 0:
			upkeep -= robot.upkeep
		else:
			upkeep += upkeepValues[level]
	
	if not no_change and upkeep <= 0:
		upkeep = Global.upkeep + Global.robot_upkeep
	
	
	totalUpkeep.text = "Upkeep:\n" + str(Global.upkeep + Global.robot_upkeep) + "   ->   " + str(upkeep)
	
func _refresh_upkeep_button(robots, button, upkeepValues, level):
	if not button.disabled:
		totalUpkeep.global_position = button.global_position + button.size + Vector2(10, -50)
		_refresh_upkeep(robots, upkeepValues, level)
		totalUpkeep.visible = true

func recalibrate_robot_upkeep():
	all_robots = get_tree().get_nodes_in_group("robots")
	Global.robot_upkeep = 0
	for robot in all_robots:
		var upkeep = 0 if robot.upkeep < 0 else robot.upkeep
		Global.robot_upkeep += upkeep
	update_current_upkeep_label()

func update_current_upkeep_label():
	planterCurrentUpkeep.text = "+0 (" + str(Global.planterUpkeep) + ")" if Global.planterUpkeep < 0 else "+" + str(Global.planterUpkeep)
	harvesterCurrentUpkeep.text = "+0 (" + str(Global.harvesterUpkeep) + ")" if Global.harvesterUpkeep < 0 else "+" + str(Global.harvesterUpkeep)
	collectorCurrentUpkeep.text = "+0 (" + str(Global.collectorUpkeep) + ")" if Global.collectorUpkeep < 0 else "+" + str(Global.collectorUpkeep)
	scavengerCurrentUpkeep.text = "+0 (" + str(Global.scavengerUpkeep) + ")" if Global.scavengerUpkeep < 0 else "+" + str(Global.scavengerUpkeep)
	
func update_robot_upkeep(robots, upkeepValues, level):
	var upkeep = upkeepValues[level]
	for robot in robots:
		robot.upkeep += upkeep
	return upkeep
	
func update_robot_speed(robots, improvementValues, level):
	var speed = improvementValues[level]
	for robot in robots:
		robot.speed = speed
	return speed

func update_robot_productivity(improvementValues, level):
	var productivity = improvementValues[level]
	return productivity

func update_robot_capacity(robots, improvementValues, level):
	var capacity = improvementValues[level]
	for robot in robots:
		robot.capacity = capacity
	return capacity
	
func update_robot_range(robots, improvementValues, level):
	var range = improvementValues[level]
	for robot in robots:
		robot.range = range
	return range

func list_of_robot_type(type):
	all_robots = get_tree().get_nodes_in_group("robots")
	var robots = []
	for robot in all_robots:
		if is_instance_of(robot, type):
			robots.append(robot)
	return robots

func _on_planter_speed_button_pressed():
	var planters = list_of_robot_type(planter_robot)
	Global.planterUpkeep += update_robot_upkeep(planters, planterSpeedUpkeepValues, planterSpeedLevel)
	planterSpeedLevel = _update_global_values(planterSpeedPrice, planterSpeedLevel)
	Global.planterSpeed = update_robot_speed(planters, planterSpeedImprovementValues, planterSpeedLevel)
	
	var levelBox
	if planterSpeedLevel == 1:
		levelBox = planterSpeedLevel1
	elif planterSpeedLevel == 2:
		levelBox = planterSpeedLevel2
	elif planterSpeedLevel == 3:
		levelBox = planterSpeedLevel3
		
	_update_to_new_button_values(planters, planterSpeedLevel, planterSpeedUpkeep, planterSpeedUpkeepValues, planterSpeedUpkeepLabel, planterSpeedImprovements, planterSpeedImprovementLabel, planterSpeedButton, planterSpeedResources, levelBox)

func _on_planter_speed_button_mouse_entered():
	var planters = list_of_robot_type(planter_robot)
	_refresh_upkeep_button(planters, planterSpeedButton, planterSpeedUpkeepValues, planterSpeedLevel)

func _on_planter_speed_button_mouse_exited():
	totalUpkeep.visible = false


func _on_planter_productivity_button_pressed():
	var planters = list_of_robot_type(planter_robot)
	Global.planterUpkeep += update_robot_upkeep(planters, planterProductivityUpkeepValues, planterProductivityLevel)
	planterProductivityLevel = _update_global_values(planterProductivityPrice, planterProductivityLevel)
	Global.planterProductivity = update_robot_productivity(planterProductivityImprovementValues, planterProductivityLevel)
	
	var levelBox
	if planterProductivityLevel == 1:
		levelBox = planterProductivityLevel1
	elif planterProductivityLevel == 2:
		levelBox = planterProductivityLevel2
	elif planterProductivityLevel == 3:
		levelBox = planterProductivityLevel3
		
	_update_to_new_button_values(planters, planterProductivityLevel, planterProductivityUpkeep, planterProductivityUpkeepValues, planterProductivityUpkeepLabel, planterProductivityImprovements, planterProductivityImprovementLabel, planterProductivityButton, planterProductivityResources, levelBox)


func _on_planter_productivity_button_mouse_entered():
	var planters = list_of_robot_type(planter_robot)
	_refresh_upkeep_button(planters, planterProductivityButton, planterProductivityUpkeepValues, planterProductivityLevel)

func _on_planter_productivity_button_mouse_exited():
	totalUpkeep.visible = false


func _on_planter_power_button_pressed():
	var planters = list_of_robot_type(planter_robot)
	Global.planterUpkeep += update_robot_upkeep(planters, planterPowerUpkeepValues, planterPowerLevel)
	planterPowerLevel = _update_global_values(planterPowerPrice, planterPowerLevel)
	
	var levelBox
	if planterPowerLevel == 1:
		levelBox = planterPowerLevel1
	elif planterPowerLevel == 2:
		levelBox = planterPowerLevel2
	elif planterPowerLevel == 3:
		levelBox = planterPowerLevel3
		
	_update_to_new_button_values(planters, planterPowerLevel, planterPowerUpkeep, planterPowerUpkeepValues, planterPowerUpkeepLabel, planterPowerImprovements, planterPowerImprovementLabel, planterPowerButton, planterPowerResources, levelBox)

func _on_planter_power_button_mouse_entered():
	var planters = list_of_robot_type(planter_robot)
	_refresh_upkeep_button(planters, planterPowerButton, planterPowerUpkeepValues, planterPowerLevel)

func _on_planter_power_button_mouse_exited():
	totalUpkeep.visible = false


func _on_harvester_speed_button_pressed():
	var harvesters = list_of_robot_type(harvester_robot)
	Global.harvesterUpkeep += update_robot_upkeep(harvesters, harvesterSpeedUpkeepValues, harvesterSpeedLevel)
	harvesterSpeedLevel = _update_global_values(harvesterSpeedPrice, harvesterSpeedLevel)
	Global.harvesterSpeed = update_robot_speed(harvesters, harvesterSpeedImprovementValues, harvesterSpeedLevel)
	
	var levelBox
	if harvesterSpeedLevel == 1:
		levelBox = harvesterSpeedLevel1
	elif harvesterSpeedLevel == 2:
		levelBox = harvesterSpeedLevel2
	elif harvesterSpeedLevel == 3:
		levelBox = harvesterSpeedLevel3
		
	_update_to_new_button_values(harvesters, harvesterSpeedLevel, harvesterSpeedUpkeep, harvesterSpeedUpkeepValues, harvesterSpeedUpkeepLabel, harvesterSpeedImprovements, harvesterSpeedImprovementLabel, harvesterSpeedButton, harvesterSpeedResources, levelBox)


func _on_harvester_speed_button_mouse_entered():
	var harvesters = list_of_robot_type(harvester_robot)
	_refresh_upkeep_button(harvesters, harvesterSpeedButton, harvesterSpeedUpkeepValues, harvesterSpeedLevel)


func _on_harvester_speed_button_mouse_exited():
	totalUpkeep.visible = false


func _on_harvester_productivity_button_pressed():
	var harvesters = list_of_robot_type(harvester_robot)
	Global.harvesterUpkeep += update_robot_upkeep(harvesters, harvesterProductivityUpkeepValues, harvesterProductivityLevel)
	harvesterProductivityLevel = _update_global_values(harvesterProductivityPrice, harvesterProductivityLevel)
	Global.harvesterProductivity = update_robot_productivity(harvesterProductivityImprovementValues, harvesterProductivityLevel)
	
	var levelBox
	if harvesterProductivityLevel == 1:
		levelBox = harvesterProductivityLevel1
	elif harvesterProductivityLevel == 2:
		levelBox = harvesterProductivityLevel2
	elif harvesterProductivityLevel == 3:
		levelBox = harvesterProductivityLevel3
		
	_update_to_new_button_values(harvesters, harvesterProductivityLevel, harvesterProductivityUpkeep, harvesterProductivityUpkeepValues, harvesterProductivityUpkeepLabel, harvesterProductivityImprovements, harvesterProductivityImprovementLabel, harvesterProductivityButton, harvesterProductivityResources, levelBox)



func _on_harvester_productivity_button_mouse_entered():
	var harvesters = list_of_robot_type(harvester_robot)
	_refresh_upkeep_button(harvesters, harvesterProductivityButton, harvesterProductivityUpkeepValues, harvesterProductivityLevel)


func _on_harvester_productivity_button_mouse_exited():
	totalUpkeep.visible = false


func _on_harvester_power_button_pressed():
	var harvesters = list_of_robot_type(harvester_robot)
	Global.harvesterUpkeep += update_robot_upkeep(harvesters, harvesterPowerUpkeepValues, harvesterPowerLevel)
	harvesterPowerLevel = _update_global_values(harvesterPowerPrice, harvesterPowerLevel)
	
	var levelBox
	if harvesterPowerLevel == 1:
		levelBox = harvesterPowerLevel1
	elif harvesterPowerLevel == 2:
		levelBox = harvesterPowerLevel2
	elif harvesterPowerLevel == 3:
		levelBox = harvesterPowerLevel3
		
	_update_to_new_button_values(harvesters, harvesterPowerLevel, harvesterPowerUpkeep, harvesterPowerUpkeepValues, harvesterPowerUpkeepLabel, harvesterPowerImprovements, harvesterPowerImprovementLabel, harvesterPowerButton, harvesterPowerResources, levelBox)


func _on_harvester_power_button_mouse_entered():
	var harvesters = list_of_robot_type(harvester_robot)
	_refresh_upkeep_button(harvesters, harvesterPowerButton, harvesterPowerUpkeepValues, harvesterPowerLevel)


func _on_harvester_power_button_mouse_exited():
	totalUpkeep.visible = false



func _on_collector_speed_button_pressed():
	var collectors = list_of_robot_type(collector_robot)
	Global.collectorUpkeep += update_robot_upkeep(collectors, collectorSpeedUpkeepValues, collectorSpeedLevel)
	collectorSpeedLevel = _update_global_values(collectorSpeedPrice, collectorSpeedLevel)
	Global.collectorSpeed = update_robot_speed(collectors, collectorSpeedImprovementValues, collectorSpeedLevel)
	
	var levelBox
	if collectorSpeedLevel == 1:
		levelBox = collectorSpeedLevel1
	elif collectorSpeedLevel == 2:
		levelBox = collectorSpeedLevel2
	elif collectorSpeedLevel == 3:
		levelBox = collectorSpeedLevel3
		
	_update_to_new_button_values(collectors, collectorSpeedLevel, collectorSpeedUpkeep, collectorSpeedUpkeepValues, collectorSpeedUpkeepLabel, collectorSpeedImprovements, collectorSpeedImprovementLabel, collectorSpeedButton, collectorSpeedResources, levelBox)


func _on_collector_speed_button_mouse_entered():
	var collectors = list_of_robot_type(collector_robot)
	_refresh_upkeep_button(collectors, collectorSpeedButton, collectorSpeedUpkeepValues, collectorSpeedLevel)


func _on_collector_speed_button_mouse_exited():
	totalUpkeep.visible = false
	

func _on_collector_range_button_pressed():
	var collectors = list_of_robot_type(collector_robot)
	Global.collectorUpkeep += update_robot_upkeep(collectors, collectorRangeUpkeepValues, collectorRangeLevel)
	collectorRangeLevel = _update_global_values(collectorRangePrice, collectorRangeLevel)
	Global.collectorRange = update_robot_range(collectors, collectorRangeImprovementValues, collectorRangeLevel)
	
	var levelBox
	if collectorRangeLevel == 1:
		levelBox = collectorRangeLevel1
	elif collectorRangeLevel == 2:
		levelBox = collectorRangeLevel2
	elif collectorRangeLevel == 3:
		levelBox = collectorRangeLevel3
		
	_update_to_new_button_values(collectors, collectorRangeLevel, collectorRangeUpkeep, collectorRangeUpkeepValues, collectorRangeUpkeepLabel, collectorRangeImprovements, collectorRangeImprovementLabel, collectorRangeButton, collectorRangeResources, levelBox)


func _on_collector_range_button_mouse_entered():
	var collectors = list_of_robot_type(collector_robot)
	_refresh_upkeep_button(collectors, collectorRangeButton, collectorRangeUpkeepValues, collectorRangeLevel)

func _on_collector_range_button_mouse_exited():
	totalUpkeep.visible = false


func _on_collector_power_button_pressed():
	var collectors = list_of_robot_type(collector_robot)
	Global.collectorUpkeep += update_robot_upkeep(collectors, collectorPowerUpkeepValues, collectorPowerLevel)
	collectorPowerLevel = _update_global_values(collectorPowerPrice, collectorPowerLevel)
	
	var levelBox
	if collectorPowerLevel == 1:
		levelBox = collectorPowerLevel1
	elif collectorPowerLevel == 2:
		levelBox = collectorPowerLevel2
	elif collectorPowerLevel == 3:
		levelBox = collectorPowerLevel3
		
	_update_to_new_button_values(collectors, collectorPowerLevel, collectorPowerUpkeep, collectorPowerUpkeepValues, collectorPowerUpkeepLabel, collectorPowerImprovements, collectorPowerImprovementLabel, collectorPowerButton, collectorPowerResources, levelBox)


func _on_collector_power_button_mouse_entered():
	var collectors = list_of_robot_type(collector_robot)
	_refresh_upkeep_button(collectors, collectorPowerButton, collectorPowerUpkeepValues, collectorPowerLevel)


func _on_collector_power_button_mouse_exited():
	totalUpkeep.visible = false




func _on_scavenger_speed_button_pressed():
	var scavengers = list_of_robot_type(scavenger_robot)
	Global.scavengerUpkeep += update_robot_upkeep(scavengers, scavengerSpeedUpkeepValues, scavengerSpeedLevel)
	scavengerSpeedLevel = _update_global_values(scavengerSpeedPrice, scavengerSpeedLevel)
	Global.scavengerSpeed = update_robot_speed(scavengers, scavengerSpeedImprovementValues, scavengerSpeedLevel)
	
	var levelBox
	if scavengerSpeedLevel == 1:
		levelBox = scavengerSpeedLevel1
	elif scavengerSpeedLevel == 2:
		levelBox = scavengerSpeedLevel2
	elif scavengerSpeedLevel == 3:
		levelBox = scavengerSpeedLevel3
		
	_update_to_new_button_values(scavengers, scavengerSpeedLevel, scavengerSpeedUpkeep, scavengerSpeedUpkeepValues, scavengerSpeedUpkeepLabel, scavengerSpeedImprovements, scavengerSpeedImprovementLabel, scavengerSpeedButton, scavengerSpeedResources, levelBox)


func _on_scavenger_speed_button_mouse_entered():
	var scavengers = list_of_robot_type(scavenger_robot)
	_refresh_upkeep_button(scavengers, scavengerSpeedButton, scavengerSpeedUpkeepValues, scavengerSpeedLevel)


func _on_scavenger_speed_button_mouse_exited():
	totalUpkeep.visible = false
	

func _on_scavenger_capacity_button_pressed():
	var scavengers = list_of_robot_type(scavenger_robot)
	Global.scavengerUpkeep += update_robot_upkeep(scavengers, scavengerCapacityUpkeepValues, scavengerCapacityLevel)
	scavengerCapacityLevel = _update_global_values(scavengerCapacityPrice, scavengerCapacityLevel)
	Global.scavengerCapacity = update_robot_capacity(scavengers, scavengerCapacityImprovementValues, scavengerCapacityLevel)
	
	var levelBox
	if scavengerCapacityLevel == 1:
		levelBox = scavengerCapacityLevel1
	elif scavengerCapacityLevel == 2:
		levelBox = scavengerCapacityLevel2
	elif scavengerCapacityLevel == 3:
		levelBox = scavengerCapacityLevel3
		
	_update_to_new_button_values(scavengers, scavengerCapacityLevel, scavengerCapacityUpkeep, scavengerCapacityUpkeepValues, scavengerCapacityUpkeepLabel, scavengerCapacityImprovements, scavengerCapacityImprovementLabel, scavengerCapacityButton, scavengerCapacityResources, levelBox)


func _on_scavenger_capacity_button_mouse_entered():
	var scavengers = list_of_robot_type(scavenger_robot)
	_refresh_upkeep_button(scavengers, scavengerCapacityButton, scavengerCapacityUpkeepValues, scavengerCapacityLevel)

func _on_scavenger_capacity_button_mouse_exited():
	totalUpkeep.visible = false


func _on_scavenger_power_button_pressed():
	var scavengers = list_of_robot_type(scavenger_robot)
	Global.scavengerUpkeep += update_robot_upkeep(scavengers, scavengerPowerUpkeepValues, scavengerPowerLevel)
	scavengerPowerLevel = _update_global_values(scavengerPowerPrice, scavengerPowerLevel)
	
	var levelBox
	if scavengerPowerLevel == 1:
		levelBox = scavengerPowerLevel1
	elif scavengerPowerLevel == 2:
		levelBox = scavengerPowerLevel2
	elif scavengerPowerLevel == 3:
		levelBox = scavengerPowerLevel3
		
	_update_to_new_button_values(scavengers, scavengerPowerLevel, scavengerPowerUpkeep, scavengerPowerUpkeepValues, scavengerPowerUpkeepLabel, scavengerPowerImprovements, scavengerPowerImprovementLabel, scavengerPowerButton, scavengerPowerResources, levelBox)


func _on_scavenger_power_button_mouse_entered():
	var scavengers = list_of_robot_type(scavenger_robot)
	_refresh_upkeep_button(scavengers, scavengerPowerButton, scavengerPowerUpkeepValues, scavengerPowerLevel)


func _on_scavenger_power_button_mouse_exited():
	totalUpkeep.visible = false


func _on_potato_button_pressed():
	scrapButton.button_pressed = false
	scrapSection.visible = false
	potatoSection.visible = true

func _on_scrap_button_pressed():
	potatoButton.button_pressed = false
	potatoSection.visible = false
	scrapSection.visible = true


func reset_feature(level, button, resources, upkeepLabel, box1, box2, box3):
	level = 0
	button.text = "Upgrade"
	button.disabled = false
	resources.visible = true
	upkeepLabel.visible = true

	box1.add_theme_stylebox_override("normal", grayStyleBox)
	box2.add_theme_stylebox_override("normal", grayStyleBox)
	box3.add_theme_stylebox_override("normal", grayStyleBox)
	
	return level
	
func reset():
	planterSpeedLevel = reset_feature(planterSpeedLevel, planterSpeedButton, planterSpeedResources, planterSpeedUpkeepLabel, planterSpeedLevel1, planterSpeedLevel2, planterSpeedLevel3)
	planterProductivityLevel = reset_feature(planterProductivityLevel, planterProductivityButton, planterProductivityResources, planterProductivityUpkeepLabel, planterProductivityLevel1, planterProductivityLevel2, planterProductivityLevel3)
	planterPowerLevel = reset_feature(planterPowerLevel, planterPowerButton, planterPowerResources, planterPowerUpkeepLabel, planterPowerLevel1, planterPowerLevel2, planterPowerLevel3)
	
	harvesterSpeedLevel = reset_feature(harvesterSpeedLevel, harvesterSpeedButton, harvesterSpeedResources, harvesterSpeedUpkeepLabel, harvesterSpeedLevel1, harvesterSpeedLevel2, harvesterSpeedLevel3)
	harvesterProductivityLevel = reset_feature(harvesterProductivityLevel, harvesterProductivityButton, harvesterProductivityResources, harvesterProductivityUpkeepLabel, harvesterProductivityLevel1, harvesterProductivityLevel2, harvesterProductivityLevel3)
	harvesterPowerLevel = reset_feature(harvesterPowerLevel, harvesterPowerButton, harvesterPowerResources, harvesterPowerUpkeepLabel, harvesterPowerLevel1, harvesterPowerLevel2, harvesterPowerLevel3)
		
	collectorSpeedLevel = reset_feature(collectorSpeedLevel, collectorSpeedButton, collectorSpeedResources, collectorSpeedUpkeepLabel, collectorSpeedLevel1, collectorSpeedLevel2, collectorSpeedLevel3)
	collectorRangeLevel = reset_feature(collectorRangeLevel, collectorRangeButton, collectorRangeResources, collectorRangeUpkeepLabel, collectorRangeLevel1, collectorRangeLevel2, collectorRangeLevel3)
	collectorPowerLevel = reset_feature(collectorPowerLevel, collectorPowerButton, collectorPowerResources, collectorPowerUpkeepLabel, collectorPowerLevel1, collectorPowerLevel2, collectorPowerLevel3)
	
	scavengerSpeedLevel = reset_feature(scavengerSpeedLevel, scavengerSpeedButton, scavengerSpeedResources, scavengerSpeedUpkeepLabel, scavengerSpeedLevel1, scavengerSpeedLevel2, scavengerSpeedLevel3)
	scavengerCapacityLevel = reset_feature(scavengerCapacityLevel, scavengerCapacityButton, scavengerCapacityResources, scavengerCapacityUpkeepLabel, scavengerCapacityLevel1, scavengerCapacityLevel2, scavengerCapacityLevel3)
	scavengerPowerLevel = reset_feature(scavengerPowerLevel, scavengerPowerButton, scavengerPowerResources, scavengerPowerUpkeepLabel, scavengerPowerLevel1, scavengerPowerLevel2, scavengerPowerLevel3)

	_update()

	potatoButton.button_pressed = true
	scrapButton.button_pressed = false
	scrapSection.visible = false
	potatoSection.visible = true

	recalibrate_robot_upkeep()
