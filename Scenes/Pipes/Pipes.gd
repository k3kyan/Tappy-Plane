extends Node2D

class_name Pipes

@onready var laser: Area2D = $Laser

var SPEED: float = 120.0 #pixels per second
var OFF_SCREEN: float = 100.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= SPEED * delta
	
	if position.x < get_viewport_rect().position.x - OFF_SCREEN:
		die()
	

#I think the way you connect to signals is go to the node whos signal you want
# then go to the signal you want in the Node tab
# then click on it, and the target is the node with the script that you want to use the signal in !!!!!!!!!
# so since I want to know if the node is off the screen in the Pipes script, then the Pipes script is my target.
func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	print("Pipes::note is deleted")
	die()
	
func die():
	set_process(false)
	queue_free()

func _on_pipe_body_entered(body: Node2D) -> void:
	##print("Hit pipe")
	#print(body) # printing the body is more specific than printing "Hit Plane". dont do that. be as specific as u can if u wanna debug stuff.
	## also, the "body" var that we are printing is the Node2d that is being passed into this function (look above)
	if body is Tappy:
		body.die()


func _on_laser_body_entered(body: Node2D) -> void:
#	if statement so no double scoring
	if body is Tappy:
		laser.body_entered.disconnect(_on_laser_body_entered);
		#laser.disconnect("body_entered", _on_laser_body_entered)
	SignalHub.score_point.emit();
