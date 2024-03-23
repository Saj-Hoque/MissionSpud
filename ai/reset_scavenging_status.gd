extends ActionLeaf


func tick(actor, blackboard: Blackboard):
	if actor.scrapping:
		actor.reset_collecting_status()
	return SUCCESS
