class_name QuitToDesktopButton
extends Button


# Simple Button class quitting the game to the user's OS desktop when clicked.


# ----------------------------- DECLARE VARIABLES ------------------------------



# ---------------------------------- RUN CODE ----------------------------------



# ------------------------------ DECLARE FUNCTIONS -----------------------------


func _on_QuitToDesktopButton_pressed() -> void:
	get_tree().quit()
