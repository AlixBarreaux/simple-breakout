# MusicPlayer Singleton
extends AudioStreamPlayer

# Music played in the levels. MainMenu stops it and 
# plays its own music in an AudioStreamPlayer node

# ----------------------------- DECLARE VARIABLES ------------------------------


export var music_list_to_play: Array = []

var current_track_index: int = 0

var is_stopped: bool = true


# ---------------------------------- RUN CODE ----------------------------------


func _ready() -> void:
	self._initialize_asserts()
	return


# ------------------------------ DECLARE FUNCTIONS -----------------------------

func _initialize_asserts() -> void:
	assert(music_list_to_play != [])
	
	for element in music_list_to_play:
		assert(element is AudioStreamOGGVorbis)
	
	return


func _initialize() -> void:
	return


func start() -> void:
	is_stopped = false
	self.play_next_track()
	return


func stop_playing() -> void:
	is_stopped = true
	self.stop()
	return


func _on_MusicPlayer_finished() -> void:
	self.play_next_track()
	return


func play_track_at_index(index: int) -> void:
	self.current_track_index = index
	self.stream = music_list_to_play[index]
	self.play()
	return


func play_next_track() -> void:
	self.current_track_index += 1
	if self.current_track_index > music_list_to_play.size() - 1:
		self.current_track_index = 0
	
	self.stream = music_list_to_play[current_track_index]
	self.play()
	
	return
