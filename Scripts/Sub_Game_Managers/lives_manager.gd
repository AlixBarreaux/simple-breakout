class_name LivesManager
extends Node


# ----------------------------- DECLARE VARIABLES ------------------------------

export var starting_lives: int = 3
var current_lives: int = starting_lives
export var max_lives: int = 6

# Node Paths
export (NodePath) onready var lives_gui_node_path = null

# Node References
onready var lives_gui: Control = null

# Signals
signal lives_set

var signals_connections_list: PoolIntArray = [
	Events.connect("all_balls_died", self, "on_all_balls_died")
	]

# ---------------------------------- RUN CODE ----------------------------------

func _ready() -> void:
	# Enable itself or disable by not executing the initializations
	# LivesGUI will be affected too, see its ready function
	if not Global.get_enable_lives():
		return
	
	self._initialize_asserts()
	self._initialize_signals()
	
	


# ------------------------------ DECLARE FUNCTIONS -----------------------------

func _on_LivesGUI_tree_entered() -> void:
	lives_gui = get_node(lives_gui_node_path)

	# Wait for the lives_gui node to be ready
	# before sending the signal lives_set via set_current_lives() method
	yield(lives_gui, "ready")
	self._initialize()


func _initialize_asserts() -> void:
	# Current Lives must be above 0 in the inspector!
	assert(self.current_lives > 0)


func _initialize_signals() -> void:
	GeneralHelpers.check_for_signals_initialization_errors(self, self.signals_connections_list)

func _initialize() -> void:
	self.set_current_lives(self.current_lives)


# Lives
func set_current_lives(value: int) -> void:
	self.current_lives = value
	self.emit_signal("lives_set", value)


func decrease_current_lives(value: int) -> void:
	self.current_lives -= value
	
	if self.current_lives < 1:
		print(self.name + " : The game is supposed to be over!")
		Events.emit_signal("player_defeated")
	
	self.set_current_lives(self.current_lives)


func increase_current_lives(value: int) -> void:
	self.current_lives += value
	
	if self.current_lives > self.max_lives:
		self.current_lives = self.max_lives
	
	self.set_current_lives(self.current_lives)


func on_all_balls_died() -> void:
	self.decrease_current_lives(1)
