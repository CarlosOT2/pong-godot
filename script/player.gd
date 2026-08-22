extends CharacterBody2D

func _physics_process(delta: float) -> void:
	position.y += Input.get_axis("move_up", "move_down")
