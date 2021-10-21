class_name BricksManager
extends Node2D


# ----------------------------- DECLARE VARIABLES ------------------------------



# ---------------------------------- RUN CODE ----------------------------------

func _ready() -> void:
	self._initialize_signals()


# ------------------------------ DECLARE FUNCTIONS -----------------------------

func _initialize_signals() -> void:
	for child in self.get_children():
		child.connect("brick_destroyed", self, "on_brick_destroyed")
		print(child)


func on_brick_destroyed() -> void:
	print("on_brick_destroyed() triggered!")
	if self.get_child_count() < 1:
		print(str(self.name) + ": There is no brick left!")
	else:
		print("There is at least one brick remaining!")
