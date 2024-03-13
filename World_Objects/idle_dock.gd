extends Node2D

@export var taken = false
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

func _ready():
	unoccupied()


func occupied():
	taken = true
	sprite.play("green")

func unoccupied():
	taken = false
	sprite.play("blue")
	
func has_space():
	if taken:
		return false
	return true
