extends ActionLeaf


func tick(actor, blackboard: Blackboard):
	if actor.plotting:
		actor.reset_planting_status()
	actor.status = "Returning to Idle Dock"
	return SUCCESS

