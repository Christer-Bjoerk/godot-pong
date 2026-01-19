extends Area2D

@onready var score_label_p1 : Label = $"Player1 Score"
var score : int = 0

func _on_area_entered(area: Area2D) -> void:
	if area.name == "Ball":
		score += 1
		score_label_p1.text = str(score)
		area.reset()
