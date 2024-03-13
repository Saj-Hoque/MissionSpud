extends CharacterBody2D

@onready var player = get_tree().get_first_node_in_group("player")
@onready var world = get_node("/root/world")
@onready var anim_sprite: AnimatedSprite2D = $AnimatedSprite2D

const MAX_SPEED = 15.0
const ACCELERATION = 0.15

var speed = 0.0
var value = 1
var is_being_picked_up_by_player = false

func _ready():
	randomize()
	var type = randi() % 6
	var scraptype = "idle" + str(type)
	var scale_xy = randf_range(0.6, 0.8)
	anim_sprite.scale = Vector2(scale_xy, scale_xy)
	anim_sprite.rotation_degrees = randf_range(-15, 15)
	anim_sprite.play(scraptype)

func _physics_process(delta):
	if is_being_picked_up_by_player:
		speed = lerp(speed, MAX_SPEED, ACCELERATION * delta)
		velocity = global_position.direction_to(player.global_position) * speed
		
	var collision = move_and_collide(velocity)
	
	if collision:
		if is_being_picked_up_by_player:
			_handle_picked_up_by_player()
		
func _handle_picked_up_by_player():
	var tween = create_tween()
	tween.tween_property(self, "modulate:a", 0.0, 0.1)
	tween.tween_callback(world.update_scrap_counter.bind(value))
	tween.tween_callback(queue_free)
	
func _on_pickup_range_area_entered(area):
	if area.is_in_group("player"):
		is_being_picked_up_by_player = true
