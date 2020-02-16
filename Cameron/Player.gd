extends KinematicBody2D

class_name Player
var holding_item
var gold : int setget set_gold
var velocity : Vector2 = Vector2.ZERO
var speed_bonus : int = 0
var inputdir = Vector2(0,0)
var joystickstrength
var inv

signal on_gold_changed(x)
func set_gold(v):
	gold = v
	emit_signal("on_gold_changed", str(gold))
	

export(float) var speed : float = 60
export(int) var frame_i : int = 0
export(int) var start_i : int = 0

var can_press_space = false
var object_for_space
var pickedUpPickaxe

func _ready():
	inv = get_parent().find_node("Inventory")
	connect("on_gold_changed", $CanvasLayer/Label3, "set_text")
	self.gold = 7

func _process(delta):
	if not $HitStun.is_stopped():
		return
	
	if can_press_space and "Pickaxe" in inv.items:
		$CanvasLayer/PressSpace.visible = true
		$CanvasLayer/PressSpace.set_action("Mine Rock")
		if Input.is_action_just_pressed("space"):
			$HitStun.start()
			$Mining.visible= true
			$HitStun.connect("timeout", object_for_space, "queue_free")
			$HitStun.connect("timeout", self, "set_gold", [gold+10])
			$HitStun.connect("timeout", $Mining, "set_visible", [false])
			can_press_space = false
	else:
		$CanvasLayer/PressSpace.visible = false

	z_index = (get_parent().find_node("TileMap").world_to_map(global_position)).y
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
	
func _on_Area2D_body_entered(body):
	if body is Rock:
		can_press_space = true
		object_for_space = body


func _on_Area2D_body_exited(body):
	if body is Rock:
		can_press_space = false
		object_for_space = null
