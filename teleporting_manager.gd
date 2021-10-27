class_name TeleportingManager
extends Node


# ----------------------------- DECLARE VARIABLES ------------------------------

export var teleport_randomly: bool = false

#onready var starting_position: Vector2 = self.get_parent().get_global_position()
#onready var parent_starting_position: Vector2 = Vector2(0.0, 0.0)

onready var teleport_locations: Node2D = $TeleportLocations

var current_parent_global_position: Vector2 = Vector2(0.0, 0.0)
var current_teleport_point_index: int = -1
var teleport_locations_list: Array = []

# Random numbers
var rng = RandomNumberGenerator.new()
var random_current_teleport_point_index: int = 0

# ---------------------------------- RUN CODE ----------------------------------



func _ready() -> void:
	self._initialize_asserts()
	self._initialize()


# ------------------------------ DECLARE FUNCTIONS -----------------------------


func _initialize_asserts() -> void:
	# This scene must be attached to another node
	assert(self.get_parent() != null)
	# This scene's parent must be a Brick
	assert(self.get_parent() is KinematicBody2D)
	# TeleportLocations must have at least 2 children (see also the next assert)
	assert(self.teleport_locations.get_child_count() > 1)
	# TeleportLocations children must all be a node of type Position2D
	for child in self.teleport_locations.get_children():
		assert(child is Position2D)
	
	# At least one Position2D must have a different location from the others!
	# v
	# TO FINISH IF NEEDED!
#	var _has_one_child_different_location: bool = false
#	var _teleport_location_comparison: Vector2 = Vector2(0.0, 0.0)
#
#	for child in self.teleport_locations.get_children():
#		if child.get_global_position() != _teleport_location_comparison:
#			_has_one_child_different_location = true
#			break
#		_teleport_location_comparison = child.get_global_position()
#	print(_has_one_child_different_location)


func _initialize() -> void:
	for position_2d in teleport_locations.get_children():
		teleport_locations_list.append(position_2d)
	
	self.get_parent().set_global_position(teleport_locations_list[0].get_global_position())


func _on_NextTeleportationTimer_timeout() -> void:
	if not self.teleport_randomly:
		current_teleport_point_index += 1
		if current_teleport_point_index > teleport_locations_list.size() - 1:
			current_teleport_point_index = 0
			
		current_parent_global_position = self.teleport_locations_list[current_teleport_point_index].get_global_position()
	else:
		rng.randomize()
		random_current_teleport_point_index = rng.randi_range(0, teleport_locations_list.size() - 1)
		current_parent_global_position = self.teleport_locations_list[random_current_teleport_point_index].get_global_position()
	
	self.get_parent().set_global_position(current_parent_global_position)
