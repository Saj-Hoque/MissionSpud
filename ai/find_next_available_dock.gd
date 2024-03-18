extends ActionLeaf


func tick(actor, blackboard: Blackboard):
	var next_available_dock = actor.idle_area.get_next_available_dock()
	if next_available_dock > -1:
		actor.idle_area.change_dock_status_occupied(next_available_dock)
		actor.docking = true
		actor.docker_num = next_available_dock
		actor.target_position = actor.idle_area.get_dock_position(next_available_dock)
		return SUCCESS
	else:
		return FAILURE
	

