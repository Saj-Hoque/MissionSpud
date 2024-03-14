extends ConditionLeaf


func tick(actor, blackboard: Blackboard):
	if actor.right_click:
		return SUCCESS
	else:
		return FAILURE	
