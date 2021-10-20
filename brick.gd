class_name Brick
extends Node2D


# ----------------------------- DECLARE VARIABLES ------------------------------

export var score_value: int = -1

# ---------------------------------- RUN CODE ----------------------------------


func _ready() -> void:
	self._initialize_asserts()


# ------------------------------ DECLARE FUNCTIONS -----------------------------

func _initialize_asserts() -> void:
	# The Score Value must be set in the inspector!
	assert(self.score_value > -1)


func _on_Area2D_body_entered(_body: PhysicsBody2D) -> void:
	self._disable()


func _disable() -> void:
	$Area2D.get_child(0).set_deferred("disabled", true)
	$StaticBody2D.get_child(0).set_deferred("disabled", true)
	self.hide()
	
#	get_tree().get_root().get_node("InGameGUI").increase_score(self.score_value)


func _enable() -> void:
	$Area2D.get_child(0).disabled = false
	$StaticBody2D.get_child(0).disabled = false
	self.show()
