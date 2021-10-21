class_name LivesGUI
extends HBoxContainer


# ----------------------------- DECLARE VARIABLES ------------------------------

onready var lives_counter_label: Label = $LivesCounterLabel

# ---------------------------------- RUN CODE ----------------------------------


# ------------------------------ DECLARE FUNCTIONS -----------------------------


func _on_LivesManager_lives_set(value: int) -> void:
	self.lives_counter_label.text = str(value)
