extends Node2D

var scorePlayer = 0
var scoreBot = 0

@onready var score_label: Label = $CanvasLayer/ScoreLabel
@onready var bot_score_sound: AudioStreamPlayer = $botScoreSound
@onready var player_score_sound: AudioStreamPlayer = $playerScoreSound

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
