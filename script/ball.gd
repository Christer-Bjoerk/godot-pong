extends Area2D

const default_speed = 100

var speed = default_speed
var direction = Vector2.LEFT

@onready var start_pos = position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	speed += delta * 2
	position += speed * delta * direction
	
func reset():
	direction = Vector2.LEFT
	position = start_pos
	speed = default_speed
