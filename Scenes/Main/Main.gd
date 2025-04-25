extends Control

#const GAME = preload("res://Scenes/Game/Game.tscn")
@onready var high_score_label: Label = $MarginContainer/HighScoreLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().paused = false
	high_score_label.text = "%04d" % ScoreManager.highscore #will update even if its not the nodes first time in the scene tree....

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("jump"):
		print(event)
		#get_tree().change_scene_to_packed(GAME)
		GameManager.load_game_scene()

# unneeded bc _ready() updates everytime this scene_tree is loaded
#func _enter_tree() -> void:
	#high_score_label.text = "%04d" % ScoreManager.highscore
