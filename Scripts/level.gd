class_name Level
extends Node2D


# ----------------------------- DECLARE VARIABLES ------------------------------

# Exports
#export var current_lives: int = 0
# Level to load when the level is finished
# (If launched from NewGame into the MainMenu)
export var next_level_to_load: PackedScene = null

# Menu to load when the level is finished
# (If launched from LevelSelectionMenu)
var menu_to_load_at_end_path: String = "res://Scenes/GUI/MainMenu.tscn"
#var menu_to_load_at_end: PackedScene = load(menu_to_load_at_end_path)

# Node References
onready var level_transition_timer: Timer = $LevelTransitionTimer

onready var load_next_level: bool = Global.get_load_next_level()

var current_score: int = 0


# ---------------------------------- RUN CODE ----------------------------------

func _ready() -> void:
	self._initialize_asserts()
	self._initialize_signals()
#	self._initialize()
	self.show()
	
#	check_for_next_level_to_load()
#	_on_LevelTransitionTimer_timeout()



#func check_for_next_level_to_load() -> void:
#	if not self.load_next_level:
#		return
#	next_level_to_load = load(menu_to_load_at_end_path)
	

# ------------------------------ DECLARE FUNCTIONS -----------------------------

func _initialize_asserts() -> void:
	assert(self.next_level_to_load != null)


func _initialize_signals() -> void:
	Events.connect("level_finished", self, "on_level_finished")
#	Events.connect("player_defeated", self, "on_player_defeated")
	
#	Events.connect("level_restarted", self, "on_level_restarted")


func on_level_finished() -> void:
	level_transition_timer.start()


# TEST
#func on_player_defeated() -> void:
#	reset()
#
#
#func on_level_restarted() -> void:
#	self.reset
#
#
#func reset() -> void:
#	pass

# END TEST


func _on_LevelTransitionTimer_timeout() -> void:
	# Check wether the next level or the menu to load will be loaded
	if not self.load_next_level:
		Global.replace_scene(self, self.next_level_to_load, self.get_parent(), self.get_index())
	else:
		get_tree().change_scene(menu_to_load_at_end_path)
