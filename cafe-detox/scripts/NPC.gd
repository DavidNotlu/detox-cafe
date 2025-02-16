extends CharacterBody2D

# Preload the ChatGPTIntegration script
const ChatGPTIntegration = preload("res://scripts/chatgpt_integration.gd")

var state: String = "stressed"
var personality: String = ""

func _ready() -> void:
	load_personality()

func load_personality() -> void:
	var personalities = {
		"stressed": "I’m overwhelmed by constant notifications!",
		"calm": "I feel at peace in this warm sanctuary."
	}
	personality = personalities.get(state, "I have no feelings right now.")
	print("NPC personality: ", personality)

func interact() -> void:
	# Create an instance of ChatGPTIntegration
	var chat_gpt = ChatGPTIntegration.new()
	chat_gpt.get_response(personality, "Hello, can I help you relax?", self, "_on_chat_response")

func _on_chat_response(result: int, response_code: int, headers: Array, body: PackedByteArray) -> void:
	var json = JSON.new()
	var parse_result = json.parse(body.get_string_from_utf8())
	if parse_result.error == OK and parse_result.result is Dictionary:
		var choices = parse_result.result.get("choices", [])
		if choices.size() > 0:
			var message = choices[0].get("message", {})
			var reply: String = message.get("content", "")
			print("ChatGPT Response: ", reply)
			if reply.find("relax") >= 0:
				state = "calm"
			else:
				state = "stressed"
			update_state()

func update_state() -> void:
	load_personality()
	# Update animations, visuals, or sounds as needed.
