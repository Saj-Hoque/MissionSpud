extends ActionLeaf

func tick(actor, blackboard: Blackboard):
	print(actor.docking)
	if actor.docking:
		actor.idle_area.change_dock_status_unoccupied(actor.docker_num)
		actor.idle_area.update_dock_status_color(actor.docker_num)
		actor.docking = false
	return SUCCESS

