class_name InvisibilityManager
extends Node


# Manages the Brick's visibility it's attached to.
# Must absolutely be attached to a Brick.


# ----------------------------- DECLARE VARIABLES ------------------------------



# ---------------------------------- RUN CODE ----------------------------------


func _ready() -> void:
	self._initialize_asserts()
	
	self.get_parent().hide()


# ------------------------------ DECLARE FUNCTIONS -----------------------------


func _initialize_asserts() -> void:
	# This component must be attached to a Brick only!
	assert(self.get_parent() is Brick)


func _on_HealthManager_health_decreased() -> void:
	self.get_parent().show()
