extends ConditionLeaf

var idle_area

func tick(actor, blackboard: Blackboard):
	actor.is_in_idle_area()
	if actor.idle:
		return SUCCESS
	else:
		return FAILURE
