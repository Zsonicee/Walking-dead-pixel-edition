extends Camera2D

# Például a Camera2D node neve "MyCamera"
onready var my_camera = $CanvasLayer/MyCamera


func _ready():
	# Győződj meg róla, hogy alapból disabled
	my_camera.current = false

func _process(delta):
	if Input.is_action_just_pressed("focus_camera"):
		my_camera.current = true
