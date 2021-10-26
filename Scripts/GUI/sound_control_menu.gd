class_name SoundControlMenu
extends Control


# ----------------------------- DECLARE VARIABLES ------------------------------

# Node Paths
export (NodePath) var back_button_node_path = null

# Node References
onready var back_button: Button = get_node(self.back_button_node_path)


# ---------------------------------- RUN CODE ----------------------------------

func _ready() -> void:
	self._initialize_asserts()

# ------------------------------ DECLARE FUNCTIONS -----------------------------

func _initialize_asserts() -> void:
	assert(self.back_button_node_path != null)


func _on_SoundControlMenu_visibility_changed() -> void:
	if self.visible:
		self.back_button.grab_focus()


func _on_BackButton_pressed() -> void:
	self.back_button.release_focus()
	self.hide()
