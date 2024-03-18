extends ConditionLeaf

func tick(actor, blackboard):
	var next_full_plot = actor.plot.get_next_full_plot()
	if next_full_plot != -1:
		return SUCCESS
	return FAILURE

