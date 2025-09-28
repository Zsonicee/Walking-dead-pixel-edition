extends Control

@onready var quest_manager = $CanvasLayer/QuestManager

func _ready():
	var q1 = quest_manager.add_quest("Gyűjts össze 5 almát!")
	var q2 = quest_manager.add_quest("Beszélj a falu vezetőjével!")

	# Teszt: 3 mp múlva teljesítjük az első questet
	await get_tree().create_timer(3.0).timeout
	quest_manager.complete_quest(q1)
