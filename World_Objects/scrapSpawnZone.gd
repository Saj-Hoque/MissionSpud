extends Area2D
class_name  ScrapArea

var scrap_scene = preload("res://Resources/scrap.tscn")
@onready var scraps = $scraps
@onready var scrapArea = $area
@onready var scrapAreaDims = scrapArea.shape.extents
@onready var scrapAreaOrigin = scrapArea.global_position - scrapAreaDims
@onready var scrapTimer = $"../../scrapSpawnTimer"

func _ready():
	pass

func _on_scrap_spawn_timer_timeout():
	for i in range(Global.scrapQuantity):
		if scraps.get_child_count() < Global.max_scraps:
			var scrap = scrap_scene.instantiate()
			scrap.position = Vector2(randi_range(scrapAreaOrigin.x, scrapAreaOrigin.x + (scrapAreaDims.x*2)), randi_range(scrapAreaOrigin.y, scrapAreaOrigin.y + (scrapAreaDims.y*2)))
			scraps.add_child(scrap) 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	scrapTimer.wait_time = Global.scrapTimer


