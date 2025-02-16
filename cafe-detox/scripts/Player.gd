# scripts/Player.gd
extends Node2D

func _ready() -> void:
	# In this example, the player remains stationary.
	pass

# A helper function if you want the player to greet an NPC manually.
func greet_npc() -> void:
	var dialogue = get_tree().get_root().find_node("Dialogue", true, false)
	if dialogue:
		dialogue.start_dialogue("Hello, welcome to our cozy café! How can I help you today?")
