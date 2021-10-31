class_name SplashScreenMenu
extends Control


# Booting screen (normally) set as the main scene in the ProjectSettings in 
# order to make it run when the user starts the game.
# When a key is pressed or the whole animation process is finished, it then 
# loads a scene (MainMenu normally)


# ----------------------------- DECLARE VARIABLES ------------------------------

export var next_scene_to_load_path: String = ""

# Node References
onready var animation_tree: AnimationTree = $AnimationTree

# ---------------------------------- RUN CODE ----------------------------------


func _ready() -> void:
	animation_tree.set_active(true)


func _unhandled_key_input(event: InputEventKey) -> void:
	if event:
		self.set_process_unhandled_key_input(false)
		skip_to_next_scene_to_load()


# ------------------------------ DECLARE FUNCTIONS -----------------------------


func _initiliaze_asserts() -> void:
	assert(self.next_scene_to_load_path != "")


func skip_to_next_scene_to_load() -> void:
	get_tree().change_scene(next_scene_to_load_path)
