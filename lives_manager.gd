class_name LivesManager
extends Node


# ----------------------------- DECLARE VARIABLES ------------------------------

export var current_lives: int = 0

export (NodePath) onready var lives_gui_node_path = null

onready var lives_gui: Control = null

signal lives_set

# ---------------------------------- RUN CODE ----------------------------------

func _ready() -> void:
	self._initialize_asserts()

# ------------------------------ DECLARE FUNCTIONS -----------------------------

func _on_LivesGUI_tree_entered() -> void:
	lives_gui = get_node(lives_gui_node_path)

	# Wait for the lives_gui node to be ready
	# before sending the signal lives_set via set_lives() method
	yield(lives_gui, "ready")
	self._initialize()


func _initialize_asserts() -> void:
	# Current Lives must be above 0 in the inspector!
	assert(self.current_lives > 0)


func _initialize_signals() -> void:
	Events.connect("all_balls_died", self, "on_all_balls_died")


func _initialize() -> void:
	self.set_lives(self.current_lives)


# Lives
func set_lives(value: int) -> void:
	self.current_lives = value
	self.emit_signal("lives_set", value)


func decrease_lives(value: int) -> void:
	self.current_lives -= value
	self.set_lives(value)


func increase_lives(value: int) -> void:
	self.current_lives += value
	self.set_lives(value)


func on_all_balls_died() -> void:
	self.decrease_lives(1)

