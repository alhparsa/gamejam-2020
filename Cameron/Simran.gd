extends KinematicBody2D

class_name Simran

var ExplosionScene = load("res://Cameron/Explosion.tscn")
var velocity : Vector2 = Vector2.ZERO
var speed_bonus : int = 0
var inputdir = Vector2(0,0)

export(float) var speed : float = 55
export(int) var frame_i : int = 0
export(int) var start_i : int = 0

func _process(Delta):
	var camelPosition = get_parent().get_node("Path2D/Camel").get_position()
	inputdir.x = camelPosition[0] - self.get_position()[0]
	inputdir.y = camelPosition[1] - self.get_position()[1]
	inputdir = inputdir.clamped(1)
	velocity = inputdir*speed
	
	var collideInfo = move_and_slide(velocity*(speed_bonus +1))
	$Sprite.frame = frame_i* 9 + start_i
	z_index = (get_parent().find_node("TileMap").world_to_map(global_position)).y
	
