extends ActionLeaf

func tick(actor, blackboard: Blackboard):
	if actor.docking:
		actor.undock()
	return SUCCESS

