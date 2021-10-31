class_name LevelSelectionButton
extends Button


# When pressed, load a level and add it to the Game scene.


# ----------------------------- DECLARE VARIABLES ------------------------------


var level_name: String = "level"
export var level_number: int = 0


var game_scene_path: String = "res://Scenes/Game.tscn"
export var level_to_load_path: String = ""


onready var name_label: Label = $HBoxContainer/NameLabel
onready var number_label: Label = $HBoxContainer/NumberLabel


# ---------------------------------- RUN CODE ----------------------------------


func _ready() -> void:
	self._initialize_asserts()
	self._initialize()


# ------------------------------ DECLARE FUNCTIONS -----------------------------


func _initialize_asserts() -> void:
#	# The Level Name must be provided in the inspector!
	assert(self.level_name != "")
	assert(self.level_number > 0)
	
	
	# The Button's text will be set by the script.
	# Please clear it in the insepctor.
	assert(self.text == "")
	assert(game_scene_path != "")
	assert(self.level_to_load_path != "")


func _initialize() -> void:
	self.name_label.text = self.level_name
	self.number_label.text = " " + str(self.level_number)


func _on_LevelSelectionButton_pressed() -> void:
	MusicPlayer.start()
	
	
	var error_code: int = 0
#	error_code = self.get_tree().change_scene_to(self.level_to_load)


	# Disable lives
	Global.set_enable_lives(false)
	
	error_code = self.get_tree().change_scene(self.game_scene_path)
	Global.set_level_to_load_path(self.level_to_load_path)
	Global.set_load_next_level(true)


	if error_code != OK:
		printerr("(!) ERROR: In: " + self.name \
		+ "Error code: " + str(error_code))
