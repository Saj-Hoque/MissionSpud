extends ActionLeaf

var target_reached = false

func tick(actor, blackboard: Blackboard):
	if not actor.is_connected("target_reached", Callable(self, "_target_reached")):
		actor.connect("target_reached", Callable(self, "_target_reached"))
	if self.target_reached:
		self.target_reached = false
		actor.disable_movement()
		actor.disconnect("target_reached", Callable(self, "_target_reached"))
		return SUCCESS
	actor.enable_movement()
	return RUNNING

func _target_reached():
	self.target_reached = true



