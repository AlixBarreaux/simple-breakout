class_name Brick
extends Node2D


# ----------------------------- DECLARE VARIABLES ------------------------------

export var score_value: int = -1

onready var collision_polygon_2D: CollisionPolygon2D = $CollisionPolygon2D

signal brick_destroyed

# ---------------------------------- RUN CODE ----------------------------------


func _ready() -> void:
	self._initialize_asserts()


# ------------------------------ DECLARE FUNCTIONS -----------------------------

func _initialize_asserts() -> void:
	# The Score Value must be set in the inspector!
	assert(self.score_value > -1)
	assert(self.get_child_count() > 0)


func _disable() -> void:
	collision_polygon_2D.set_deferred("disabled", true)
	self.hide()


func _enable() -> void:
	collision_polygon_2D.set_deferred("disabled", false)
	self.show()


func on_died() -> void:
	self._disable()
	self.emit_signal("brick_destroyed")


func _receive_ball_collision() -> void:
	self._disable()
	self.on_died()
