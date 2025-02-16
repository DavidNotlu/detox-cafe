extends Node

# Timer variables for NPC spawning
var npc_timer = 0.0
var spawn_interval = 5.0  # spawn an NPC every 5 seconds

# Preload the NPC scene
var npc_scene = preload("res://scenes/NPC.tscn")
var npcs = []

func _ready():
	set_process(true)
	print("Cafe Manager Ready")

func _process(delta):
	npc_timer += delta
	if npc_timer >= spawn_interval:
		spawn_npc()
		npc_timer = 0

func spawn_npc():
	var npc_instance = npc_scene.instance()
	add_child(npc_instance)
	npcs.append(npc_instance)
	# Randomly position the NPC in the café area (adjust as needed)
	npc_instance.position = Vector2(randf_range(100, 400), randf_range(100, 400))
	print("Spawned NPC at: ", npc_instance.position)
