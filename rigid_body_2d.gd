# RigidBody2D script
extends RigidBody2D

func _on_RigidBody2D_area_entered(area):
	# optionally check the area's name or group to onl	y react to specific areas:
	# if not area.is_in_group("death_zone"): return
	call_deferred("queue_free")
	
