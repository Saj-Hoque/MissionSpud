extends Node2D

var scrap_scene = preload("res://Resources/scrap.tscn")
@onready var scraps = get_node("/root/world/scraps")
@onready var scrapArea = $scrapSpawnZone/area
@onready var scrapAreaDims = scrapArea.shape.extents
@onready var scrapAreaOrigin = scrapArea.global_position - scrapAreaDims
@onready var scrapTimer = $scrapSpawnTimer


func _ready():
	Global.potatoCount = 1000
	Global.scrapCount = 1000
	
	TimeSystem.day = 1
	TimeSystem.hour = 0
	TimeSystem.minute = 0
	TimeSystem.second = 15*60*24

func update_potato_counter(value):
		Global.potatoCount += value
		
func update_scrap_counter(value):
		Global.scrapCount += value
		
func _process(delta):
	scrapTimer.wait_time = Global.scrapTimer

func _on_scrap_spawn_timer_timeout():
	for i in range(Global.scrapQuantity):
		if scraps.get_child_count() < Global.max_scraps:
			var scrap = scrap_scene.instantiate()
			scrap.position = Vector2(randi_range(scrapAreaOrigin.x, scrapAreaOrigin.x + (scrapAreaDims.x*2)), randi_range(scrapAreaOrigin.y, scrapAreaOrigin.y + (scrapAreaDims.y*2)))
			scraps.add_child(scrap) 
		
func _input(event):
	if event.is_action_pressed("leftClick"):
		SelectionManager.target_pos = get_global_mouse_position()
		SelectionManager.selection_mode = true
		
	
