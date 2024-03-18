extends ConditionLeaf

func tick(actor, blackboard: Blackboard):	
	if Global.potatoCount > 0:
		return SUCCESS
	return FAILURE

