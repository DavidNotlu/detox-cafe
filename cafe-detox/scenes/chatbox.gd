#extends Control
#
#@onready var npc_text = $NPCtext
#@onready var player_input = $PlayerInput
#
#var npc_responses = [
	#"Hello there! What can I get for you?",
	#"Would you like a coffee?",
	#"We have the best pastries in town!",
	#"Have a seat and relax!",
	#"How’s your day going?"
#]
#
#func _ready():
	#self.visible = true  # Chatbox is always visible
	#npc_text.text = "hey :("  # Initial welcome message
	#player_input.connect("text_submitted", Callable(self, "_on_text_entered"))
#
#func _on_text_entered(text):
	#if text.strip_edges().to_lower() == "bye":
		#npc_text.text = "Goodbye! Come back soon! ☕"
	#else:
		#npc_text.text = npc_responses[randi() % npc_responses.size()]  # NPC gives a random response
	#player_input.text = ""  # Clear the input field
