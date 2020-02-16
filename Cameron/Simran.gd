extends KinematicBody2D


var velocity : Vector2 = Vector2.ZERO
var speed_bonus : int = 0
var inputdir = Vector2(0,0)

export(float) var speed : float = 15
export(int) var frame_i : int = 0
export(int) var start_i : int = 0

func _process(Delta):
	inputdir.x = 1
	inputdir.y = 1
	inputdir = inputdir.clamped(1)
	velocity = inputdir*speed
	
	velocity = move_and_slide(velocity*(speed_bonus +1))
	$Sprite.frame = frame_i* 9 + start_i
