extends ActionLeaf

var idle_area

func tick(actor, blackboard: Blackboard):
	var next_available_dock = idle_area.get_next_available_dock()
	if next_available_dock != -1:
		idle_area.change_dock_status(next_available_dock)
		actor.docked = true
		return SUCCESS
	else:
		return FAILURE
