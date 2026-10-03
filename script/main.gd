extends Node2D

signal game_over

var scorePlayer = 0
var scoreBot = 0

var max_score: int = 1

@onready var score_label: Label = $CanvasLayer/ScoreLabel
@onready var bot_score_sound: AudioStreamPlayer = $botScoreSound
@onready var player_score_sound: AudioStreamPlayer = $playerScoreSound
@onready var result_screen: Panel = %ResultScreen
@onready var result: RichTextLabel = %Result

func _ready() -> void:
	result_screen.hide()


func _on_goal_1_body_entered(body: Node2D) -> void:
	body.global_position = Vector2i(566, 332)
	scoreBot += 1
	updateScore()
	bot_score_sound.play()


func _on_goal_2_body_entered(body: Node2D) -> void:
	body.global_position = Vector2i(566, 332) 
	scorePlayer += 1
	updateScore()
	player_score_sound.play()

func updateScore():
	score_label.text = str(scorePlayer) + " x " + str(scoreBot)
	if(scorePlayer >= max_score or scoreBot >= max_score):
		result_screen.show()
		result.text = "%s" % "[wave]Vitória![/wave]" if scorePlayer > scoreBot else "[shake]Derrota![/shake]"
		result.text += "\n%s / %s" % [scorePlayer, scoreBot]
		game_over.emit()


func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/main_menu.tscn")


func _on_restart_pressed() -> void:
	get_tree().reload_current_scene()
