extends ConditionLeaf

func tick(actor, blackboard):
	var next_available_plot = actor.plot.get_next_available_plot()
	if next_available_plot != -1:
		return SUCCESS
	return FAILURE

