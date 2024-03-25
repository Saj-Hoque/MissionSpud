extends ConditionLeaf


func tick(actor, blackboard: Blackboard):
	if actor.capacity > actor.carrying:
		return SUCCESS
	return FAILURE

