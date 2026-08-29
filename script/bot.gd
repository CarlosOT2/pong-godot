extends CharacterBody2D

@onready var ball: CharacterBody2D = $"../Ball"


func _physics_process(delta: float) -> void:
	global_position.y = ball.global_position.y
