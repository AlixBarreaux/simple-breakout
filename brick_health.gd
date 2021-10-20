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


func _on_Area2D_body_entered(_body: PhysicsBody2D) -> void:
	self.health_manager.decrease_current_health(1)


func on_died() -> void:
	_disable()
