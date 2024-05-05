extends CanvasLayer



func _ready():
	hide()

	
func show_panel():
	visible = true


func hide_panel():
	visible = false

func _on_close_button_pressed():
	hide_panel()

func _input(event):
	if event.is_action_pressed("back") and not PauseCanvas.paused:
		hide_panel()
		await get_tree().create_timer(0.1).timeout

