extends TextureButton

func _on_texture_button_pressed() -> void:
	get_tree().change_scene_to_file("res://node_2d.tscn")
