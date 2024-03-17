extends ActionLeaf


func tick(actor, blackboard: Blackboard):

	# timer for robot to do its animation
	actor.plot.grow_plant_on_plot(actor.plot_num)
	actor.plot.change_plot_status_unoccupied(actor.plot_num)
	return SUCCESS

