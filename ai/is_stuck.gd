extends ConditionLeaf


func tick(actor, blackboard: Blackboard):
	if actor.stuck:
		actor.stuck = false
		return SUCCESS
	else:
		return FAILURE
