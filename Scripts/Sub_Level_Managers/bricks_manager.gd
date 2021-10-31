class_name BricksManager
extends Node2D


# Scene managing the bricks.
# Each Brick is disabled when "destroyed" by the ball.
# This Scene can reset all the bricks ("undestroy") when the level is restarted.


# ----------------------------- DECLARE VARIABLES ------------------------------

var bricks_counter: int = 0

# Signals to connect to
onready var signals_connections_list: PoolIntArray = [
	Events.connect("level_restarted", self, "reset")
	]

# ---------------------------------- RUN CODE ----------------------------------

func _ready() -> void:
	self._initialize_signals()


# ------------------------------ DECLARE FUNCTIONS -----------------------------

func _initialize_signals() -> void:
	for child in self.get_children():
		child.connect("brick_destroyed", self, "on_brick_destroyed")
		self.bricks_counter += 1
	
	GeneralHelpers.check_for_signals_initialization_errors(self, self.signals_connections_list)


func reset() -> void:
	for child in self.get_children():
		child._enable()


func on_brick_destroyed() -> void:
	self.bricks_counter -= 1
	
	if self.bricks_counter < 1:
		Events.emit_signal("level_finished")
