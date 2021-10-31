class_name VersionLabel
extends Label


# Simple script setting the Label's text to "V" and the current project version.
# (set in the ProjectSettings)
# This script must be attached to a Label node. 


# ----------------------------- DECLARE VARIABLES ------------------------------



# ---------------------------------- RUN CODE ----------------------------------


func _ready() -> void:
	self._initialize()


# ------------------------------ DECLARE FUNCTIONS -----------------------------


func _initialize() -> void:
	self.text = "V " + str(ProjectSettings.get_setting("application/config/version"))
