# scripts/Home.gd
extends Control

func _ready() -> void:
	var music_player := AudioStreamPlayer.new()
	# Load the audio stream from your asset folder.
	music_player.stream = preload("res://assets/noodle_cafe.wav")
	music_player.autoplay = true
	add_child(music_player)
	
	# (Optional) Start playing explicitly if not using autoplay.
	music_player.play()
	# Connect the EnterButton's pressed signal.
	$Panel/EnterButton.pressed.connect(_on_enter_clicked)

func _on_enter_clicked() -> void:
	print("Enter button clicked. Changing scene to Main.tscn")
	# Preload the PackedScene and use change_scene_to()
	var cafe_scene := preload("res://scenes/main.tscn")
	get_tree().change_scene_to_file("res://scenes/main.tscn")
