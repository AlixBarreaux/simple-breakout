class_name ScoreGUI
extends HBoxContainer


# ----------------------------- DECLARE VARIABLES ------------------------------

onready var score_counter_label: Label = $ScoreCounterLabel

# ---------------------------------- RUN CODE ----------------------------------

func _ready() -> void:
	self._initialize()


# ------------------------------ DECLARE FUNCTIONS -----------------------------


func _initialize() -> void:
	self.score_counter_label.text = "0"


func _on_ScoreManager_score_set(value: int) -> void:
	self.score_counter_label.text = str(value)
