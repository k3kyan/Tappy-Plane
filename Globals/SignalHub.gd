extends Node

signal on_plane_died

func get_rid_of_warnings() -> void:
	print(on_plane_died.get_name())
