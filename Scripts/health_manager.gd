class_name HealthManager
extends Node


# ----------------------------- DECLARE VARIABLES ------------------------------

export var current_health: int = 1
export var max_health: int = 1

signal died
signal health_decreased

# ---------------------------------- RUN CODE ----------------------------------



# ------------------------------ DECLARE FUNCTIONS -----------------------------

func decrease_current_health(amount: int) -> void:
	self.current_health -= amount
	if self.current_health < 1:
		self.current_health = 0
#		self.emit_signal("health_decreased")
		die()


func increase_current_health(amount: int) -> void:
	self.current_health += amount
	if self.current_health > self.max_health:
		self.current_health = self.max_health



func die() -> void:
	self.emit_signal("died")
