extends CharacterBody2D

@export var speed: float = 267
@export var jump_force: float = -00.0
@export var gravity: float = 300.0
@export var jump_interval: float = 0
@export var next_scene: PackedScene

var jump_timer: float = 0.0

func _physics_process(delta: float) -> void:
	# Gravitáció
	if not is_on_floor():
		velocity.y += gravity * delta

	# Folyamatos balra mozgás
	velocity.x = -speed

	# Időzítő frissítése (3s ugrás)
	jump_timer += delta
	if jump_timer >= jump_interval and is_on_floor():
		velocity.y = jump_force
		jump_timer = 0.0

	# Mozgás és ütközések vizsgálata
	var collision = move_and_slide()

	# Ha ütközött valamivel
	if collision:
		for i in range(get_slide_collision_count()):
			var col = get_slide_collision(i)
			var collider = col.get_collider()
			if collider is CharacterBody2D and collider != self:
				if  next_scene:
					get_tree().change_scene_to_packed(next_scene)
