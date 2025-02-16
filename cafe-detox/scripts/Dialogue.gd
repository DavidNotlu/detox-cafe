# scripts/Dialogue.gd
extends Control

@onready var dialogue_text: RichTextLabel = $Panel/DialogueText
@onready var input_field: LineEdit = $Panel/InputField

var is_active: bool = false

func _ready() -> void:
	# Hide the dialogue UI until needed.
	visible = false
	# Connect the "text_entered" signal using the new syntax.
	input_field.text_entered.connect(_on_text_entered)

func start_dialogue(text: String) -> void:
	visible = true
	is_active = true
	dialogue_text.bbcode_text = "[b]NPC:[/b] " + text + "\n"
	input_field.text = ""
	input_field.grab_focus()

func _on_text_entered(new_text: String) -> void:
	dialogue_text.append_bbcode("[b]You:[/b] " + new_text + "\n")
	# Send the player's text to our ChatGPT singleton.
	ChatGPT.get_response(new_text, self, "_on_chatpt_response")
	input_field.text = ""

func _on_chatpt_response(response: String) -> void:
	dialogue_text.append_bbcode("[b]NPC:[/b] " + response + "\n")
