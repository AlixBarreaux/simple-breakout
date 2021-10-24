class_name Level
extends Node2D


# ----------------------------- DECLARE VARIABLES ------------------------------

# Exports
export var current_lives: int = 0
# Level to load when the level is finished
# (If launched from NewGame into the MainMenu)
export var next_level_to_load: PackedScene = null

# Menu to load when the level is finished
# (If launched from LevelSelectionMenu)
var menu_to_load_at_end_path: String = "res://Scenes/GUI/MainMenu.tscn"
#var menu_to_load_at_end: PackedScene = load(menu_to_load_at_end_path)

# Node References
onready var level_transition_timer: Timer = $LevelTransitionTimer

onready var load_next_level: bool = Global.load_next_level

var current_score: int = 0


# ---------------------------------- RUN CODE ----------------------------------

func _ready() -> void:
	self._initialize_asserts()
	self._initialize_signals()
	self._initialize()
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


func on_level_finished() -> void:
	level_transition_timer.start()


func _on_LevelTransitionTimer_timeout() -> void:
	# Check wether the next level or the menu to load will be loaded
	if not self.load_next_level:
		Global.replace_scene(self, self.next_level_to_load, self.get_parent(), self.get_index())
	else:
		Global.set_load_next_level(false)
		get_tree().change_scene(menu_to_load_at_end_path)


func _initialize() -> void:
	self.set_lives(self.current_lives)
	self.set_score(0)


# Lives
signal lives_set
func set_lives(value: int) -> void:
	self.current_lives = value
	self.emit_signal("lives_set", value)


func decrease_lives(value: int) -> void:
	self.current_lives -= value
	self.set_lives(value)


func increase_lives(value: int) -> void:
	self.current_lives += value
	self.set_lives(value)


# Score
func set_score(value: int) -> void:
	self.current_score = value


func decrease_score(value: int) -> void:
	self.current_score -= value
	self.set_score(value)


func increase_score(value: int) -> void:
	self.current_score += value
	self.set_score(value)


# Reset the whole GUI elements to 0
func reset() -> void:
	self.set_lives(self.current_lives)
	self.set_score(0)


func _on_Balls_all_balls_died() -> void:
	self.decrease_lives(1)
