extends ConditionLeaf

func tick(actor, blackboard):
	var next_available_plot = actor.plot.get_next_available_plot()
	if next_available_plot != -1:
		actor.undock()
		actor.docking = false
		actor.plot.change_plot_status_occupied(next_available_plot)
		actor.plotting = true
		actor.plot_num = next_available_plot
		actor.target_position = actor.plot.get_plot_position(next_available_plot)
		return SUCCESS
	return FAILURE

