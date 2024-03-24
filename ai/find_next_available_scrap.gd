extends ConditionLeaf

func tick(actor, blackboard):
	actor.reset_collecting_status()
	var closest_scrap = actor.find_nearest_scrap()
	if closest_scrap != null:
		if actor.docking:
			actor.undock()
			actor.docking = false
		actor.closest_scrap = closest_scrap
		actor.occupy_scrap()
		actor.target_position = closest_scrap.global_position
		return SUCCESS
	return FAILURE
