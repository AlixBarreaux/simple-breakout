class_name LivesGUI
extends HBoxContainer


# ----------------------------- DECLARE VARIABLES ------------------------------

onready var lives_counter_label: Label = $LivesCounterLabel

# ---------------------------------- RUN CODE ----------------------------------

func _ready() -> void:
	# Enable itself or disable by not executing the initializations
	# Also hide itself instead of sitting there at 0 (monitored by LivesManager
	# which is enabled or not too
	if not Global.get_enable_lives():
		self.hide()
		return

#	self._initialize_signals()
	pass

# ------------------------------ DECLARE FUNCTIONS -----------------------------


func _initialize_signals() -> void:
#	Events.connect("level_restarted", self, "reset")
	pass


func _on_LivesManager_lives_set(value: int) -> void:
	self.lives_counter_label.text = str(value)
