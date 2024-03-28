extends StaticBody2D

@onready var anim_sprite: AnimatedSprite2D = $AnimatedSprite2D
var in_range = []


func _ready():
	anim_sprite.play("closed")


func _on_area_2d_area_entered(area):
	if area.is_in_group("player") or area.is_in_group("robots_range"):
		in_range.append(area)
		anim_sprite.play("open")
		

func _on_area_2d_area_exited(area):
	if area.is_in_group("player") or area.is_in_group("robots_range"):
		if area in in_range:
			in_range.erase(area)
		if in_range.is_empty():
			anim_sprite.play("closed")
