extends ActionLeaf

var target_reached = false

func tick(actor, blackboard: Blackboard):
	if not actor.is_connected("target_reached", Callable(self, "_target_reached")):
		actor.connect("target_reached", Callable(self, "_target_reached"))
	if target_reached:
		target_reached = false
		actor.disable_movement()
		actor.disconnect("target_reached", Callable(self, "_target_reached"))
		return SUCCESS
	if actor.right_click:
		actor.disconnect("target_reached", Callable(self, "_target_reached"))
		return FAILURE
	if not is_instance_valid(actor.closest_potato):
		actor.reset_collecting_status()
		return FAILURE
	if actor.carrying >= actor.capacity:
		actor.reset_collecting_status()
		return FAILURE
	actor.enable_movement()
	actor.status = "Finding nearest potato"
	return RUNNING

func _target_reached():
	self.target_reached = true
