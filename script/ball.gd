extends CharacterBody2D

var direction: Vector2 = Vector2(-1, -1).normalized()
var speed: float = 500

func _physics_process(delta: float) -> void:
	velocity = direction * speed
	move_and_slide()
	
	if get_last_slide_collision() != null:
		direction.x *= -1
