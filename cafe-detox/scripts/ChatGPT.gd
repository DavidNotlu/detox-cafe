# scripts/ChatGPT.gd
extends Node
class_name ChatGPT
# IMPORTANT: Add this script as an Autoload/Singleton with the name "ChatGPT".

func get_response(user_input: String, caller: Object, callback_method: String) -> void:
	var timer = Timer.new()
	timer.wait_time = 1.0  # Simulate a 1-second API delay.
	timer.one_shot = true
	add_child(timer)
	# Connect the timeout signal using the new syntax.
	timer.timeout.connect(_on_timeout, [user_input, caller, callback_method, timer])
	timer.start()

func _on_timeout(user_input: String, caller: Object, callback_method: String, timer: Timer) -> void:
	timer.queue_free()
	var response: String = simulate_response(user_input)
	if caller.has_method(callback_method):
		caller.call(callback_method, response)

func simulate_response(user_input: String) -> String:
	if user_input.find("coffee") != -1:
		return "Our coffee is freshly brewed to help you disconnect and enjoy the moment."
	elif user_input.find("tea") != -1:
		return "A warm cup of tea might be exactly what you need."
	else:
		return "I appreciate you sharing that – it’s really nice to have a break."
