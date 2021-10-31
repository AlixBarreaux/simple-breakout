class_name Game
extends Node


# ----------------------------- DECLARE VARIABLES ------------------------------


onready var level_to_load_instance = load(Global.get_level_to_load_path()).instance()


# ---------------------------------- RUN CODE ----------------------------------


func _ready() -> void:
	self.add_child(level_to_load_instance)
	self.move_child(level_to_load_instance, 0)


# ------------------------------ DECLARE FUNCTIONS -----------------------------
