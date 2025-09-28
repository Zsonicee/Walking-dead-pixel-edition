extends CharacterBody2D
const SPEED = 80

func _ready() -> void:
	return
	
func _physics_process(_delta: float) -> void:
		var direction
		direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
		velocity = direction * SPEED
		move_and_slide()
