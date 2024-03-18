extends Node2D

@export var taken = false
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

func _ready():
	unoccupied()
	update_status()

func occupied():
	taken = true

func unoccupied():
	taken = false

func update_status():
	if taken:
		sprite.play("green")
	else:
		sprite.play("blue")
		
func has_space():
	if taken:
		return false
	return true
