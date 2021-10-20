class_name CreditsMenu
extends Control


# ----------------------------- DECLARE VARIABLES ------------------------------



# ---------------------------------- RUN CODE ----------------------------------



# ------------------------------ DECLARE FUNCTIONS -----------------------------


func _on_BackButton_pressed() -> void:
	self.release_focus()
	self.hide()


func _on_CreditsMenu_visibility_changed() -> void:
	if self.visible:
		$ColorRect/VBoxContainer/BackButton.grab_focus()
