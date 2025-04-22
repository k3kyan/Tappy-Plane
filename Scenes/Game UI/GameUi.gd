extends Control

#needed the GameUI node to be inside a CanvasLayer node in order to center and display correctly on the screen. Maybe bc its a UI node? not sure. 

# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#pass # Replace with function body.
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass

var MAIN = load("res://Scenes/Main/Main.tscn")

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("Exit"):
		get_tree().change_scene_to_packed(MAIN)
