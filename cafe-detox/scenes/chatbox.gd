extends Control

@onready var npc_text = $NPCtext        # Label node for NPC responses.
@onready var player_input = $PlayerInput  # LineEdit node for player input.

var OPENAI_API_KEY = "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"
var OPENAI_API_URL = "https://api.openai.com/v1/chat/completions"

func _ready():
	self.visible = true  # Chatbox is always visible.
	npc_text.text = "Isnt it great that we're never leaving?"  # Initial welcome message.
	player_input.connect("text_submitted", Callable(self, "_on_text_entered"))

func _on_text_entered(text: String) -> void:
	if text.strip_edges().to_lower() == "bye":
		npc_text.text = "Goodbye! Come back soon! ☕"
	else:
		call_chatgpt(text)
	player_input.text = ""  # Clear the input field.

func call_chatgpt(prompt: String) -> void:
	var http_request = HTTPRequest.new()
	add_child(http_request)  # Add HTTPRequest node to the scene.

	var payload = {
		"model": "gpt-3.5-turbo",
		"messages": [
			{
				"role": "system",
				"content": "You are a crazy girlfriend that just invited us to your house. Respond only in sentences of exactly 7 words. The goal of the player is to try to escape the house. If the player gives a bad attempt or response then say: you think you can escape me?!. If the player gives a good reason to leave the house then say: okay you can leave. After responding with either of the good or bad prompt, do not respond to the player anymore. Only give the good or bad response after 2 or 3 interactions with the player so it doesnt end too early"
			},
			{
				"role": "user",
				"content": prompt
			}
		],
		"max_tokens": 150,
		"temperature": 0.7
	}
	
	var json_payload = JSON.stringify(payload)
	
	var headers: PackedStringArray = [
		"Content-Type: application/json",
		"Authorization: Bearer " + OPENAI_API_KEY
	]
	
	# In Godot 4, the method is passed as a string and the body as a PackedByteArray.
	http_request.request(OPENAI_API_URL, headers, HTTPClient.METHOD_POST, json_payload)
	http_request.request_completed.connect(Callable(self, "_on_request_completed"))
func _on_request_completed(result: int, response_code: int, headers: PackedStringArray, body: PackedByteArray) -> void:
	var raw_response = body.get_string_from_utf8()
	print("Raw Response: ", raw_response)
	if response_code == 200:
		var json_instance = JSON.new()
		var err = json_instance.parse(raw_response)
		if err == OK:
			#var response = json_instance.get("result")
			var response = json_instance.data
			if response != null:
				if response.has("choices") and response["choices"].size() > 0:
					var reply = response["choices"][0]["message"]["content"]
					display_chat_reply(reply)
					# Check for winning or losing response
					if "okay you can leave" in reply.to_lower():
						get_tree().change_scene_to_file("res://scenes/win_screen.tscn")  # Change to the win screen
					elif "you think you can escape me?!" in reply.to_lower():
						get_tree().change_scene_to_file("res://scenes/lose_screen.tscn")  # Change to the lose screen
				else:
					print("Error: No choices in responses")
			else:
				print("Error: Parsed response is null. Raw response: ", raw_response)

		else:
			print("JSONS parse error: ", err)
	else:
		print("HTTP request failed with code: ", response_code)
		

func display_chat_reply(reply: String) -> void:
	# Split the reply into segments of 7 words.
	var words = reply.split(" ")
	var segments = []
	var segment = ""
	var count = 0
	for word in words:
		segment += word + " "
		count += 1
		if count == 7:
			segments.append(segment.strip_edges())
			segment = ""
			count = 0
	if segment.strip_edges() != "":
		segments.append(segment.strip_edges())
	
	# Without delay: join all segments with newlines and display.
	npc_text.text = "\n".join(segments)
