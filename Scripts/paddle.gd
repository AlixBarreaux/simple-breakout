class_name Paddle
extends KinematicBody2D


# ----------------------------- DECLARE VARIABLES ------------------------------

export var current_speed: int = 1200

var velocity: Vector2 = Vector2(0.0, 0.0)


# Node References
onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

# TEST
onready var paddle_width: int = $CollisionShape2D.shape.get_extents().x setget , get_paddle_width
# END TEST


# Signals to initialize
var signals_connections_list: PoolIntArray = [
	Events.connect("player_defeated", self, "_disable"),
	Events.connect("level_finished", self, "_disable"),
	Events.connect("level_started", self, "_enable")
	]


# ---------------------------------- RUN CODE ----------------------------------


func _physics_process(_delta: float) -> void:
	self.velocity = Vector2(0.0, 0.0)
	if Input.is_action_pressed("move_left"):
		self.velocity.x -= 1
	if Input.is_action_pressed("move_right"):
		self.velocity.x += 1

	self.velocity *= self.current_speed

	self.velocity = self.move_and_slide(self.velocity)


# ------------------------------ DECLARE FUNCTIONS -----------------------------


func _ready() -> void:
	self._initialize_signals()


func _initialize_signals() -> void:
	GeneralHelpers.check_for_signals_initialization_errors(self, self.signals_connections_list)


func _disable() -> void:
	collision_shape_2d.disabled = true
	self.set_physics_process(false)
	self.hide()


func _enable() -> void:
	collision_shape_2d.disabled = false
	self.set_physics_process(true)
	self.show()


# NOT REQUIRED?
# TEST
func get_paddle_width() -> int:
	return paddle_width
# END TEST
