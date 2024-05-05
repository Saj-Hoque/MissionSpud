extends Control

@onready var anim = $AnimatedSprite2D
@onready var anim_player = $AnimationPlayer

func _ready():
	anim.play()
	anim_player.play("running")
	
func _on_start_pressed():
	Info.reset()
	Credits.hide_panel()
	SceneTransition.change_scene("res://World/world.tscn")

func _on_quit_pressed():
	get_tree().quit()

func _on_credits_pressed():
	if not Credits.visible:
		Credits.show_panel()
	else:
		Credits.hide_panel()
