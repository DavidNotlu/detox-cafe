extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var music_player := AudioStreamPlayer.new()
	# Load the audio stream from your asset folder.
	music_player.stream = preload("res://assets/Cold Sweats.wav")
	music_player.autoplay = true
	music_player.volume_db = -5.0
	add_child(music_player)
	
	# (Optional) Start playing explicitly if not using autoplay.
	music_player.play()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
