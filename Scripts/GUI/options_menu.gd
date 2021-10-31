class_name OptionsMenu
extends Control


# Menu containing other specialized options submenus to display.


# ----------------------------- DECLARE VARIABLES ------------------------------


# Node Paths
# Buttons
export (NodePath) var sound_options_button_node_path = null
export (NodePath) var graphics_options_button_node_path = null
export (NodePath) var language_button_node_path = null
export (NodePath) var back_button_node_path = null

# Menus to display
export (NodePath) var sound_options_menu_node_path = null
export (NodePath) var graphics_options_menu_node_path = null
export (NodePath) var language_selection_menu_node_path = null



# Node References
# Buttons
onready var back_button: Button = get_node(self.back_button_node_path)
onready var sound_options_button = get_node(self.sound_options_button_node_path)
onready var graphics_options_button = get_node(self.graphics_options_button_node_path)
onready var language_button: Button = get_node(self.language_button_node_path)


# Menus to display
onready var sound_options_menu = get_node(self.sound_options_menu_node_path)
onready var graphics_options_menu = get_node(self.graphics_options_menu_node_path)
onready var language_selection_menu: Control = get_node(self.language_selection_menu_node_path)


# ---------------------------------- RUN CODE ----------------------------------


func _ready() -> void:
	self._initialize_asserts()


# ------------------------------ DECLARE FUNCTIONS -----------------------------


func _initialize_asserts() -> void:
	# Buttons
	assert(self.language_button_node_path != null)
	assert(self.back_button_node_path != null)

	# Menus to display
	assert(self.sound_options_menu_node_path != null)
	assert(self.graphics_options_menu_node_path != null)
	assert(self.language_selection_menu_node_path != null)


func _on_OptionsMenu_visibility_changed() -> void:
	if self.visible:
		self.back_button.grab_focus()


# Buttons Signals
func _on_BackButton_pressed() -> void:
	self.back_button.release_focus()
	self.hide()


func _on_SoundOptionsButton_pressed() -> void:
	self.sound_options_menu.show()


func _on_GraphicsOptionsButton_pressed() -> void:
	self.graphics_options_menu.show()


func _on_LanguageButton_pressed() -> void:
	self.language_selection_menu.show()


# Visibility Changed CanvasItem Signals
func _on_LanguageSelectionMenu_visibility_changed() -> void:
	if not self.language_selection_menu.visible:
		self.language_button.grab_focus()


func _on_GraphicsOptionsMenu_visibility_changed() -> void:
	if not self.graphics_options_menu.visible:
		self.graphics_options_button.grab_focus()


func _on_SoundOptionsMenu_visibility_changed() -> void:
	if not self.sound_options_menu.visible:
		self.sound_options_button.grab_focus()
