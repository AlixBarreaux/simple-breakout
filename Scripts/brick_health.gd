class_name BrickHealth
extends Brick


# ----------------------------- DECLARE VARIABLES ------------------------------

onready var health_manager: Node = $HealthManager

# ---------------------------------- RUN CODE ----------------------------------

func _ready() -> void:
	self._initialize_signals()


# ------------------------------ DECLARE FUNCTIONS -----------------------------


func _initialize_signals() -> void:
	# warning-ignore: return_value_discarded
	health_manager.connect("died", self, "on_died")


func on_died() -> void:
	print(self.name, " : I died.")
	_disable()
	self.emit_signal("brick_destroyed")


func _receive_ball_collision() -> void:
	self.health_manager.decrease_current_health(1)
