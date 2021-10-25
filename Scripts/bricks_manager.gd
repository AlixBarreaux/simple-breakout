class_name BricksManager
extends Node2D


# ----------------------------- DECLARE VARIABLES ------------------------------

var bricks_counter: int = 0

# ---------------------------------- RUN CODE ----------------------------------

func _ready() -> void:
	self._initialize_signals()


# ------------------------------ DECLARE FUNCTIONS -----------------------------

func _initialize_signals() -> void:
	for child in self.get_children():
		child.connect("brick_destroyed", self, "on_brick_destroyed")
		self.bricks_counter += 1
#		print(str(child) + " | " + str(self.bricks_counter))
	
	# TEST
	Events.connect("level_restarted", self, "reset")
	# END TEST


# TEST
func reset() -> void:
	for child in self.get_children():
		child._enable()
# END TEST


func on_brick_destroyed() -> void:
	self.bricks_counter -= 1
	
	if self.bricks_counter < 1:
		Events.emit_signal("level_finished")
