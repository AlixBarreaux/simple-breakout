class_name MainMenu
extends Control


# Menu containing other submenus to display.


# ----------------------------- DECLARE VARIABLES ------------------------------


var game_scene_path: String = "res://Scenes/Game.tscn"
export var new_game_level_to_load_path: String = ""


# Buttons
onready var new_game_button: Button = $ColorRect/ButtonsContainer/NewGameButton
onready var level_selection_menu_button: Button = $ColorRect/ButtonsContainer/SelectLevelButton
onready var options_button: Button = $ColorRect/ButtonsContainer/OptionsButton
onready var credits_button: Button = $ColorRect/ButtonsContainer/CreditsButton

# Menus to Display
onready var level_selection_menu: Control = $MenusToDisplay/LevelSelectionMenu
onready var options_menu: Control = $MenusToDisplay/OptionsMenu
onready var credits_menu: Control = $MenusToDisplay/CreditsMenu


# ---------------------------------- RUN CODE ----------------------------------


func _ready() -> void:
	self._initialize_asserts()
	self._initialize()
	self.new_game_button.grab_focus()
	
#	Player.stop_playing()


# ------------------------------ DECLARE FUNCTIONS -----------------------------


func _initialize_asserts() -> void:
	assert(self.new_game_level_to_load_path != "")
	return


func _initialize() -> void:
	MusicPlayer.play_track_at_index(1)
	return

# Buttons Signals
func _on_NewGameButton_pressed() -> void:
	var _error_code: int = 0
	
	MusicPlayer.play_track_at_index(2)

	Global.set_enable_lives(true)
	Global.set_load_next_level(false)
	
	_error_code = self.get_tree().change_scene(self.game_scene_path)
	Global.set_level_to_load_path(self.new_game_level_to_load_path)
	
	GeneralHelpers.check_for_generic_error_code(self, _error_code)


func _on_SelectLevelButton_pressed() -> void:
	# warning-ignore: return_value_discarded
	self.release_focus()
	self.level_selection_menu.show()


func _on_OptionsButton_pressed() -> void:
	self.release_focus()
	self.options_menu.show()


func _on_CreditsButton_pressed() -> void:
	self.release_focus()
	self.credits_menu.show()


# Visibility Changed CanvasItem Signals
func _on_LevelSelectionMenu_visibility_changed() -> void:
	if not self.level_selection_menu.visible:
		self.level_selection_menu_button.grab_focus()


func _on_OptionsMenu_visibility_changed() -> void:
	if not self.options_menu.visible:
		self.options_button.grab_focus()


func _on_CreditsMenu_visibility_changed() -> void:
	if not self.credits_menu.visible:
		self.credits_button.grab_focus()
