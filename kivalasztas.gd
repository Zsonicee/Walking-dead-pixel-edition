extends Node2D



func _on_haz_pressed() -> void:
	get_tree().change_scene_to_file("res://haz.tscn")

func _on_nappali_pressed() -> void:
	get_tree().change_scene_to_file("res://nappalieste.tscn")

func _on_kert_pressed() -> void:
	get_tree().change_scene_to_file("res://kert.tscn")

func _on_utca_pressed() -> void:
	get_tree().change_scene_to_file("res://utca.tscn")


func _on_nappalireggel_pressed() -> void:
	get_tree().change_scene_to_file("res://nappali.tscn")
