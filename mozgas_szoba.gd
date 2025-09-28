extends CharacterBody2D
const SPEED = 300

func _ready() -> void:
	return
	
func _physics_process(_delta: float) -> void:
		var direction
		direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
		velocity = direction * SPEED + get_gravity()
		move_and_slide()

func _on_texture_button_pressed() -> void:
	get_tree().change_scene_to_file("res://alvas.tscn") # Replace with function body.

func _on_area_2d_body_entered(body: Node2D) -> void:
	pass # Replace with function body.


func _on_texture_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://kert.tscn") # Replace with function body.
