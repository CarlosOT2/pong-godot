extends Panel

var gameended: bool = false

func _ready() -> void:
	hide()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("Pause") and not gameended:
		get_tree().paused = !get_tree().paused
		visible = get_tree().paused


func _on_pause_button_pressed() -> void:
	get_tree().paused = false
	hide()


func _on_main_menu_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scene/main_menu.tscn")


func _on_main_game_over() -> void:
	gameended = true
