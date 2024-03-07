extends Node2D

@onready var scraps = get_node("/root/world/scraps")
@onready var scrapArea = $scrapSpawnZone/area
@onready var scrapAreaDims = scrapArea.shape.extents
@onready var scrapAreaOrigin = scrapArea.global_position - scrapAreaDims
var scrap_scene = preload("res://Resources/scrap.tscn")

func _process(delta):
	pass

func update_potato_counter(value):
		Global.potatoCount += value
		
func update_scrap_counter(value):
		Global.scrapCount += value

func _on_scrap_spawn_timer_timeout():
	if scraps.get_child_count() < Global.max_scraps:
		var scrap = scrap_scene.instantiate()
		scrap.position = Vector2(randi_range(scrapAreaOrigin.x, scrapAreaOrigin.x + (scrapAreaDims.x*2)), randi_range(scrapAreaOrigin.y, scrapAreaOrigin.y + (scrapAreaDims.y*2)))
		scraps.add_child(scrap) 
	
