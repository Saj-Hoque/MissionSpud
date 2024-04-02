extends ConditionLeaf


func tick(actor, blackboard: Blackboard):
	if not actor.plot == null:
		var plot_potato_count = actor.plot_potato_count()
		if plot_potato_count > Global.max_potatoes:
			return SUCCESS
	return FAILURE

