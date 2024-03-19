extends ConditionLeaf

var idle_area

func tick(actor, blackboard: Blackboard):
	actor.is_in_idle_area()
	if actor.idle:
		actor.status = "Idle"
		return SUCCESS
	else:
		return FAILURE
