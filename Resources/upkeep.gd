extends Node

func update():
	Global.potatoCount -= (Global.upkeep + Global.robot_upkeep)

func below_count():
	if Global.potatoCount < 0:
		return true
	else:
		return false


