extends Node

# API endpoint and key (replace with your actual key; secure it appropriately in production)
var api_url: String = "https://api.openai.com/v1/chat/completions"
var api_key: String = "YOUR_API_KEY"

func get_response(personality: String, player_message: String, caller: Node, callback_method: String) -> void:
	var prompt: String = "NPC personality: %s\nPlayer said: %s" % [personality, player_message]
	var request_body = {
		"model": "gpt-3.5-turbo",
		"messages": [
			{"role": "system", "content": "You are an NPC in a cozy café simulation game."},
			{"role": "user", "content": prompt}
		]
	}
	# Use JSON.stringify() to convert the dictionary to a JSON string.
	var json_body: String = JSON.stringify(request_body)
	var http_request = HTTPRequest.new()
	caller.add_child(http_request)
	http_request.request_completed.connect(caller, callback_method)
	var headers: Array = [
		"Content-Type: application/json",
		"Authorization: Bearer " + api_key
	]
	var err: int = http_request.request(api_url, headers, HTTPClient.METHOD_POST, json_body)
	if err != OK:
		push_error("Error sending HTTP request: " + str(err))
