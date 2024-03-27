extends RichTextLabel

@export var fade = false

var speed = 3
var time = 0
var sinTime = 0

func flash():
	visible = true
	modulate.a = sinTime

func _process(delta):
	if visible:
		time += delta
		sinTime = sin(time * speed)
		flash()

