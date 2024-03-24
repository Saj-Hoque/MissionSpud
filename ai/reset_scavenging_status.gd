extends ActionLeaf


func tick(actor, blackboard: Blackboard):
	actor.reset_collecting_status()
	actor.status = "Returning to Idle Dock"
	return SUCCESS
