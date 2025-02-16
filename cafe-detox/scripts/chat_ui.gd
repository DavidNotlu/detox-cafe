extends Control

@onready var chat_input: LineEdit = $ChatInput
@onready var chat_log: TextEdit = $ChatLog
@onready var send_button: Button = $SendButton

# Preload the ChatGPTIntegration script. 
# Alternatively, add ChatGPTIntegration.gd as an autoload in your project settings.
var ChatGPTIntegration = preload("res://scripts/chatgpt_integration.gd")

func _ready() -> void:
	send_button.pressed.connect(_on_send_pressed)

func _on_send_pressed() -> void:
	var message: String = chat_input.text.strip_edges()
	if message == "":
		return
	chat_log.text += "\nPlayer: " + message
	# Instantiate the ChatGPTIntegration and call get_response.
	ChatGPTIntegration.new().get_response("generic personality", message, self, "_on_chat_response")
	chat_input.text = ""

func _on_chat_response(result: int, response_code: int, headers: Array, body: PackedByteArray) -> void:
	var json = JSON.new()
	var parse_result = json.parse(body.get_string_from_utf8())
	var reply: String = ""
	if parse_result.error == OK and parse_result.result is Dictionary:
		var choices = parse_result.result.get("choices", [])
		if choices.size() > 0:
			var message = choices[0].get("message", {})
			reply = message.get("content", "")
	chat_log.text += "\nNPC: " + reply
