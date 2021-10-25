class_name VolumeController
extends Control


# ----------------------------- DECLARE VARIABLES ------------------------------

export var audio_bus_name: String = ""

# Node References
onready var slider: Slider = $HSlider


onready var audio_bus_index: int = AudioServer.get_bus_index(self.audio_bus_name)

# ---------------------------------- RUN CODE ----------------------------------

func _ready() -> void:
	self._initialize_asserts()
	self._initialize()

# ------------------------------ DECLARE FUNCTIONS -----------------------------

func _initialize_asserts() -> void:
	assert(self.audio_bus_name != "")


func _initialize() -> void:
	self.slider.min_value = -80
	self.slider.max_value = 0
	
	self.slider.value = self.slider.min_value / 2


func _on_Slider_value_changed(value: float) -> void:
	if self.slider.value == self.slider.min_value:
		AudioServer.set_bus_mute(self.audio_bus_index, true)
	else:
		AudioServer.set_bus_mute(self.audio_bus_index, false)
		AudioServer.set_bus_volume_db(audio_bus_index, self.slider.value)
