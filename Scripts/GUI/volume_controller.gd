class_name VolumeController
extends Control


# Base Class Menu to control the sound on an audio bus.
# In order to control a specific audio bus, inherit this scene
# and provide an audio bus name in the inspector.


# ----------------------------- DECLARE VARIABLES ------------------------------


export (String) var audio_bus_name = ""

# Node References
onready var slider: Slider = $HSlider


#onready var audio_bus_index: int = AudioServer.get_bus_index(self.audio_bus_name)
onready var audio_bus_index: int = -1


# ---------------------------------- RUN CODE ----------------------------------


#func _enter_tree() -> void:
##	audio_bus_index = AudioServer.get_bus_index(self.audio_bus_name)
#	print("\n ENTER TREE: ")
#	print(self.name, " : Audio bus name: ", audio_bus_name)
#	print(self.name, " : Audio bus index: ", audio_bus_index)


func _ready() -> void:
#	self._initialize_asserts()
	self._initialize()
	audio_bus_index = AudioServer.get_bus_index(self.audio_bus_name)

	print("\nREADY: ")
	print(self.name, " : Audio bus name: ", audio_bus_name)
	print(self.name, " : Audio bus index: ", audio_bus_index)
	
	slider.connect("value_changed", self, "_on_Slider_value_changed")

#	AudioServer.set_bus_volume_db(audio_bus_index, -80)


# ------------------------------ DECLARE FUNCTIONS -----------------------------


func _initialize_asserts() -> void:
#	print(self.name, " : Audio bus name: ", audio_bus_name)
#	assert(self.audio_bus_name != "")
	pass


func _initialize() -> void:
	self.slider.min_value = -80
	self.slider.max_value = 0
	
	self.slider.value = self.slider.min_value / 2


func _on_Slider_value_changed(value) -> void:
#	print("\nSLIDER VALUE CHANGED: ")
#	print(self.name, " : Audio bus name: ", audio_bus_name)
#	print(self.name, " : Audio bus index: ", audio_bus_index)
#	if self.slider.value == self.slider.min_value:
	if value == self.slider.min_value:
		AudioServer.set_bus_mute(self.audio_bus_index, true)
	else:
		AudioServer.set_bus_mute(self.audio_bus_index, false)
#		AudioServer.set_bus_volume_db(audio_bus_index, self.slider.value)
		AudioServer.set_bus_volume_db(audio_bus_index, value)

	print("VALUE: ", value)
