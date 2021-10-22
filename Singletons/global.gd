# Global Singleton
extends Node


# ----------------------------- DECLARE VARIABLES ------------------------------


# ---------------------------------- RUN CODE ----------------------------------


# ------------------------------ DECLARE FUNCTIONS -----------------------------

func replace_scene(scene_to_delete: Node, scene_to_load: PackedScene, node_to_attach_to: Node, node_to_attch_to_index: int) -> void:
	scene_to_delete.queue_free()
#
	var scene_to_load_instance: Node = scene_to_load.instance()
	
	node_to_attach_to.add_child(scene_to_load_instance)
	node_to_attach_to.move_child(scene_to_load_instance, node_to_attch_to_index)
