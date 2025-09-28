# Area2D.gd
extends Area2D



func _ready():
	# connect signal via code
	self.body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node) -> void:
	if body is RigidBody2D:
		# safely delete after physics step
		body.call_deferred("queue_free")
