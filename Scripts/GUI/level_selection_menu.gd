class_name LevelSelectionMenu
extends Control


# Menu containing LevelSelectionButton(s)
# Each of these buttons must have all of their value set correctly in the
# inspector


# ----------------------------- DECLARE VARIABLES ------------------------------


onready var first_button_to_focus: Button = $ColorRect/ScrollContainer/VBoxContainer/HBoxContainer/LevelSelectionButton
onready var back_button_pressed: Button = $BackButton


# ---------------------------------- RUN CODE ----------------------------------



# ------------------------------ DECLARE FUNCTIONS -----------------------------


func _on_LevelSelectionMenu_visibility_changed() -> void:
	if self.visible:
		$ColorRect/ScrollContainer/VBoxContainer/HBoxContainer/LevelSelectionButton.grab_focus()


func _on_BackButton_pressed() -> void:
	$ColorRect/ScrollContainer/VBoxContainer/HBoxContainer/LevelSelectionButton.release_focus()
	self.hide()
