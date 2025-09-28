extends Node
class_name InlineScenePopup

@export_file("*.tscn") var target_scene_path: String
@export var label_text: String = "Ugrás a jelenetre"

var _popup: PopupPanel
var _label: Label
var _go: Button
var _cancel: Button

func _ready() -> void:
	_popup = PopupPanel.new()
	_popup.exclusive = true
	_popup.unresizable = true
	add_child(_popup)

	var margin := MarginContainer.new()
	margin.set_anchors_preset(Control.PRESET_FULL_RECT)
	_popup.add_child(margin)

	var v := VBoxContainer.new(); margin.add_child(v)
	_label = Label.new(); _label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER; v.add_child(_label)
	var h := HBoxContainer.new(); h.alignment = BoxContainer.ALIGNMENT_END; v.add_child(h)
	_go = Button.new(); _go.text = "Ugrás"; h.add_child(_go)
	_cancel = Button.new(); _cancel.text = "Mégse"; h.add_child(_cancel)

	_cancel.pressed.connect(_popup.hide)
	_go.pressed.connect(_on_go)
	set_process_unhandled_key_input(true)

func _unhandled_key_input(e: InputEvent) -> void:
	if e.is_action_pressed("ui_cancel") and _popup.visible:
		_popup.hide()

func show_popup() -> void:
	var nice := target_scene_path == "" ? "" : target_scene_path.get_file().get_basename()
	_label.text = "%s%s".format([label_text, nice == "" ? "" : "\n(" + nice + ")"])
	_popup.size = Vector2(420, 160)
	_popup.popup_centered()
	_popup.show()
	_go.grab_focus()

func _on_go() -> void:
	if target_scene_path == "":
		push_error("InlineScenePopup: target_scene_path nincs beállítva.")
		return
	_popup.hide()
	get_tree().change_scene_to_file(target_scene_path)
