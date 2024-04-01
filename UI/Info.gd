extends CanvasLayer

@onready var intro = $intro
@onready var instructions = $instructions
@onready var play = $play

@onready var previous = $previous
@onready var next = $next

var current_page

func _ready():
	current_page = intro
	hide()
	await get_tree().get_root().ready

func _process(delta):
	if visible:
		if current_page == intro:
			previous.disabled = true
		else:
			previous.disabled = false
		
		if current_page == play:
			next.disabled = true
		else:
			next.disabled = false
	
func show_panel():
	visible = true
	get_tree().paused = true
	RobotShop.close_shop()
	RobotResearchStation.close_shop()
	ResourceResearchStation.close_shop()
	
func hide_panel():
	get_tree().paused = false
	visible = false

func _input(event):
	if event.is_action_pressed("back") and not PauseCanvas.paused:
		hide_panel()
		await get_tree().create_timer(0.1).timeout
		Global.menu_active = false


func _on_close_button_pressed():
	hide_panel()
	Global.menu_active = false


func _on_previous_pressed():
	if current_page == instructions:
		current_page = intro
		intro.visible = true
		instructions.visible = false
		play.visible = false
	elif current_page == play:
		current_page = instructions
		intro.visible = false
		instructions.visible = true
		play.visible = false


func _on_next_pressed():
	if current_page == intro:
		current_page = instructions
		intro.visible = false
		instructions.visible = true
		play.visible = false
	elif current_page == instructions:
		current_page = play
		intro.visible = false
		instructions.visible = false
		play.visible = true
