extends ConditionLeaf


func tick(actor, blackboard: Blackboard):
	if actor.idle_area.type == "main":
		return SUCCESS
	else:
		return FAILURE

