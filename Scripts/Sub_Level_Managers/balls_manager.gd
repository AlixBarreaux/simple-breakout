class_name BallsManager
extends Node2D


# ----------------------------- DECLARE VARIABLES ------------------------------

#signal ball_died

# ---------------------------------- RUN CODE ----------------------------------

func _ready() -> void:
	self._initialize_signals()


# ------------------------------ DECLARE FUNCTIONS -----------------------------

func _initialize_signals() -> void:
	# warning-ignore: return_value_discarded
	$Ball.connect("died", self, "on_ball_died")




# To modify in case there are several balls since it's designed for 1 only
func on_ball_died() -> void:
	print(str(self.name) + " : A ball died!")
	Events.emit_signal("all_balls_died")
	$Ball.respawn()
