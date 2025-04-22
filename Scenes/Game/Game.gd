extends Node2D

#nodes
@onready var upper_marker: Marker2D = $UpperMarker
@onready var lower_marker: Marker2D = $LowerMarker
@onready var pipes_holder: Node = $PipesHolder

#scenes
# Scenes I have to preload in order to use it in this scene
const PIPES = preload("res://Scenes/Pipes/Pipes.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn()

func _enter_tree() -> void:
	SignalHub.on_plane_died.connect(_on_plane_on_plane_died)
#	Connects with the on_plane_died from the SIGNALHUB.GD
#	then connects that to the signal function IN THIS FILE !!! down below. thats what function it calls!!!!
#	Signal bus, super important!!!!!


func _on_spawn_timer_timeout() -> void:
	spawn()

func spawn() -> void:
	#var newPipes: Pipes = Pipes.new() #I need to PRELOAD THIS NODE FIRST!!!! (see above)
	var newPipes: Pipes = PIPES.instantiate() # remember: need to INSTANTIATE this instance, not make a new one..? idk
	var newPipes_y : float = randf_range(upper_marker.position.y, lower_marker.position.y)
	var newPipes_x : float = upper_marker.position.x
	
	#newPipes.position.y = newPipes_y
	#newPipes.position.x = upper_marker.position.x
	newPipes.position = Vector2 ( 
		newPipes_x,
		newPipes_y
	)
	pipes_holder.add_child(newPipes)

func _on_plane_on_plane_died() -> void:
	print("Game::Plane has died")
	get_tree().paused = true #Used to pause the ENTIRE tree (of this scene)
