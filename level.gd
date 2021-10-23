class_name Level
extends Node2D


# ----------------------------- DECLARE VARIABLES ------------------------------

export var current_lives: int = 0
export var next_level_to_load: PackedScene = null

var current_score: int = 0


# ---------------------------------- RUN CODE ----------------------------------

func _ready() -> void:
	self._initialize_asserts()
	self._initialize_signals()
	self._initialize()
	self.show()


# ------------------------------ DECLARE FUNCTIONS -----------------------------

func _initialize_asserts() -> void:
	assert(self.next_level_to_load != null)

func _initialize_signals() -> void:
	Events.connect("level_finished", self, "on_level_finished")


func on_level_finished() -> void:
	$LevelTransitionTimer.start()


func _on_LevelTransitionTimer_timeout() -> void:
	Global.replace_scene(self, self.next_level_to_load, self.get_parent(), self.get_index())


func _initialize() -> void:
	self.set_lives(self.current_lives)
	self.set_score(0)


# Lives
signal lives_set
func set_lives(value: int) -> void:
	self.current_lives = value
	self.emit_signal("lives_set", value)


func decrease_lives(value: int) -> void:
	self.current_lives -= value
	self.set_lives(value)


func increase_lives(value: int) -> void:
	self.current_lives += value
	self.set_lives(value)


# Score
func set_score(value: int) -> void:
	self.current_score = value


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


func _on_Balls_all_balls_died() -> void:
	self.decrease_lives(1)
