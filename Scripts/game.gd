class_name Game
extends Node


# ----------------------------- DECLARE VARIABLES ------------------------------

onready var level_to_load_instance = load(Global.get_level_to_load_path()).instance()


# ---------------------------------- RUN CODE ----------------------------------

#var lives_manager_path: String = "res://Scenes/Sub_Game_Managers/LivesManager.tscn"
#var lives_manager_instance = load(lives_manager_path).instance()


func _ready() -> void:
	self.add_child(level_to_load_instance)
	self.move_child(level_to_load_instance, 0)


# ------------------------------ DECLARE FUNCTIONS -----------------------------
