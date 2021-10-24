class_name Ball
extends KinematicBody2D


# ----------------------------- DECLARE VARIABLES ------------------------------

export var current_speed: int = 20

var velocity: Vector2 = Vector2(0.0, 0.0)
var direction: Vector2 = Vector2(0.0, 0.0)

signal died

# ---------------------------------- RUN CODE ----------------------------------

func _ready() -> void:
#	# Initialize
#	self.velocity.x = [-1, 1] [randi() % 2]
#	# 0.8 is the angle which is orienting the ball
#	self.velocity.y = [-0.8, 8] [randi() % 2]
#
#	self.direction.x = [-1, 1] [randi() % 2]
#	self.direction.y = [-0.8, 8] [randi() % 2]

	# Initialize the starting direction
	self.direction.y = 1


func _physics_process(delta: float) -> void:
	self.velocity = Vector2(0.0, 0.0)
	self.velocity = self.direction * self.current_speed
	
	var collision: KinematicCollision2D = self.move_and_collide(self.velocity * delta * self.current_speed)
	if collision:
		# TEST
		if collision.collider is Paddle:
			self.direction = get_bounce_direction(collision)
			self.direction.bounce(collision.normal)
#			var reflect = collision.remainder.bounce(collision.normal)
		else:
		# END TEST
			self.direction = self.direction.bounce(collision.normal)
#			var reflect = collision.remainder.bounce(collision.normal)
#			reflect = self.move_and_collide(reflect)
		
		
		if collision.collider.is_in_group("bricks"):
			collision.collider._receive_ball_collision()


# TEST
func get_bounce_direction(collision: KinematicCollision2D):
	var ball_collision_position: Vector2 = collision.position
	# Paddle or anything else
	var collider_global_position: Vector2 = collision.collider.global_position
	
	var vector_between_both: Vector2 = ball_collision_position - collider_global_position
	
	
#	print(collider_global_position, ball_collision_position)
#	print("RETURN: " + str(vector_between_both))
	
	vector_between_both = vector_between_both.normalized()
#	print("NORMALIZED: " + str(vector_between_both))
	return vector_between_both

# END TEST


# ------------------------------ DECLARE FUNCTIONS -----------------------------


func _on_VisibilityNotifier2D_screen_exited() -> void:
	die()


func die() -> void:
	print(self.name, " : Dying!")
	self.emit_signal("died")
