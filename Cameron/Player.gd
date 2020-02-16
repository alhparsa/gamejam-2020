extends KinematicBody2D

var holding_item
var gold : int
var velocity : Vector2 = Vector2.ZERO
var speed_bonus : int = 0
var inputdir = Vector2(0,0)
var joystickstrength
var Rock

export(float) var speed : float = 60
export(int) var frame_i : int = 0
export(int) var start_i : int = 0

var can_press_space
var object_for_space
var pickedUpPickaxe

func _ready():
	Rock = get_parent().get_node("Rock")

func checkRock():
	if get_parent().get_node('Rock'):
		if (Rock.position - get_parent().get_node('Player').position).length() < 20 and "Pickaxe" in get_parent().get_node("Inventory").items:
			if can_press_space and Input.is_action_just_pressed("space"):
				print("spce")
				$HitStun.start()
				$Mining.visible = true
				
				#$Area2D.connect("body_entered", self, '_remove_rock', [Rock])
				
				$HitStun.connect("timeout", $Mining, "set_visible", [false])
				can_press_space = false
			can_press_space = true
	

func _remove_rock(rock):
	print("Here")
	rock.visible = false


func _process(delta):
	z_index = (get_parent().find_node("floor").world_to_map(global_position)).y
	checkRock()
	
#	if $HitStun.time_left > 0:
#		return
		
	inputdir.x = -Input.get_action_strength("left") + Input.get_action_strength("right")
	inputdir.y = +Input.get_action_strength("down") - Input.get_action_strength("up")
	
	inputdir = inputdir.clamped(1)
	joystickstrength = sqrt(pow(abs(inputdir.y), 2) + pow(abs(inputdir.x), 2))
	#velocity = Vector2.ZERO
	velocity = inputdir*speed
	speed_bonus = 0
	$AnimationPlayer.playback_speed = 1
	if Input.is_action_pressed("shift"):
		speed_bonus = speed*10
		$AnimationPlayer.playback_speed = 1.7
	if velocity.x != 0:
		$Sprite.flip_h = velocity.x < 0
	if velocity.y == 0 and velocity.x != 0:
		$AnimationPlayer.playback_speed = velocity.length()/40
		$AnimationPlayer.play("walk_side")
	elif velocity.y > 0 and velocity.x == 0:
		$AnimationPlayer.playback_speed = velocity.length()/40
		$AnimationPlayer.play("walk_down")
	elif velocity.y < 0 and velocity.x == 0:
		$AnimationPlayer.playback_speed = velocity.length()/40
		$AnimationPlayer.play("walk_up")
	elif velocity.y < 0 and velocity.x != 0:
		$AnimationPlayer.playback_speed = velocity.length()/40
		$AnimationPlayer.play("walk_updiag")
	elif velocity.y > 0 and velocity.x != 0:
		$AnimationPlayer.playback_speed = velocity.length()/40
		$AnimationPlayer.play("walk_downdiag")


	else:
		frame_i = 3
		$AnimationPlayer.stop()
	velocity = move_and_slide(velocity*(speed_bonus +1))
	$Sprite.frame = frame_i* 9 + start_i
	


func _on_HitStun_timeout():
	$Area2D._entered_rock(Rock)
