class_name GameOverMenu
extends Control


# ----------------------------- DECLARE VARIABLES ------------------------------

onready var try_again_button: Button = $ColorRect/HBoxContainer/TryAgainButton
onready var quit_to_main_menu_button: Button = $ColorRect/HBoxContainer/QuitToMainMenuButton

# ---------------------------------- RUN CODE ----------------------------------

func _ready() -> void:
	self._initialize_signals()
	if not Global.get_load_next_level():
		try_again_button.hide()


# ------------------------------ DECLARE FUNCTIONS -----------------------------

func _initialize_signals() -> void:
	Events.connect("player_defeated", self, "show")


func _on_GameOverMenu_visibility_changed() -> void:
	if self.visible:
		if try_again_button.visible:
			self.try_again_button.grab_focus()
		else:
			self.quit_to_main_menu_button.grab_focus()


func _on_TryAgainButton_pressed() -> void:
	self.hide()
	Events.emit_signal("level_restarted")
