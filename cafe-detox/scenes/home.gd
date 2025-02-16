# scripts/Home.gd
extends Control

func _ready() -> void:
	# Connect the EnterButton's pressed signal.
	$Panel/EnterButton.pressed.connect(_on_enter_clicked)

func _on_enter_clicked() -> void:
	print("Enter button clicked. Changing scene to Main.tscn")
	# Preload the PackedScene and use change_scene_to()
	var cafe_scene := preload("res://scenes/main.tscn")
	get_tree().change_scene_to_file("res://scenes/main.tscn")
