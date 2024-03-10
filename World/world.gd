extends Node2D

@onready var scraps = get_node("/root/world/scraps")
@onready var scrapArea = $scrapSpawnZone/area
@onready var scrapAreaDims = scrapArea.shape.extents
@onready var scrapAreaOrigin = scrapArea.global_position - scrapAreaDims
var scrap_scene = preload("res://Resources/scrap.tscn")

func _ready():
	Global.potatoCount = 0
	Global.scrapCount = 0
	
	TimeSystem.day = 0
	TimeSystem.hour = 0
	TimeSystem.minute = 0
	TimeSystem.second = 15*60*24

func update_potato_counter(value):
		Global.potatoCount += value
		
func update_scrap_counter(value):
		Global.scrapCount += value

func _on_scrap_spawn_timer_timeout():
	if scraps.get_child_count() < Global.max_scraps:
		var scrap = scrap_scene.instantiate()
		scrap.position = Vector2(randi_range(scrapAreaOrigin.x, scrapAreaOrigin.x + (scrapAreaDims.x*2)), randi_range(scrapAreaOrigin.y, scrapAreaOrigin.y + (scrapAreaDims.y*2)))
		scraps.add_child(scrap) 
	
