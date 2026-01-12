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
	up = n + "up_arrow"
	down = n + "down_arrow"
	
	ball_dir = -1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var input = Input.get_action_strength("down_arrow") - Input.get_action_strength("up_arrow")
	position.y = clamp(position.y + input * movement_speed * delta, min_screen_boundary, screen_size_y - max_screen_boundary)


func _on_area_entered(area: Area2D) -> void:
	if area.name == "Ball":
		area.direction = Vector2(ball_dir, randf() * 2 - 1).normalized()
