extends Control

const GAME = preload("res://Scenes/Game/Game.tscn")

# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#pass # Replace with function body.

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("jump"):
		print(event)
		get_tree().change_scene_to_packed(GAME)
