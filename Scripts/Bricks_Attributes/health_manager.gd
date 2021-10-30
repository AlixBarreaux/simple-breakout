class_name HealthManager
extends Node


# ----------------------------- DECLARE VARIABLES ------------------------------

export var current_health: int = 1
export var max_health: int = 1

signal died
signal health_decreased

# ---------------------------------- RUN CODE ----------------------------------


func _ready() -> void:
	self._initialize_asserts()
	
#	self.get_parent().modulate.a = health_percentage


	

# ------------------------------ DECLARE FUNCTIONS -----------------------------

func _initialize_asserts() -> void:
	assert(self.current_health > 0)
	assert(self.current_health <= max_health)


func decrease_current_health(amount: int) -> void:
	self.current_health -= amount
	
	self.emit_signal("health_decreased")
	if self.current_health < 1:
		self.current_health = 0
		die()
		self.get_parent().modulate.a = 0.0
	else:
		var _health_percentage: float = float(self.current_health) / float(self.max_health)
		self.get_parent().modulate.a = _health_percentage


func increase_current_health(amount: int) -> void:
	self.current_health += amount
	if self.current_health > self.max_health:
		self.current_health = self.max_health


func die() -> void:
	self.emit_signal("died")
