extends CanvasLayer

func switch_scene() -> void:
	get_tree().change_scene_to_packed(GameManager.next_scene)

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	queue_free() #removes this scene (Complex Transition) once the animation is finished
