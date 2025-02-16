# scripts/NPC.gd
extends Node2D

var target_position: Vector2 = Vector2.ZERO
var speed: float = 100.0  # Movement speed (pixels per second)
var moving: bool = false

# Called by the Café scene to tell the NPC where to go.
func walk_to(position: Vector2) -> void:
	target_position = position
	moving = true

func _process(delta: float) -> void:
	if moving:
		var direction: Vector2 = (target_position - position).normalized()
		position += direction * speed * delta
		if position.distance_to(target_position) < 5.0:
			position = target_position
			moving = false
			# Once the NPC reaches its spot, start a conversation.
			start_conversation()

func start_conversation() -> void:
	# Find the Dialogue UI node and begin dialogue.
	var dialogue = get_tree().get_root().find_node("Dialogue", true, false)
	if dialogue:
		dialogue.start_dialogue("I really needed a break from all the digital noise!")
