extends CanvasLayer
class_name SceneSelector
# Ezt autoloadolni fogjuk, így minden jelenetben elérhető lesz.

# Ide tettem a projektedben létező scene-eket név → path formában.
# A kulcsok a listában megjelenő címkék.
@export var scenes := {
	"Ház": "res://haz.tscn",
	"Kert": "res://kert.tscn",
	"Utca": "res://utca.tscn",
	"Alvás": "res://alvas.tscn",
	"Gép": "res://gep.tscn",
	"Minijáték": "res://minigame.tscn",
	"Reggel a házban": "res://hazreggel.tscn",
	"Game (üres)": "res://game.tscn",
	"Hui": "res://hui.tscn",
	"Node2D (teszt)": "res://node_2d.tscn"
}

var _popup: PopupPanel
var _list: ItemList
var _backdrop: ColorRect

func _ready() -> void:
	# Fél-átlátszó háttér, hogy a játék látszódjon
	_backdrop = ColorRect.new()
	_backdrop.color = Color(0, 0, 0, 0.35)
	_backdrop.visible = false
	_backdrop.mouse_filter = Control.MOUSE_FILTER_STOP
	_backdrop.size = get_viewport_rect().size
	add_child(_backdrop)

	# A kis ablak
	_popup = PopupPanel.new()
	_popup.visible = false
	_popup.size = Vector2(640, 400)
	_popup.popup_window = false
	add_child(_popup)

	var v := VBoxContainer.new()
	v.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	v.size_flags_vertical = Control.SIZE_EXPAND_FILL
	v.custom_minimum_size = _popup.size
	_popup.add_child(v)

	var title := Label.new()
	title.text = "Válaszd ki a jelenetet"
	title.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	title.add_theme_font_size_override("font_size", 24)
	title.add_theme_color_override("font_color", Color(1, 1, 1))
	v.add_child(title)

	_list = ItemList.new()
	_list.size_flags_vertical = Control.SIZE_EXPAND_FILL
	_list.select_mode = ItemList.SELECT_SINGLE
	for key in scenes.keys():
		_list.add_item(key)
	v.add_child(_list)

	var btns := HBoxContainer.new()
	btns.alignment = BoxContainer.ALIGNMENT_END
	btns.size_flags_horizontal = Control.SIZE_EXPAND_FILL

	var cancel := Button.new()
	cancel.text = "Mégse"
	cancel.pressed.connect(_on_cancel)
	btns.add_child(cancel)

	var go := Button.new()
	go.text = "Ugrás"
	go.disabled = true
	_list.item_selected.connect(func(_i): go.disabled = false)
	go.pressed.connect(_on_go)
	btns.add_child(go)

	v.add_child(btns)

	# Esc bezárja
	set_process_unhandled_key_input(true)

func _unhandled_key_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel") and _popup.visible:
		_on_cancel()

func open_selector() -> void:
	_backdrop.visible = true
	_popup.popup_centered()
	_popup.visible = true
	_list.unselect_all()
	await get_tree().process_frame
	_list.grab_focus()

func _on_cancel() -> void:
	_popup.hide()
	_backdrop.visible = false

func _on_go() -> void:
	var selected := _list.get_selected_items()
	if selected.is_empty():
		return
	var label := _list.get_item_text(selected[0])
	var path := scenes.get(label, "")
	if path != "":
		get_tree().change_scene_to_file(path)


func _on_pressed() -> void:
	pass # Replace with function body.
