extends CharacterBody2D

@export var speed: float = 100

func _process(delta):
	var direction = Vector2.ZERO
	
	# Get movement input
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
		$Body.play("walk_right")
	elif Input.is_action_pressed("ui_left"):
		direction.x -= 1
		$Body.play("walk_left")
	elif Input.is_action_pressed("ui_down"):
		direction.y += 1
		$Body.play("walk_front")
	elif Input.is_action_pressed("ui_up"):
		direction.y -= 1
		$Body.play("walk_back")
	else:
		$Body.play("default") # Stops animation if no input

	# Move the character
	if direction != Vector2.ZERO:
		velocity = direction.normalized() * speed
	else:
		velocity = Vector2.ZERO
	
	move_and_slide()
