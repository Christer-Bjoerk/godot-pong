extends Area2D

const default_speed = 300

var speed = default_speed
var direction = Vector2.LEFT

@onready var start_pos = position
var ball_x = 0
var ball_y = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	speed += delta * 2
	position += speed * delta * direction
	
func reset():
	
	ball_x = randf_range(-1, 1)
	ball_y = randf_range(-1, 1)

	direction = Vector2(ball_x, ball_y)
	position = start_pos
	speed = default_speed
