class_name VersionLabel
extends Label


# ----------------------------- DECLARE VARIABLES ------------------------------



# ---------------------------------- RUN CODE ----------------------------------

func _ready() -> void:
	self._initialize()

# ------------------------------ DECLARE FUNCTIONS -----------------------------

func _initialize() -> void:
	self.text = "V " + str(ProjectSettings.get_setting("application/config/version"))
