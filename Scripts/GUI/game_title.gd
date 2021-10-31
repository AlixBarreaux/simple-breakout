class_name GameTitleLabel
extends Label


# Simple script setting the Label's text to the game name. (set in the 
# ProjectSettings)
# This script must be attached to a Label node. 


# ----------------------------- DECLARE VARIABLES ------------------------------



# ---------------------------------- RUN CODE ----------------------------------


func _ready() -> void:
	self._initialize()


# ------------------------------ DECLARE FUNCTIONS -----------------------------


func _initialize() -> void:
	self.text = ProjectSettings.get_setting("application/config/name")
