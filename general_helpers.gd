class_name GeneralHelpers
extends Reference


# ----------------------------- DECLARE VARIABLES ------------------------------



# ---------------------------------- RUN CODE ----------------------------------

#var signals_connections_list: PoolIntArray = [Events.connect("score_changed", self, "on_score_changed"),
#Events.connect("score_changed", self, "on_score_changed")]

# func _initialize_signals() -> void:
#	check_for_signals_initialization_errors(signals_connections_list)

# ------------------------------ DECLARE FUNCTIONS -----------------------------

# Check if the signals have an error on connection in the initialization process
static func check_for_signals_initialization_errors(caller_node_reference: Node, signals_connections_list: PoolIntArray) -> void:
	var _current_signal_index: int = -1
	
	for signal_to_check in signals_connections_list:
		_current_signal_index += 1
		
		if signal_to_check != OK:
			printerr("(!) ERROR: In " + caller_node_reference.name + " : Signal connection error.\n"
			+ "Signal index: " + str(_current_signal_index)
			+ "\nError ID: " + str(signal_to_check))
	return


static func get_sum(a: int, b: int) -> int:
	return a + b
