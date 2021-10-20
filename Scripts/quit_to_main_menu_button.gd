class_name QuitToMainMenuButton
extends Button

# Note: Loading a PackedScene with a Control Node containing this Scene
# leads to a crash with a lot of errors about cyclic dependency
# Instead, everything is loaded via a string with the Scene Path to load

# ----------------------------- DECLARE VARIABLES ------------------------------

#export var scene_to_load: PackedScene = null
export var scene_to_load_path: String = "res://Scenes/GUI/MainMenu.tscn"

# ---------------------------------- RUN CODE ----------------------------------

func _ready() -> void:
	self._initialize_asserts()


# ------------------------------ DECLARE FUNCTIONS -----------------------------


func _initialize_asserts() -> void:
	# A Scene To Load (PackedScene) must be provided in the Inspector!
#	assert(self.scene_to_load != null)
	assert(self.scene_to_load_path != "")


func _on_QuitToMainMenuButton_pressed() -> void:
#	get_tree().change_scene_to(self.scene_to_load)
	var error_code: int = 0
	error_code = get_tree().change_scene(self.scene_to_load_path)
	get_tree().set_pause(false)
	
	
#	if error_code == OK:
#		print("Scene successfully loaded: " + str(self.level_to_load))
	if error_code == ERR_CANT_CREATE:
		printerr("(!) ERROR: In level_selection_button.gd")
#		printerr("Couldn't load the PackedScene!")
#	else:
#		printerr("(!) ERROR: In level_selection_button.gd")
#		printerr("(!) Unkown error!")
