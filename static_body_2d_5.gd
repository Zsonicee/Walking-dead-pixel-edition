extends StaticBody2D

@onready var sprite = get_node_or_null("Sprite2D") \
	or get_node_or_null("Sprite") \
	or get_node_or_null("AnimatedSprite2D") \
	or get_node_or_null("AnimatedSprite")

var original_layer := 0
var original_mask := 0
var active := true

func _ready():
	original_layer = collision_layer
	original_mask = collision_mask
	print("Block ready. original_layer=%d original_mask=%d sprite=%s" % [original_layer, original_mask, sprite])

func _process(delta):
	if Input.is_action_just_pressed("interact"):
		active = not active
		if active:
			collision_layer = original_layer
			collision_mask = original_mask
			if sprite:
				sprite.visible = true
			print("Block ENABLED")
		else:
			collision_layer = 0
			collision_mask = 0
			if sprite:
				sprite.visible = false
			print("Block DISABLED")
