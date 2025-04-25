extends Node

var highscore: int = 0
# properties ..... ??
var highscore_gs: int:
	get:
		return highscore
	set(value):
		if value > highscore:
			highscore = value;
			
# load up high scores when the game is booted
func _ready() -> void:
	pass
