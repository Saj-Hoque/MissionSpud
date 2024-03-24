extends ActionLeaf


func tick(actor, blackboard: Blackboard):
	actor.status = "Travelling to Idle Dock"
	actor.right_click = false
	return SUCCESS

