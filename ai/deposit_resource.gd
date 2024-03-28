extends ActionLeaf


func tick(actor, blackboard: Blackboard):
	if actor is scavenger_robot:
		var addition = actor.carrying * Global.scrapValue
		Global.scrapCount += addition
		Global.totalScrap += addition
		if addition != 0: 
			GatherNumbers.display(actor.carrying * Global.scrapValue, actor.gatherNumbersOrigin.global_position)
		actor.carrying = 0
	if actor is collector_robot:
		var addition = actor.carrying * Global.potatoValue
		Global.potatoCount += addition
		Global.totalPotato += addition
		if addition != 0: 
			GatherNumbers.display(actor.carrying * Global.potatoValue, actor.gatherNumbersOrigin.global_position)
		actor.carrying = 0
	return SUCCESS

