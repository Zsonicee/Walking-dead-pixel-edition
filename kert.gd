extends CharacterBody2D

# --- Mozgás beállítások ---
const SPEED: float = 300.0
const JUMP_FORCE: float = -400.0
const GRAVITY: float = 900.0

var shrunk: bool = false   # csak egyszer zsugorodjon

func _physics_process(delta: float) -> void:
	# Gravitáció mindig hat
	if not is_on_floor():
		velocity.y += GRAVITY * delta
	else:
		velocity.y = 0.0  # ha talajon van, alaphelyzet

	# Csak balra-jobbra mozgás (A-D vagy nyilak)
	var input_dir := Input.get_axis("ui_left", "ui_right")
	velocity.x = input_dir * SPEED

	# Ugrás (space vagy ui_accept pl.)
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_FORCE

	# Mozgás + ütközések kezelése
	move_and_slide()


# --- UI gomb események ---
func _on_texture_button_pressed() -> void:
	get_tree().change_scene_to_file("res://alvas.tscn")


func _on_texture_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://kert.tscn")


func _on_texture_button_3_pressed() -> void:
	# Példa: ha van egy Camera2D node a Character alatt
	if has_node("Camera2D"):
		$Camera2D.current = true
		print("Kamera váltva erre a CharacterBody2D-re")


# --- Animáció esemény ---
func _on_animated_sprite_2d_animation_looped() -> void:
	print("Animáció körbeért!")


# --- Area2D trigger (pl. ShrinkTrigger) ---
func _on_shrink_trigger_body_entered(body: Node) -> void:
	if body == self and not shrunk:
		scale *= 0.2   # 5× kisebb
		shrunk = true
		print("Karakter zsugorodott!")


func _on_area_2d_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://1900x_1900_000000_80_0_0.tscn")


func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://aldozat.tscn")
	
	


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://sadend.tscn")


func _on_textuurebutton_pressed() -> void:
	get_tree().change_scene_to_file("res://utca.tscn")
