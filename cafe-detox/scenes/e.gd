extends CharacterBody2D

@export var speed: float = 50  # NPC movement speed
@export var change_direction_time: float = 2.0  # Time between direction changes

var direction: Vector2 = Vector2.ZERO
var time_until_change: float = 0

func _ready():
	change_direction()

func _process(delta):
	time_until_change -= delta
	
	if time_until_change <= 0:
		change_direction()
	
	velocity = direction * speed
	
	# Play correct animation based on movement direction
	if direction.x > 0:
		$Body.play("walk_right")
	elif direction.x < 0:
		$Body.play("walk_left")
	elif direction.y > 0:
		$Body.play("walk_front")  # Walking downward
	elif direction.y < 0:
		$Body.play("walk_back")  # Walking upward
	else:
		$Body.play("default")  # Idle if not moving
	
	move_and_slide()

func change_direction():
	# Pick a random direction: Up, Down, Left, Right, or Stay Still
	var possible_directions = [
		Vector2(1, 0),  # Right
		Vector2(-1, 0), # Left
		Vector2(0, 1),  # Down
		Vector2(0, -1), # Up
		Vector2.ZERO    # Stay still
	]
	
	direction = possible_directions[randi() % possible_directions.size()]
	time_until_change = change_direction_time
