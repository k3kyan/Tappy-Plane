extends Node

signal on_plane_died
signal score_point

func get_rid_of_warnings() -> void:
	print(on_plane_died.get_name())
	print(score_point.get_name())
