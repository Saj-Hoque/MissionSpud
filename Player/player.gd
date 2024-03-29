extends CharacterBody2D
class_name player_character

@export var speed = 100
@export var accel = 10
@export var idle_direction = "downidle"
@onready var anim_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var gather_noise = $gather_noise

func _physics_process(delta):

	var direction: Vector2 = Input.get_vector("left", "right", "up", "down")
	direction = direction.normalized()
	if Input.is_action_pressed("right"):
		idle_direction = "sideidle"
		anim_sprite.play("sidewalk")
		anim_sprite.flip_h = false
	elif Input.is_action_pressed("left"):
		idle_direction = "sideidle"
		anim_sprite.play("sidewalk")
		anim_sprite.flip_h = true
	elif Input.is_action_pressed("down"):
		idle_direction = "downidle"
		anim_sprite.play("downwalk")
	elif Input.is_action_pressed("up"):
		idle_direction = "upidle"
		anim_sprite.play("upwalk")
	else:
		anim_sprite.play(idle_direction)
	
	velocity.x = move_toward(velocity.x, speed * direction.x, accel)
	velocity.y = move_toward(velocity.y, speed * direction.y, accel)
	
	move_and_slide()


func pick_up():
	gather_noise.play(0.4)
	
	
	
