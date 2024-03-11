extends StaticBody2D

@onready var player = get_tree().get_first_node_in_group("player")
@onready var shop = get_node("/root/world/shop")
@onready var interactionArea = $interactionArea

func _ready():
	interactionArea.interact = Callable(self, "_on_interact")

func _on_interact():
	if not shop.visible:
		shop.open_shop()
	else:
		shop.close_shop()

func _on_interaction_area_body_exited(body):
	if shop.visible:
		shop.close_shop()
