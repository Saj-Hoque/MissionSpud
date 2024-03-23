extends CharacterBody2D

@onready var player = get_tree().get_first_node_in_group("player")
@onready var world = get_node("/root/world")
@onready var anim_sprite: AnimatedSprite2D = $AnimatedSprite2D

const MAX_SPEED = 15.0
const ACCELERATION = 0.15

var speed = 0.0
var is_being_picked_up_by_player = false

func _ready():
	randomize()
	var type = randi() % 3
	var potatotype = "idle" + str(type)
	anim_sprite.scale = Vector2(randf_range(0.6, 0.8), randf_range(0.6, 0.8))
	anim_sprite.rotation_degrees = randf_range(-15, 15)
	anim_sprite.play(potatotype)
	
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
	tween.tween_callback(world.update_potato_counter.bind(Global.potatoValue))
	tween.tween_callback(queue_free)

func _on_pickup_range_area_entered(area):
	if area.is_in_group("player"):
		is_being_picked_up_by_player = true
		
