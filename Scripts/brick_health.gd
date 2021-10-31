class_name BrickHealth
extends Brick


# ----------------------------- DECLARE VARIABLES ------------------------------

onready var health_manager: Node = $HealthManager

# Signals to initialize
var signals_connections_list: PoolIntArray = [
		health_manager.connect("died", self, "on_died")
		]

# ---------------------------------- RUN CODE ----------------------------------

func _ready() -> void:
	self._initialize_signals()


# ------------------------------ DECLARE FUNCTIONS -----------------------------


func _initialize_signals() -> void:
	GeneralHelpers.check_for_signals_initialization_errors(self, self.signals_connections_list)


func _receive_ball_collision() -> void:
	self.health_manager.decrease_current_health(1)
