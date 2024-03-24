extends ConditionLeaf

func tick(actor, blackboard):
	var closest_scrap = actor.is_scrap_available()
	if closest_scrap != -1:
		return SUCCESS
	return FAILURE
