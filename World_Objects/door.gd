extends StaticBody2D

@onready var player = get_tree().get_first_node_in_group("player")
@onready var anim_sprite: AnimatedSprite2D = $AnimatedSprite2D
@export var locked: bool
@onready var locked_collision = $locked

@onready var interactionArea = $interactionArea
@export var action_name : String
@onready var price = $pricePanel
@onready var potatoPrice = $pricePanel/Price/potatoPrice
@onready var scrapPrice = $pricePanel/Price/scrapPrice
@export var y_offset : int
@export var x_offset : int

@export var potatoUnlock: int
@export var scrapUnlock: int

var in_range = []

func _ready():
	if locked:
		potatoPrice.text = str(potatoUnlock)
		scrapPrice.text = str(scrapUnlock)
		interactionArea.action_name = action_name
		interactionArea.y_offset = y_offset
		interactionArea.x_offset = x_offset
		interactionArea.interact = Callable(self, "_on_interact")
		
	if not locked:
		unlock()
		interactionArea.queue_free()
		
	anim_sprite.play("closed")
	

func unlock():
	locked = false
	locked_collision.disabled = true

func _open_door(area):
	if area.is_in_group("player") or area.is_in_group("robots_range"):
			in_range.append(area)
			anim_sprite.play("open")

func _close_door(area):
	if area.is_in_group("player") or area.is_in_group("robots_range"):
			if area in in_range:
				in_range.erase(area)
			if in_range.is_empty():
				anim_sprite.play("closed")

func _on_area_2d_area_entered(area):
	if not locked:
		_open_door(area)

func _on_area_2d_area_exited(area):
	if not locked:
		_close_door(area)

func _on_interact():
	if Global.potatoCount >= potatoUnlock and Global.scrapCount >= scrapUnlock:
		unlock()
		_open_door(player.range)
		interactionArea.queue_free()

func _on_interaction_area_body_entered(body):
	if Global.potatoCount < potatoUnlock:
		potatoPrice.add_theme_color_override("font_color", Color("8b0000"))
	else:
		potatoPrice.add_theme_color_override("font_color", Color("ffffff"))
		
	if Global.scrapCount < scrapUnlock:
		scrapPrice.add_theme_color_override("font_color", Color("8b0000"))
	else:
		scrapPrice.add_theme_color_override("font_color", Color("ffffff"))		
		
	price.visible = true


func _on_interaction_area_body_exited(body):
	price.visible = false
