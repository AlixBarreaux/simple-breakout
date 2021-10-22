# Settings Singleton
extends Node


# ----------------------------- DECLARE VARIABLES ------------------------------



# ---------------------------------- RUN CODE ----------------------------------

func _ready() -> void:
	TranslationServer.set_locale(OS.get_locale())


# ------------------------------ DECLARE FUNCTIONS -----------------------------

