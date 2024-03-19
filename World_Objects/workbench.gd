extends StaticBody2D

@onready var player = get_tree().get_first_node_in_group("player")
@onready var interactionArea = $interactionArea
@export var shop_index : int
@export var action_name : String
var shop_dict = { 0 : RobotShop,
				  1 : RobotResearchStation,
				  2 : ResourceResearchStation}
				
var Shop

func _ready():
	Shop = shop_dict[shop_index]
	interactionArea.action_name = action_name
	interactionArea.interact = Callable(self, "_on_interact")

func _on_interact():
	if not Shop.visible:
		Shop.open_shop()
	else:
		Shop.close_shop()

func _on_interaction_area_body_exited(body):
	if Shop.visible:
		Shop.close_shop()
