extends StaticBody2D

class_name Rock

var isCleared : bool
var move : Vector2

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	z_index = (get_parent().find_node("TileMap").world_to_map(global_position)).y
	


