extends ActionLeaf


func tick(actor, blackboard: Blackboard):
	if actor is scavenger_robot:
		Global.scrapCount += actor.carrying * Global.scrapValue
		actor.carrying = 0
	if actor is collector_robot:
		Global.potatoCount += actor.carrying * Global.potatoValue
		actor.carrying = 0
	return SUCCESS

