extends CharacterBody2D
class_name scrap_resource

@onready var player = get_tree().get_first_node_in_group("player")
@onready var world = get_node("/root/world")
@onready var anim_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var gather_noise = load("res://SFX/plop.mp3")

const MAX_SPEED = 15.0
const ACCELERATION = 0.15

var speed = 0.0
var taken = false
var played = false
var is_being_picked_up_by_player = false
var robot = null
var is_being_picked_up_by_robot = false

func _ready():
	randomize()
	var type = randi() % 6
	var scraptype = "idle" + str(type)
	var scale_xy = randf_range(0.4, 0.6)
	anim_sprite.scale = Vector2(scale_xy, scale_xy)
	anim_sprite.rotation_degrees = randf_range(-15, 15)
	anim_sprite.play(scraptype)

func _physics_process(delta):
	if is_being_picked_up_by_player or is_being_picked_up_by_robot:
		if is_being_picked_up_by_player:
			speed = lerp(speed, MAX_SPEED, ACCELERATION * delta)
			velocity = global_position.direction_to(player.global_position) * speed
		else:
			if not is_instance_valid(robot):
				is_being_picked_up_by_robot = false
				speed = 0.0
				velocity = Vector2(0, 0)
			elif robot.carrying >= robot.capacity:
				is_being_picked_up_by_robot = false
				speed = 0.0
				velocity = Vector2(0, 0)
			else:
				speed = lerp(speed, MAX_SPEED, ACCELERATION * delta)
				velocity = global_position.direction_to(robot.global_position) * speed
			
	var collision = move_and_collide(velocity)
	
	
	if collision:
		if is_being_picked_up_by_player or is_being_picked_up_by_robot:
			if collision.get_collider() is player_character or collision.get_collider() is scavenger_robot:
				if is_being_picked_up_by_player:
					play_pick_up_noise(collision.get_collider())
					_handle_picked_up_by_player()
				else:
					if not is_instance_valid(collision.get_collider()):
						is_being_picked_up_by_robot = false
						speed = 0.0
						velocity = Vector2(0, 0)
					elif robot.carrying >= robot.capacity:
						is_being_picked_up_by_robot = false
						speed = 0.0
						velocity = Vector2(0, 0)
					else:
						play_pick_up_noise(collision.get_collider())
						_handle_picked_up_by_robot()

func play_pick_up_noise(collider):
	if !played:
		collider.pick_up()
		played = true

func occupied():
	taken = true
	
func unoccupied():
	taken = false
	
func is_available():
	return not taken
	
func collect_by_player(world):
	world.update_scrap_counter(Global.scrapValue)

func collect_by_robot(robot):
	if is_instance_of(robot, scavenger_robot):
		robot.add_to_capacity()

func _handle_picked_up_by_player():
	var tween = create_tween()
	tween.tween_property(self, "modulate:a", 0.0, 0.1)
	tween.tween_callback(collect_by_player.bind(world))
	tween.tween_callback(queue_free)
	
func _handle_picked_up_by_robot():
	var tween = create_tween()
	tween.tween_property(self, "modulate:a", 0.0, 0.1)
	tween.tween_callback(queue_free)
	tween.tween_callback(collect_by_robot.bind(robot))
	
func _on_pickup_range_area_entered(area):
	if area.is_in_group("player"):
		is_being_picked_up_by_player = true
		occupied()
	if area.is_in_group("scavengers"):
		robot = area.get_parent()
		is_being_picked_up_by_robot = true
