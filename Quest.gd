extends HBoxContainer

@onready var checkbox: CheckBox = $CheckBox
@onready var label: Label = $Label

var completed: bool = false

func set_quest(name: String):
	label.text = name
	checkbox.mouse_filter = Control.MOUSE_FILTER_IGNORE  # kattintás figyelmen kívül
	checkbox.button_pressed = completed

func complete():
	completed = true
	checkbox.button_pressed = true
