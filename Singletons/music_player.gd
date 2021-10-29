# MusicPlayer Singleton
extends AudioStreamPlayer


# ----------------------------- DECLARE VARIABLES ------------------------------

export var music_list_to_play: Array = []

var current_track_index: int = -1

# ---------------------------------- RUN CODE ----------------------------------

func _ready() -> void:
	self._initialize_asserts()
	self.stream = music_list_to_play[1]

# ------------------------------ DECLARE FUNCTIONS -----------------------------

func _initialize_asserts() -> void:
	assert(music_list_to_play != [])
	
	for element in music_list_to_play:
		assert(element is AudioStreamOGGVorbis)


func _initialize() -> void:
	pass


func start() -> void:
	print(self.name, " : Starting!")
	is_stopped = false
	self.play_next_track()


var is_stopped: bool = true
func stop_playing() -> void:
	print(self.name, " : Stopping!")
	is_stopped = true
	self.stop()
	self.current_track_index = -1


func _on_MusicPlayer_finished() -> void:
	if not is_stopped:
		self.play_next_track()


func play_next_track() -> void:
	self.current_track_index += 1
	if self.current_track_index > music_list_to_play.size() - 1:
		self.current_track = 0
	
	self.stream = music_list_to_play[current_track_index]
	self.play()
