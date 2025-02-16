# scripts/Cafe.gd
extends Node

func _ready() -> void:
	print("Cafe.gd _ready() called")
	var timer = get_tree().create_timer(1.0)
	print("Timer created; waiting for timeout")
	await timer.timeout
	print("Timer finished; calling spawn_npc()")
	spawn_npc()

func spawn_npc() -> void:
	var npc_scene = preload("res://scenes/NPC.tscn").instantiate()
	npc_scene.position = Vector2(-100, 250)
	print("Spawning NPC at position: ", npc_scene.position)
	add_child(npc_scene)
	npc_scene.walk_to(Vector2(250, 250))
