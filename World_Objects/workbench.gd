extends StaticBody2D

@onready var player = get_tree().get_first_node_in_group("player")
@onready var interactionArea = $interactionArea
@onready var anim = $AnimatedSprite2D
@export var shop_index : int
@export var action_name : String
var shop_dict = { 0 : [RobotShop, "robot_shop"],
				  1 : [RobotResearchStation, "robot_upgrade"],
				  2 : [ResourceResearchStation, "resource_upgrade"]}
				
var Shop

func _ready():
	Shop = shop_dict[shop_index][0]
	anim.play(shop_dict[shop_index][1])
	interactionArea.action_name = action_name
	interactionArea.interact = Callable(self, "_on_interact")

func _on_interact():
	if not Shop.visible:
		Shop.open_shop()
		Global.menu_active = true
	else:
		Shop.close_shop()
		Global.menu_active = false

func _on_interaction_area_body_exited(body):
	if Shop.visible:
		Shop.close_shop()
		Global.menu_active = false

func _input(event):
	if event.is_action_pressed("back"):
		Shop.close_shop()
		await get_tree().create_timer(0.1).timeout
		Global.menu_active = false
		
		
