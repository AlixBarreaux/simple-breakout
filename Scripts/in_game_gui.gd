class_name InGameGUI
extends Control


# ----------------------------- DECLARE VARIABLES ------------------------------

export var current_lives: int = 0
var current_score: int = 0

onready var lives_counter_label: Label = $HBoxContainer/LivesContainer/LivesCounterLabel
onready var score_counter_label: Label = $HBoxContainer/ScoreContainer/ScoreCounterLabel


# ---------------------------------- RUN CODE ----------------------------------

func _ready() -> void:
	self._initialize()


# ------------------------------ DECLARE FUNCTIONS -----------------------------


func _initialize() -> void:
	self.set_lives(self.current_lives)
	self.set_score(0)


# Lives
func set_lives(value: int) -> void:
	self.current_lives = value
	lives_counter_label.text = str(self.current_lives)


func decrease_lives(value: int) -> void:
	self.current_lives -= value
	self.set_lives(value)


func increase_lives(value: int) -> void:
	self.current_lives += value
	self.set_lives(value)


# Score
func set_score(value: int) -> void:
	self.current_score = value
	score_counter_label.text = str(self.current_score)


func decrease_score(value: int) -> void:
	self.current_score -= value
	self.set_score(value)


func increase_score(value: int) -> void:
	self.current_score += value
	self.set_score(value)


# Reset the whole GUI elements to 0
func reset() -> void:
	self.set_lives(self.current_lives)
	self.set_score(0)
