class_name ScoreGUI
extends HBoxContainer


# GUI displaying and updating the player's score based on the
# ScoreManager Scene.
# This Node must work with the ScoreManager by connecting their signals together
# manually in the node tab


# ----------------------------- DECLARE VARIABLES ------------------------------


onready var score_counter_label: Label = $ScoreCounterLabel


# ---------------------------------- RUN CODE ----------------------------------


# ------------------------------ DECLARE FUNCTIONS -----------------------------


func _on_ScoreManager_score_set(value: int) -> void:
	self.score_counter_label.text = str(value)
