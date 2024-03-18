extends ActionLeaf


func tick(actor, blackboard: Blackboard):
	if actor.plotting:
		actor.reset_planting_status()
	return SUCCESS

