extends StaticBody2D

@onready var player = get_tree().get_first_node_in_group("player")
@onready var shop = get_node("/root/world/shop")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("interact") && not shop.visible:
		if $range.has_overlapping_bodies():
			shop.open_shop()
	elif event.is_action_pressed("interact") && shop.visible:
		shop.close_shop()

func _on_range_body_exited(body):
	shop.close_shop()
