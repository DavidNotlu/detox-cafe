# scripts/Main.gd
extends Node2D

func _ready() -> void:
	var cafe_scene = preload("res://scenes/main.tscn").instantiate()
	add_child(cafe_scene)
