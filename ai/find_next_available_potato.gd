extends ConditionLeaf

func tick(actor, blackboard):
	actor.reset_collecting_status()
	var closest_potato = actor.find_nearest_potato()
	if closest_potato != null:
		if actor.docking:
			actor.undock()
			actor.docking = false
		actor.closest_potato = closest_potato
		actor.occupy_potato()
		actor.target_position = closest_potato.global_position
		return SUCCESS
	return FAILURE
