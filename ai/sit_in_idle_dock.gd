extends ActionLeaf

var idle_area

func tick(actor, blackboard: Blackboard):
	var next_available_dock = idle_area.get_next_available_dock()
	if next_available_dock != -1:
		idle_area.change_dock_status_occupied(next_available_dock)
		actor.docked = true
		actor.docker_num = next_available_dock
		return SUCCESS
	else:
		return FAILURE
