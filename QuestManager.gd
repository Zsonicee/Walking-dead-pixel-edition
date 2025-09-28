# QuestManager.gd
extends VBoxContainer

@export var quest_scene: PackedScene
var quests: Array = []

func add_quest(name: String) -> Node:
	if quest_scene == null:
		push_error("quest_scene nincs beállítva!")
		return null

	var quest = quest_scene.instantiate()
	quest.set_quest(name)
	add_child(quest)
	quests.append(quest)
	return quest

func complete_quest(quest: Node) -> void:
	if quest in quests:
		quest.complete()
