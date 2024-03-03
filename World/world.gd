extends Node2D

@onready var potatoCounter = $UI/potatoCounter

func _process(delta):
	potatoCounter.text = (str(Global.potatoCount))

func update_potato_counter(value):
		Global.potatoCount += value
