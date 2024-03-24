extends ActionLeaf


func tick(actor, blackboard: Blackboard):
	if actor is scavenger_robot:
		Global.scrapCount += actor.carrying * Global.scrapValue
		actor.carrying = 0
	return SUCCESS

