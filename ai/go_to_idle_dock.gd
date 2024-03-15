extends ActionLeaf

var idle_area

var target_reached = false

func tick(actor, blackboard: Blackboard):
	if not actor.is_connected("target_reached", Callable(self, "_target_reached")):
		actor.connect("target_reached", Callable(self, "_target_reached"))
	if self.target_reached:
		self.target_reached = false
		actor.disable_movement()
		actor.disconnect("target_reached", Callable(self, "_target_reached"))
		return SUCCESS
	if actor.right_click:
		actor.disconnect("target_reached", Callable(self, "_target_reached"))
		return FAILURE
	var next_available_dock = idle_area.get_next_available_dock()
	if next_available_dock > -1:
		actor.target_position = idle_area.get_dock_position(next_available_dock)
		actor.enable_movement()
		return RUNNING
	else:
		return FAILURE

func _target_reached():
	self.target_reached = true

