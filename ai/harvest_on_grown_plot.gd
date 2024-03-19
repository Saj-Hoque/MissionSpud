extends ActionLeaf


func tick(actor, blackboard: Blackboard):
	if actor.right_click:
		return FAILURE
	if not actor.harvesting:
		actor.start_harvesting()
	if actor.harvested:
		actor.plot.harvest_plant_on_plot(actor.plot_num)
		actor.plot.change_plot_status_unoccupied(actor.plot_num)
		actor.harvested = false
		actor.harvesting = false
		return SUCCESS
	actor.status = "Harvesting"
	return RUNNING

