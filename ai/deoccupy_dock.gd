extends ActionLeaf

var idle_area

func tick(actor, blackboard: Blackboard):
	if actor.docking:
		idle_area.change_dock_status_unoccupied(actor.docker_num)
		idle_area.update_dock_status_color(actor.docker_num)
		actor.docking = false
	return SUCCESS

