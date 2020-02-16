extends StaticBody2D

class_name Rock

func _process(delta):
	z_index = (get_parent().find_node("TileMap").world_to_map(global_position)).y
	


