class_name LevelSelectionMenu
extends Control


# ----------------------------- DECLARE VARIABLES ------------------------------

onready var back_button_pressed: Button = $BackButton


# ---------------------------------- RUN CODE ----------------------------------



# ------------------------------ DECLARE FUNCTIONS -----------------------------



func _on_LevelSelectionMenu_visibility_changed() -> void:
	if self.visible:
		$LevelSelectionButton.grab_focus()


func _on_BackButton_pressed() -> void:
	$LevelSelectionButton.release_focus()
	self.hide()
