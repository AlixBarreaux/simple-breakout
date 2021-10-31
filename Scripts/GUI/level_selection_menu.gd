class_name LevelSelectionMenu
extends Control


# Menu containing LevelSelectionButton(s)
# Each of these buttons must have all of their value set correctly in the
# inspector


# ----------------------------- DECLARE VARIABLES ------------------------------

export (NodePath) var first_button_to_focus_node_path = null

onready var first_button_to_focus: Button = get_node(first_button_to_focus_node_path)


# ---------------------------------- RUN CODE ----------------------------------


func _ready() -> void:
	self._initialize_asserts()


# ------------------------------ DECLARE FUNCTIONS -----------------------------


func _initialize_asserts() -> void:
	assert(self.first_button_to_focus_node_path != null)


func _on_LevelSelectionMenu_visibility_changed() -> void:
	if self.visible:
		first_button_to_focus.grab_focus()


func _on_BackButton_pressed() -> void:
	first_button_to_focus.release_focus()
	self.hide()
