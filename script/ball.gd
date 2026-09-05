extends CharacterBody2D

var direction: Vector2 = Vector2(-1, -1).normalized()
var speed: float = 500

@onready var hitsound: AudioStreamPlayer2D = $hitsound

func _physics_process(delta: float) -> void:
	velocity = direction * speed
	move_and_slide()
	
	if get_last_slide_collision() != null:
		
		var normal = get_last_slide_collision().get_normal()
		direction = direction.bounce(normal)
		hitsound.play()
