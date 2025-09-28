extends CharacterBody2D
const SPEED = 350

func _ready() -> void:
	return
	
func _physics_process(_delta: float) -> void:
		var direction
		direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
		velocity = direction * SPEED + get_gravity()
		move_and_slide()
