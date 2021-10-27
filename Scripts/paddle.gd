class_name Paddle
extends KinematicBody2D


# ----------------------------- DECLARE VARIABLES ------------------------------

export var current_speed: int = 1200

var velocity: Vector2 = Vector2(0.0, 0.0)

# TEST
onready var paddle_width: int = $CollisionShape2D.shape.get_extents().x setget , get_paddle_width
# END TEST


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

# TEST
func get_paddle_width() -> int:
	return paddle_width
# END TEST
