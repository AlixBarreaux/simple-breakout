class_name Brick
extends Node2D


# ----------------------------- DECLARE VARIABLES ------------------------------

export var score_value: int = -1

# ---------------------------------- RUN CODE ----------------------------------


func _ready() -> void:
	self._initialize_asserts()


# ------------------------------ DECLARE FUNCTIONS -----------------------------

func _initialize_asserts() -> void:
	# The Score Value must be set in the inspector!
	assert(self.score_value > -1)


func _disable() -> void:
	self.get_child(0).set_deferred("disabled", true)
	self.hide()


func _enable() -> void:
	self.get_child(0).disabled = false
	self.show()


func _receive_ball_collision() -> void:
	self._disable()
