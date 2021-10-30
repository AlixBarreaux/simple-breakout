class_name GameTitleLabel
extends Label


# ----------------------------- DECLARE VARIABLES ------------------------------



# ---------------------------------- RUN CODE ----------------------------------

func _ready() -> void:
	self._initialize()

# ------------------------------ DECLARE FUNCTIONS -----------------------------

func _initialize() -> void:
	self.text = ProjectSettings.get_setting("application/config/name")
