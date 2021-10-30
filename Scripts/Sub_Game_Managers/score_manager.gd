class_name ScoreManager
extends Node


# ----------------------------- DECLARE VARIABLES ------------------------------

var current_score: int = 0

# Node Paths
export (NodePath) onready var score_gui_node_path = null

# Node References
onready var score_gui: Control = null

# Signals
signal score_set

# ---------------------------------- RUN CODE ----------------------------------


func _ready() -> void:
	self._initialize_signals()


# ------------------------------ DECLARE FUNCTIONS -----------------------------


func _on_ScoreGUI_tree_entered() -> void:
	score_gui = get_node(score_gui_node_path)

	# Wait for the score_gui node to be ready
	# before sending the signal score_set via set_current_score() method
	yield(score_gui, "ready")
	self._initialize()

	
func _initialize_signals() -> void:
	Events.connect("score_changed", self, "on_score_changed")


func _initialize() -> void:
	self.set_current_score(self.current_score)


func on_score_changed(value: int) -> void:
	self.increase_current_score(value)


func set_current_score(value: int) -> void:
	self.current_score = value
	self.emit_signal("score_set", value)


func decrease_current_score(value: int) -> void:
	self.current_score -= value
	self.set_current_score(self.current_score)


func increase_current_score(value: int) -> void:
	self.current_score += value
	self.set_current_score(self.current_score)
