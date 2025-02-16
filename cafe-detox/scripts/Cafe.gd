# scripts/Cafe.gd
extends Node2D

func _ready() -> void:
	# Wait for 1 second, then spawn the NPC.
	await get_tree().create_timer(1.0).timeout
	spawn_npc()

func spawn_npc() -> void:
	var npc_scene = preload("res://scenes/NPC.tscn").instantiate()
	# Position the NPC offscreen (for example, at the left side).
	npc_scene.position = Vector2(-10, -10)
	add_child(npc_scene)
	# Command the NPC to move to its designated position inside the café.
	npc_scene.walk_to(Vector2(0, 0))
