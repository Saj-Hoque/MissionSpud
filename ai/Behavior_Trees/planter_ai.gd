extends BeehaveTree

func _ready() -> void:
	#region default_ready_function
	if not process_thread:
		process_thread = ProcessThread.PHYSICS
	
	if actor_node_path:
		actor = get_node(actor_node_path)
	else:
		actor = get_parent()

	if not blackboard:
		# invoke setter to auto-initialise the blackboard.
		self.blackboard = null
	
	# Get the name of the parent node name for metric
	_process_time_metric_name = "beehave [microseconds]/process_time_%s-%s" % [actor.name, get_instance_id()]

	set_physics_process(enabled and process_thread == ProcessThread.PHYSICS)
	set_process(enabled and process_thread == ProcessThread.IDLE)
	
	# Register custom metric to the engine
	if custom_monitor and not Engine.is_editor_hint():
		Performance.add_custom_monitor(_process_time_metric_name, _get_process_time_metric_value)
		_get_global_metrics().register_tree(self)

	if Engine.is_editor_hint():
		update_configuration_warnings.call_deferred()
	else:
		_get_global_debugger().register_tree(self)
		BeehaveDebuggerMessages.register_tree(_get_debugger_data(self))

	# Randomize at what frames tick() will happen to avoid stutters
	last_tick = randi_range(0, tick_rate - 1)
	#endregion

	
	

	

	
