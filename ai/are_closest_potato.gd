extends ConditionLeaf

func tick(actor, blackboard):
	var closest_potato = actor.is_potato_available()
	if closest_potato != -1:
		return SUCCESS
	return FAILURE
