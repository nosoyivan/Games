extends Node2D

var tile_size = Vector2(16,16)

func _process(delta: float) -> void:
	var mouse_pos = get_global_mouse_position() + tile_size / 2
	position = mouse_pos.snapped(tile_size) - tile_size / 2
