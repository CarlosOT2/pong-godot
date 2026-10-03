extends Node2D

signal game_over
signal pause_enable_toggled(status: bool)

var scorePlayer = 0
var scoreBot = 0

var max_score: int = 1
var idle_elapsed: int = -1:
	set(value):
		idle_elapsed = value
		update_countdown_label()
		
@onready var score_label: Label = $CanvasLayer/ScoreLabel
@onready var bot_score_sound: AudioStreamPlayer = $botScoreSound
@onready var player_score_sound: AudioStreamPlayer = $playerScoreSound
@onready var result_screen: Panel = %ResultScreen
@onready var result: RichTextLabel = %Result
@onready var countdownlabel: RichTextLabel = $CanvasLayer/CountDownLabel

func _ready() -> void:
	result_screen.hide()
	start_countdown()


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

func start_countdown()->void:
	var tween:Tween = create_tween()
	idle_elapsed=3
	tween.tween_property(self,"idle_elapsed",0,3)

func update_countdown_label()->void:
	countdownlabel.text = str(idle_elapsed)
	
func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/main_menu.tscn")

func _on_restart_pressed() -> void:
	get_tree().reload_current_scene()
