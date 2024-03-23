extends ActionLeaf


func tick(actor, blackboard: Blackboard):
	actor.right_click = false
	return SUCCESS

