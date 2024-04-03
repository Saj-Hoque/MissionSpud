extends Area2D
class_name  ScrapArea

var scrap_scene = preload("res://Resources/scrap.tscn")
@onready var scraps = $"../../../scraps"
@onready var scrapArea = $area
@onready var scrapArea2 = $area2
@onready var scrapArea3 = $area3
@onready var scrapAreaDims = scrapArea.shape.extents
@onready var scrapAreaOrigin = scrapArea.position - scrapAreaDims
@onready var scrapArea2Dims = scrapArea2.shape.extents
@onready var scrapArea2Origin = scrapArea2.position - scrapArea2Dims
@onready var scrapArea3Dims = scrapArea3.shape.extents
@onready var scrapArea3Origin = scrapArea3.position - scrapArea3Dims
@onready var scrapTimer = $"../../../scrapSpawnTimer"

@onready var idle_area = get_parent()

func instantiate():
	scrapTimer.wait_time = Global.scrapTimer
	
func _on_scrap_spawn_timer_timeout():
	if scrapTimer.wait_time != Global.scrapTimer:
		scrapTimer.wait_time = Global.scrapTimer
	
	if scraps.get_child_count() < Global.max_scraps:
		for i in range(Global.scrapQuantity):
			var scrap = scrap_scene.instantiate()
			scrap.position = Vector2(randi_range(scrapAreaOrigin.x, scrapAreaOrigin.x + (scrapAreaDims.x*2)), randi_range(scrapAreaOrigin.y, scrapAreaOrigin.y + (scrapAreaDims.y*2)))
			scraps.add_child(scrap) 
		
		for i in range(Global.scrapQuantity * 2):
			var scrap = scrap_scene.instantiate()
			scrap.position = Vector2(randi_range(scrapArea2Origin.x, scrapArea2Origin.x + (scrapArea2Dims.x*2)), randi_range(scrapArea2Origin.y, scrapArea2Origin.y + (scrapArea2Dims.y*2)))
			scraps.add_child(scrap)
				
		for i in range(Global.scrapQuantity * 3):
			var scrap = scrap_scene.instantiate()
			scrap.position = Vector2(randi_range(scrapArea3Origin.x, scrapArea3Origin.x + (scrapArea3Dims.x*2)), randi_range(scrapArea3Origin.y, scrapArea3Origin.y + (scrapArea3Dims.y*2)))
			scraps.add_child(scrap) 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.scrapTimer < scrapTimer.wait_time:
		if scrapTimer.get_time_left() > 0:
			scrapTimer.start((scrapTimer.get_time_left() / scrapTimer.wait_time) * Global.scrapTimer)
		else:
			scrapTimer.wait_time = Global.potatoTimer

