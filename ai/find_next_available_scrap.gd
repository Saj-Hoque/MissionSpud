extends ConditionLeaf

func tick(actor, blackboard):
	var next_available_scrap = actor.find_nearest_scrap()
	if next_available_scrap != -1:
		if actor.docking:
			actor.undock()
			actor.docking = false
		#actor.plot.change_plot_status_occupied(next_available_plot)
		#actor.plotting = true
		#actor.plot_num = next_available_plot
		#actor.target_position = actor.plot.get_plot_position(next_available_plot)
		return SUCCESS
	return FAILURE
