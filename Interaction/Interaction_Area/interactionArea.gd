extends Area2D
class_name InteractionArea

@export var action_name: String = "interact"
@export var y_offset: int = -10


var interact: Callable = func():
	pass


func _on_body_entered(body):
	InteractionManager.register_area(self)


func _on_body_exited(body):
	InteractionManager.unregister_area(self)
