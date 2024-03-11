extends StaticBody2D

@onready var player = get_tree().get_first_node_in_group("player")
@onready var interactionArea = $interactionArea

func _ready():
	interactionArea.interact = Callable(self, "_on_interact")

func _on_interact():
	if not Shop.visible:
		Shop.open_shop()
	else:
		Shop.close_shop()

func _on_interaction_area_body_exited(body):
	if Shop.visible:
		Shop.close_shop()
