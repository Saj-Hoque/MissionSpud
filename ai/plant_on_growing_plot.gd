extends ActionLeaf


func tick(actor, blackboard: Blackboard):
	if actor.right_click:
		return FAILURE
	if Global.potatoCount == 0:
		actor.reset_planting_status()
		return FAILURE
	if not actor.planting:
		actor.start_planting()
	if actor.planted:
		actor.plot.grow_plant_on_plot(actor.plot_num)
		Global.potatoCount -= 1
		actor.plot.change_plot_status_unoccupied(actor.plot_num)
		actor.planted = false
		actor.planting = false
		return SUCCESS
	return RUNNING

