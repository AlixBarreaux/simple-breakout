class_name PauseMenu
extends Control


# ----------------------------- DECLARE VARIABLES ------------------------------

# Buttons
onready var resume_button: Button = $ColorRect/VBoxContainer/ResumeButton
onready var options_button: Button = $ColorRect/VBoxContainer/OptionsButton
onready var quit_to_main_menu_button: Button = $ColorRect/VBoxContainer/QuitToMainMenuButton

# Menus to Display
onready var options_menu: Control = $OptionsMenu

# ---------------------------------- RUN CODE ----------------------------------


func _ready() -> void:
	self.hide()


func _unhandled_key_input(_event: InputEventKey) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		if not self.visible:
			self.show()
			self.resume_button.grab_focus()
			get_tree().set_pause(true)
		else:
			self.hide()
			get_tree().set_pause(false)


# ------------------------------ DECLARE FUNCTIONS -----------------------------


func _on_ResumeButton_pressed() -> void:
	self.resume_button.release_focus()
	self.hide()
	get_tree().set_pause(false)


func _on_OptionsButton_pressed() -> void:
	self.options_menu.show()


func _on_OptionsMenu_visibility_changed() -> void:
	if not self.options_menu.visible:
		self.show()
		self.options_button.grab_focus()
