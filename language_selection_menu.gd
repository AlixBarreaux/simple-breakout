class_name LanguageSelectionMenu
extends Control


# ----------------------------- DECLARE VARIABLES ------------------------------

# Node Paths
export (NodePath) var language_buttons_container_node_path = null

# Node References
onready var language_buttons_container: Control = get_node(self.language_buttons_container_node_path)
onready var back_button: Button = $ColorRect/BackButton

onready var language_button_to_focus: Button = null

# ---------------------------------- RUN CODE ----------------------------------


func _ready() -> void:
#	self.hide()
	self._initialize_asserts()
	self._initialize_signals()
	self._initialize()


# ------------------------------ DECLARE FUNCTIONS -----------------------------


func _initialize_asserts() -> void:
	# The LanguageButtonContainer node path must be specified in the Inspector!
	assert(language_buttons_container_node_path != null)
	# The LanguageButtonsContainer node must have at least one LanguageButton!
	assert(self.language_buttons_container.get_child_count() != 0)


func _initialize_signals() -> void:
	for language_button in self.language_buttons_container.get_children():
		language_button.connect("selected", self, "on_language_button_selected")


func _initialize() -> void:
	# Initialize language button to focus
	for language_button in self.language_buttons_container.get_children():
		assert(language_button is LanguageButton)
		if language_button.locale == TranslationServer.get_locale():
			language_button.grab_focus()
			self.language_button_to_focus = language_button


func _on_LanguageSelectionMenu_visibility_changed() -> void:
	if self.visible:
		self.language_button_to_focus.grab_focus()



func on_language_button_selected(language_button_node_reference: Button) -> void:
	self.language_button_to_focus = language_button_node_reference


func _on_ApplyButton_pressed() -> void:
	TranslationServer.set_locale(self.language_button_to_focus.locale)


func _on_BackButton_pressed() -> void:
	self.back_button.release_focus()
	self.hide()
