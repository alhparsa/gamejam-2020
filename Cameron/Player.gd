extends KinematicBody2D

var holding_item
var gold : int
var velocity : Vector2 = Vector2.ZERO
var speed_bonus : int = 0

export(float) var speed : float = 10
export(int) var frame_i : int = 0
export(int) var start_i : int = 0

func _process(delta):
	velocity = Vector2.ZERO
	speed_bonus = 0
	$AnimationPlayer.playback_speed = 1
	if Input.is_action_pressed("shift"):
		speed_bonus = speed*.7
		$AnimationPlayer.playback_speed = 1.7
	if Input.is_action_pressed("ui_left"):
		velocity.x -= sqrt(3)
	if Input.is_action_pressed("ui_right"):
		velocity.x += sqrt(3)
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if velocity.x != 0:
		$Sprite.flip_h = velocity.x < 0
	if velocity.y == 0 and velocity.x != 0:
		$AnimationPlayer.play("walk_side")
	elif velocity.y == -1 and velocity.x != 0:
		$AnimationPlayer.play("walk_updiag")
	elif velocity.y == 1 and velocity.x != 0:
		$AnimationPlayer.play("walk_downdiag")
	elif velocity.y == -1 and velocity.x == 0:
		$AnimationPlayer.play("walk_up")
	elif velocity.y == 1 and velocity.x == 0:
		$AnimationPlayer.play("walk_down")
	else:
		frame_i = 3
		$AnimationPlayer.stop()
	move_and_slide(velocity.normalized() * (speed + speed_bonus))
	$Sprite.frame = frame_i* 9 + start_i
	
