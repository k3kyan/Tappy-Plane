extends CharacterBody2D

class_name Tappy

const JUMP_POWER: float = -350.0
# remember: _ means class level variable, so everything in this class/file can access this variable
var _gravity = ProjectSettings.get("physics/2d/default_gravity");

signal on_plane_died #super important!! good to learn

# reference so that we can use the animation player !!!! thats how we reference child nodes etc
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass
	
func _physics_process(delta: float) -> void:
	jump(delta)
	move_and_slide() # tells the gravity to take effect
	
	if is_on_floor():
		die()

func jump(delta: float):
	velocity.y += _gravity * delta;
	if(Input.is_action_just_pressed("jump")):
		velocity.y = JUMP_POWER
		animation_player.play("jump")
		
func die():
	animated_sprite_2d.stop() # remember to right click and Open Documentation if ur curious on what the node can do
	set_physics_process(false) #remember to set the process to false to prevent issues or more processing that we dont know about
	# !! if this wasn't set to false, the physics_process function would still be running, AKA the player could still jump even if the animation is stopped.
#		EMIT THE SIGNAL HERE!!!!! YOU EMIT SIGNALS FROM FUNCTIONS WHEN FUNCTIONS ARE TRIGGERED!!!!
	on_plane_died.emit()
