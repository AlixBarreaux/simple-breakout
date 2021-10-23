# Global Singleton
extends Node


# ----------------------------- DECLARE VARIABLES ------------------------------

var level_to_load_path: String = "" setget set_level_to_load_path, get_level_to_load_path


func set_level_to_load_path(path: String) -> void:
	level_to_load_path = path


func get_level_to_load_path() -> String:
	return level_to_load_path


# ---------------------------------- RUN CODE ----------------------------------


# ------------------------------ DECLARE FUNCTIONS -----------------------------


# The scene calling this singleton will be:
# Deleted an replaced by another.
# Compared to get_tree().change_scene_to() it'll keep all the other nodes
# in the scene tree
func replace_scene(scene_to_delete: Node, scene_to_load: PackedScene, node_to_attach_to: Node, node_to_attach_to_child_index: int) -> void:
	scene_to_delete.queue_free()
#
	var scene_to_load_instance: Node = scene_to_load.instance()
	
	node_to_attach_to.add_child(scene_to_load_instance)
	node_to_attach_to.move_child(scene_to_load_instance, node_to_attach_to_child_index)
 
