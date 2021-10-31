class_name BallsManager
extends Node2D


# Node managing the Balls


# ----------------------------- DECLARE VARIABLES ------------------------------


onready var ball: KinematicBody2D = $Ball

# Signals to connect to
onready var signals_connections_list: PoolIntArray = [
	self.ball.connect("died", self, "on_ball_died")
	]


# ---------------------------------- RUN CODE ----------------------------------



func _ready() -> void:
	self._initialize_signals()


# ------------------------------ DECLARE FUNCTIONS -----------------------------


func _initialize_signals() -> void:
	GeneralHelpers.check_for_signals_initialization_errors(self, self.signals_connections_list)


# To modify in case there are several balls since it's designed for 1 only
func on_ball_died() -> void:
	Events.emit_signal("all_balls_died")
	self.ball.respawn()
