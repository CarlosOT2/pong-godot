extends Node2D

var scorePlayer = 0
var scoreBot = 0

@onready var score_label: Label = $CanvasLayer/ScoreLabel

func _on_goal_1_body_entered(body: Node2D) -> void:
	body.global_position = Vector2i(566, 332)
	scoreBot += 1
	updateScore()


func _on_goal_2_body_entered(body: Node2D) -> void:
	body.global_position = Vector2i(566, 332) 
	scorePlayer += 1
	updateScore()

func updateScore():
	score_label.text = str(scorePlayer) + " x " + str(scoreBot)
