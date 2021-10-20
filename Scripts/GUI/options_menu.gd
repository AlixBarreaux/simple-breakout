class_name OptionsMenu
extends Control


# ----------------------------- DECLARE VARIABLES ------------------------------

onready var back_button: Button = $ColorRect/VBoxContainer/BackButton

# ---------------------------------- RUN CODE ----------------------------------



# ------------------------------ DECLARE FUNCTIONS -----------------------------


func _on_OptionsMenu_visibility_changed() -> void:
	if self.visible:
		self.back_button.grab_focus()


func _on_BackButton_pressed() -> void:
	self.back_button.release_focus()
	self.hide()
