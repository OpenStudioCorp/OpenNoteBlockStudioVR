@tool
extends Control

const USE_EXTERNAL_EDITOR_SETTING_STRING: String = "text_editor/external/use_external_editor"

var settings = EditorInterface.get_editor_settings()
var is_enable_external_editor := settings.get(USE_EXTERNAL_EDITOR_SETTING_STRING)
@onready var check_box: CheckBox = $HBoxContainer/CheckBox

func _ready() -> void:
	check_box.button_pressed = is_enable_external_editor
	

func _on_link_button_pressed() -> void:
	check_box.button_pressed = not check_box.button_pressed

func _on_check_box_toggled(toggled_on: bool) -> void:
	if toggled_on:
		print('Plugin<toggle_external_editor>: enable external editor')
		settings.set(USE_EXTERNAL_EDITOR_SETTING_STRING, true)
	else:
		print('Plugin<toggle_external_editor>: disable external editor')
		settings.set(USE_EXTERNAL_EDITOR_SETTING_STRING, false)
