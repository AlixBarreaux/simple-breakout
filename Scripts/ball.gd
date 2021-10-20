class_name Ball
extends KinematicBody2D


# ----------------------------- DECLARE VARIABLES ------------------------------

export var current_speed: int = 20

var velocity: Vector2 = Vector2(0.0, 0.0)
var direction: Vector2 = Vector2(0.0, 0.0)

signal died

# ---------------------------------- RUN CODE ----------------------------------

func _ready() -> void:
	# Initialize
	self.velocity.x = [-1, 1] [randi() % 2]
	# 0.8 is the angle which is orienting the ball
	self.velocity.y = [-0.8, 8] [randi() % 2]
	
	self.direction.x = [-1, 1] [randi() % 2]
	self.direction.y = [-0.8, 8] [randi() % 2]


func _physics_process(delta: float) -> void:
	self.velocity = Vector2(0.0, 0.0)
	self.velocity = self.direction * self.current_speed
	
	var collision: KinematicCollision2D = self.move_and_collide(self.velocity * delta * self.current_speed)
	if collision:
		var reflect = collision.remainder.bounce(collision.normal)
		self.direction = self.direction.bounce(collision.normal)
		reflect = self.move_and_collide(reflect)


# ------------------------------ DECLARE FUNCTIONS -----------------------------


func _on_VisibilityNotifier2D_screen_exited() -> void:
	die()


func die() -> void:
	print(self.name, " : Dying!")
	self.emit_signal("died")
