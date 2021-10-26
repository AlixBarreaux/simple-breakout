class_name OptionsMenu
extends Control


# ----------------------------- DECLARE VARIABLES ------------------------------

# Node Paths
export (NodePath) var language_selection_menu_node_path = null
export (NodePath) var back_button_node_path = null


# Node References
onready var back_button: Button = get_node(self.back_button_node_path)
onready var language_selection_menu: Control = get_node(self.language_selection_menu_node_path)


# ---------------------------------- RUN CODE ----------------------------------


func _ready() -> void:
	self._initialize_asserts()


# ------------------------------ DECLARE FUNCTIONS -----------------------------


func _initialize_asserts() -> void:
	assert(back_button != null)
	assert(language_selection_menu != null)


func _on_OptionsMenu_visibility_changed() -> void:
	if self.visible:
		self.back_button.grab_focus()


func _on_BackButton_pressed() -> void:
	self.back_button.release_focus()
	self.hide()


func _on_LanguageButton_pressed() -> void:
	self.language_selection_menu.show()
