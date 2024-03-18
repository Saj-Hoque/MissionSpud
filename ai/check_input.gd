extends ConditionLeaf


func tick(actor, blackboard: Blackboard):
	if actor.right_click:
		actor.right_click = false
		return SUCCESS
	else:
		return FAILURE	
