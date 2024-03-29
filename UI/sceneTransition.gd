extends CanvasLayer

@onready var anim = $AnimationPlayer

func change_scene(next_scene):
	anim.play("transition")
	await anim.animation_finished
	get_tree().change_scene_to_file(next_scene)
	anim.play_backwards("transition")
	await anim.animation_finished
