extends Control

@onready var anim = $AnimatedSprite2D
@onready var anim_player = $AnimationPlayer

func _ready():
	anim.play()
	anim_player.play("running")
	
func _on_start_pressed():
	Info.reset()
	SceneTransition.change_scene("res://World/world.tscn")

func _on_quit_pressed():
	get_tree().quit()
