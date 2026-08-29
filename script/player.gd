extends CharacterBody2D

var maxSpeed: float = 500 
var speed: float = 0

func _physics_process(delta: float) -> void:
	var direction = Input.get_axis("move_up", "move_down")
	velocity.y = direction * speed
	move_and_slide()
	if absf(direction) > 0:
		speed = lerpf(speed, maxSpeed, 1 * delta)
	else:
		speed = 0
