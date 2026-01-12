extends Area2D

@export var movement_speed = 100

var ball_dir
var up
var down
var min_screen_boundary = 50
var max_screen_boundary = 50

@onready var screen_size_y = get_viewport_rect().size.y

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var n = String(name).to_lower()
	up = n + "up_wasd"
	down = n + "down_wasd"
	
	if n == "left":
		ball_dir = 1
	else:
		ball_dir = -1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var input = Input.get_action_strength("down_wasd") - Input.get_action_strength("up_wasd")
	position.y = clamp(position.y + input * movement_speed * delta, min_screen_boundary, screen_size_y - max_screen_boundary)
