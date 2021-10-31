class_name CreditsMenu
extends Control


# Displays all the assets used, their licenses and special thanks.

# NOTE: A copy of all of its text content is kept there in an effort to be sure
# the game stays in legality:
# res://Miscellaneous/credits.txt


# ----------------------------- DECLARE VARIABLES ------------------------------


export (NodePath) var back_button_node_path = null

onready var back_button: Button = self.get_node(self.back_button_node_path)


# ---------------------------------- RUN CODE ----------------------------------


func _ready() -> void:
	self._initialize_asserts()


# ------------------------------ DECLARE FUNCTIONS -----------------------------


func _initialize_asserts() -> void:
	assert(self.back_button_node_path != null)


func _on_BackButton_pressed() -> void:
	self.release_focus()
	self.hide()


func _on_CreditsMenu_visibility_changed() -> void:
	if self.visible:
		self.back_button.grab_focus()
