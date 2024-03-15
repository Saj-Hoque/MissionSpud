extends ActionLeaf

var idle_area

func tick(actor, blackboard: Blackboard):
	if actor.docked:
		idle_area.change_dock_status_unoccupied(actor.docker_num)
		actor.docked = false
	return SUCCESS

