extends Control

# remember, these references don't work when you reference them in other classes or files if the script is not in that node tree
@onready var score: Label = $MarginContainer/Score
@onready var game_over: Label = $"MarginContainer/Game Over"
@onready var press_space: Label = $"MarginContainer/Press Space"
@onready var timer: Timer = $Timer
@onready var animation_player: AnimationPlayer = $"MarginContainer/Press Space/AnimationPlayer"

#needed the GameUI node to be inside a CanvasLayer node in order to center and display correctly on the screen. Maybe bc its a UI node? not sure. 

var _score;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_score = 0;
	game_over.hide()
	press_space.hide()

#var MAIN = load("res://Scenes/Main/Main.tscn")

func _enter_tree() -> void:
	SignalHub.on_plane_died.connect(gameoversequence)
	SignalHub.score_point.connect(score_point)
	
func score_point() -> void:
	_score += 1;
	score.text = "%04d" % _score
	

func gameoversequence() -> void:
	game_over.show()
	timer.start()
#	now need to have a signal to tell us when the timer has ended !!!!!! yes it needs to be a signal :(


func _unhandled_input(event: InputEvent) -> void:
#	 can exit game by pressing esc at any time or with space once the "press space" text is shown
	if event.is_action_pressed("Exit"):
		#get_tree().change_scene_to_packed(MAIN)
		GameManager.load_main_scene()
	elif press_space.visible and event.is_action_pressed("jump"):
		GameManager.load_main_scene()


func _on_timer_timeout() -> void:
	game_over.hide()
	press_space.show()
	animation_player.play("flash")
