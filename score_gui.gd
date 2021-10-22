class_name ScoreGUI
extends HBoxContainer


# ----------------------------- DECLARE VARIABLES ------------------------------

onready var score_counter_label: Label = $ScoreCounterLabel

# ---------------------------------- RUN CODE ----------------------------------


# ------------------------------ DECLARE FUNCTIONS -----------------------------


func _on_ScoreManager_score_set(value: int) -> void:
	self.score_counter_label.text = str(value)