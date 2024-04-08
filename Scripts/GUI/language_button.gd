class_name LanguageButton
extends Button


# Button Class to select a language.
# In order to create a new LanguageButton, create a scene inheriting this one.
# Then all its info must be provided in the inspector.
# WARNING: DO NOT set any info in the Base LanguageButton scene!

# NOTE: Language Name and Country Name must be written on the language
# of these 2 parameters in order for the player to understand it even though
# s/he doesn't know the name of his language in English.

# NOTE 2: A list of locales can be found there:
# https://docs.godotengine.org/en/stable/tutorials/i18n/locales.html

# Example: Language Name: Deitsch. Country Name: Österreich. Locale: de_AT


# ----------------------------- DECLARE VARIABLES ------------------------------


export var language_name: String = ""
export var country_name: String = ""
export var locale: String = ""

signal selected


# ---------------------------------- RUN CODE ----------------------------------


func _ready() -> void:
	self._initialize_asserts()
	self._initialize()


# ------------------------------ DECLARE FUNCTIONS -----------------------------


func _initialize_asserts() -> void:
	# The Text property will be set automatically, please clear it!
	assert(self.text == "")
	# A Language Name must be seet in the inspector! EG: Deitsch
	assert(self.language_name != "")
	# A Country Name must be seet in the inspector! EG: Österreich
	assert(self.country_name != "")
	# A Locale must be seet in the inspector! EG: de_AT
	assert(self.locale != "")


func _initialize() -> void:
	self.text = self.language_name + " (" + self.country_name + ")"


func _gui_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		TranslationServer.set_locale(self.locale)


func _on_LanguageButton_pressed() -> void:
	self.emit_signal("selected", self)
