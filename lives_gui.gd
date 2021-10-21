class_name LivesGUI
extends HBoxContainer


# ----------------------------- DECLARE VARIABLES ------------------------------

onready var lives_counter_label: Label = $LivesCounterLabel

# ---------------------------------- RUN CODE ----------------------------------

func _ready() -> void:
	self._initialize()


# ------------------------------ DECLARE FUNCTIONS -----------------------------


func _initialize() -> void:
	self.lives_counter_label.text = "0"


func _on_LivesManager_lives_set(value: int) -> void:
	self.lives_counter_label.text = str(value)
