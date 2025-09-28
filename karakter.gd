extends CharacterBody2D

@export var speed: float = 500
@export var jump_velocity: float = -500
@export var gravity: float = 1200
@export var max_jumps: int = 1
var startpos : Vector2
var jump_count: int = 0

func _physics_process(delta):
	# gravitáció
	if not is_on_floor():
		velocity.y += gravity * delta

	# oldalirányú mozgás
	var input_dir = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velocity.x = input_dir * speed

	# ugrás
	if Input.is_action_just_pressed("ui_accept"):
		if is_on_floor():
			velocity.y = jump_velocity
			jump_count = 1
		elif jump_count < max_jumps:
			velocity.y = jump_velocity
			jump_count += 1

	# földön vagyunk? reset
	if is_on_floor():
		jump_count = 0

	# mozgatás
	move_and_slide()  # csak így, Godot 4-ben


func _on_area_2d_body_entered(body: Node2D) -> void:
	position = startpos
	return


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://hazreggel.tscn")
