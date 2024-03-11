extends CanvasLayer

func open_shop():
	visible = true
	
func close_shop():
	visible = false
	
func _on_close_pressed():
	close_shop()
