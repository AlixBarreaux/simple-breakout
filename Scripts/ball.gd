class_name Ball
extends KinematicBody2D

# The ball is a node colliding with any body it encounters.
# On collision, it will bounce with an inverted angle.
# If it gets stuck horizontally and doesn't move up anymore, it'll automatically
# take an angle in order to go up.

# The ball has a "launch_ball" key making it go down. 

# This Scene contains some audio stream players in order to avoid the Bricks
# having an AudioStreamPlayer attached to them, which would lead to many of 
# these node duplicated. It'd lead to performance problems, especially with
# .wav files.



# ----------------------------- DECLARE VARIABLES ------------------------------

export var current_speed: int = 20

# Node References
onready var collision_shape_2D: CollisionShape2D = $CollisionShape2D

onready var spawn_position: Vector2 = self.get_global_position()

var initial_direction: Vector2 = Vector2(0.0, 1.0)

var velocity: Vector2 = Vector2(0.0, 0.0)
var direction: Vector2 = Vector2(0.0, 0.0)

# Vertical angle to give to the ball when it's stuck going from left to right
var free_ball_vertical_angle: float = -0.3

signal died


# Signals to connect to
onready var signals_connections_list: PoolIntArray = [
	Events.connect("player_defeated", self, "_disable"),
	Events.connect("level_restarted", self, "on_level_restarted"),
	Events.connect("level_finished", self, "on_level_finished")
	]

# ---------------------------------- RUN CODE ----------------------------------

func _ready() -> void:
	# Prevent the ball from moving until the player
	# Presses launch_ball key
	self.set_physics_process(false)
	self._initialize_signals()
	
	# Initialize the starting direction
	self.direction = self.initial_direction


func _physics_process(delta: float) -> void:
	self.velocity = Vector2(0.0, 0.0)
	self.velocity = self.direction * self.current_speed
	
	var collision: KinematicCollision2D = self.move_and_collide(self.velocity * delta * self.current_speed)
	if collision:
		
	# Prevent the ball from bouncing from left to right and not
		# being able to go up or down anymore
		if self.direction == Vector2(1.0, 0.0) or self.direction == Vector2(-1.0, 0.0):
			self.direction.y = self.free_ball_vertical_angle


		if collision.collider is Paddle:
			var paddle: Paddle = collision.collider
			direction = (self.global_position - paddle.global_position).normalized()
			$HitAudioStreamPlayer.play()
		else:
			self.direction = self.direction.bounce(collision.normal)
			$HitAudioStreamPlayer.play()
		
			
		if collision.collider.is_in_group("bricks"):
			collision.collider._receive_ball_collision()
			$BrickHitAudioStreamPlayer.play()


func _unhandled_key_input(_event: InputEventKey) -> void:
	if Input.is_action_just_pressed("launch_ball"):
		self.set_physics_process(true)


# ------------------------------ DECLARE FUNCTIONS -----------------------------


func _initialize_signals() -> void:
	GeneralHelpers.check_for_signals_initialization_errors(self, self.signals_connections_list)


# Stop making the Ball die just by disappearing and trigger die()
# via VisibilityNotifier2D. The Level scene will be reloaded and the
# VisibilityNotifier2D screen_exited signal will be connected again.
func on_level_finished() -> void:
	$VisibilityNotifier2D.disconnect("screen_exited", self, "_on_VisibilityNotifier2D_screen_exited")
	_disable()


func get_bounce_direction(collision: KinematicCollision2D) -> Vector2:
	var ball_collision_position: Vector2 = collision.position
	# Paddle or anything else
	var collider_global_position: Vector2 = collision.collider.global_position
	
	var vector_between_both: Vector2 = ball_collision_position - collider_global_position
	
	
	vector_between_both = vector_between_both.normalized()
	return vector_between_both


func _on_VisibilityNotifier2D_screen_exited() -> void:
	die()


func die() -> void:
	self.set_physics_process(false)
	self.direction = self.initial_direction
	self.emit_signal("died")


func respawn() -> void:
	self.set_global_position(self.spawn_position)


func _enable() -> void:
	self.set_physics_process(true)
	self.collision_shape_2D.disabled = false
	set_process_unhandled_key_input(true)
	self.show()


func _disable() -> void:
	set_process_unhandled_key_input(false)
	self.set_physics_process(false)
	self.collision_shape_2D.disabled = true
	self.hide()


func on_level_restarted() -> void:
	self.respawn()
	self.collision_shape_2D.disabled = false
	set_process_unhandled_key_input(true)
	self.show()
