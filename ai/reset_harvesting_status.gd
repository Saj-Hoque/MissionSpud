extends ActionLeaf


func tick(actor, blackboard: Blackboard):
	if actor.plotting:
		actor.reset_harvesting_status()
	actor.status = "Returning to Idle Dock"
	return SUCCESS

