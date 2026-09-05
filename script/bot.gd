extends CharacterBody2D

@onready var ball: CharacterBody2D = $"../Ball"


func _physics_process(delta: float) -> void:
	var ballDirection = global_position.direction_to(ball.global_position)
	
	if ballDirection.y >= 0:
		velocity.y = 255
	else:
		velocity.y = -255
	move_and_slide()
