extends RichTextLabel

@export var fade = false

var speed = 2
var time = 0
var sinTime = 0
var _visible = true


func flash():
	_visible = true
	modulate.a = sinTime

func _process(delta):
	if visible:
		time += delta
		sinTime = sin(time * speed)
		flash()
