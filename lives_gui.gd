extends HBoxContainer


# ----------------------------- DECLARE VARIABLES ------------------------------

#export var current_lives: int = 0

onready var lives_counter_label: Label = $LivesCounterLabel

# ---------------------------------- RUN CODE ----------------------------------

func _ready() -> void:
	self._initialize()
	pass

# ------------------------------ DECLARE FUNCTIONS -----------------------------


func _initialize() -> void:
	self.lives_counter_label.text = "0"


func _on_LivesManager_lives_set(value: int) -> void:
	self.lives_counter_label.text = str(value)
