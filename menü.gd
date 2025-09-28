extends Node2D


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://haz.tscn") # Replace with function body.


func _on_texture_button_pressed() -> void:
	get_tree().change_scene_to_file("res://minigame.tscn")
