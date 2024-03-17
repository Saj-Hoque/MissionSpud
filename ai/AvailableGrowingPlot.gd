extends ConditionLeaf

var plot_areas

func tick(actor, blackboard):
	for plot in plot_areas:	
		var next_available_plot = plot.get_next_available_plot()
		if next_available_plot != -1:
			return SUCCESS
	return FAILURE

