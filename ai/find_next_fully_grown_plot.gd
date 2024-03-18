extends ConditionLeaf

func tick(actor, blackboard):
	var next_full_plot = actor.plot.get_next_full_plot()
	if next_full_plot != -1:
		if actor.docking:
			actor.undock()
			actor.docking = false
		actor.plot.change_plot_status_occupied(next_full_plot)
		actor.plotting = true
		actor.plot_num = next_full_plot
		actor.target_position = actor.plot.get_plot_position(next_full_plot)
		return SUCCESS
	return FAILURE
