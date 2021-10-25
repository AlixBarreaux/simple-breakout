class_name LevelSelectionMenu
extends Control


# ----------------------------- DECLARE VARIABLES ------------------------------

onready var first_button_to_focus: Button = $ColorRect/LevelSelectionButton
onready var back_button_pressed: Button = $BackButton


# ---------------------------------- RUN CODE ----------------------------------



# ------------------------------ DECLARE FUNCTIONS -----------------------------


func _on_LevelSelectionMenu_visibility_changed() -> void:
	if self.visible:
		$ColorRect/LevelSelectionButton.grab_focus()


func _on_BackButton_pressed() -> void:
	$ColorRect/LevelSelectionButton.release_focus()
	self.hide()
