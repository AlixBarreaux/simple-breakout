class_name HealthManager
extends Node


# ----------------------------- DECLARE VARIABLES ------------------------------

export var current_health: int = 1
export var max_health: int = 1

# ---------------------------------- RUN CODE ----------------------------------



# ------------------------------ DECLARE FUNCTIONS -----------------------------

func decrease_current_health(amount: int) -> void:
	self.current_health -= amount
	if self.current_health < 0:
		self.current_health = 0
		die()


func increase_current_health(amount: int) -> void:
	self.current_health += amount
	if self.current_health > self.max_health:
		self.current_health = self.max_health


signal died
func die() -> void:
	self.emit_signal("died")
