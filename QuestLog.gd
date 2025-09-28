# scripts/QuestLog.gd (Godot 4)
extends CanvasLayer
class_name QuestLog

@onready var list: VBoxContainer = %List

# egyszerű prefab a sorokhoz:
var EntryScene := preload("res://haz.tscn")
var entries := {} # id -> Node

func _ready() -> void:
	# feliratkozunk a QuestManager jeleire
	QuestManager.quest_started.connect(_on_started)
	QuestManager.quest_updated.connect(_on_updated)
	QuestManager.quest_completed.connect(_on_completed)
	QuestManager.quest_removed.connect(_on_removed)

func _on_started(id: String) -> void:
	var data = QuestManager.get_data(id)
	var entry: Control = EntryScene.instantiate()
	entry.setup(id, data.title, data.desc, data.progress, data.goal)
	list.add_child(entry)
	entries[id] = entry

func _on_updated(id: String) -> void:
	if not entries.has(id): return
	var data = QuestManager.get_data(id)
	(entries[id] as Node).call("update_progress", data.progress, data.goal)

func _on_completed(id: String) -> void:
	if not entries.has(id): return
	(entries[id] as Node).call("mark_done")
	# 2s múlva szépen eltűnik
	get_tree().create_timer(2.0).timeout.connect(func():
		if entries.has(id):
			(entries[id] as Node).call("fade_and_free")
			entries.erase(id))

func _on_removed(id: String) -> void:
	if not entries.has(id): return
	(entries[id] as Node).call("fade_and_free")
	entries.erase(id)
