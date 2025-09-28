extends Node2D



func _on_go_button_pressed() -> void:
	get_tree().change_scene_to_file("res://ui/kivalaszats.tscn")


func _on_cancel_button_pressed() -> void:
	visible = false


func _on_scene_valaszto_pressed() -> void:
	visible = true
