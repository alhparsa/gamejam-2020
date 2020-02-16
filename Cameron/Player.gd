extends KinematicBody2D

class_name Player
var holding_item
var gold : int setget set_gold
var velocity : Vector2 = Vector2.ZERO
var speed_bonus : int = 0
var inputdir = Vector2(0,0)
var joystickstrength
var inv
var bullet = load("res://XX_ONLY_Cameron_ONLY_XX/FEATURES/Projectile_Bullet.tscn")

signal on_gold_changed(x)
func set_gold(v):
	gold = v
	emit_signal("on_gold_changed", str(gold))
	

export(float) var speed : float = 100
export(int) var frame_i : int = 0
export(int) var start_i : int = 0

var pv = Vector2.DOWN
var can_press_space = false
var object_for_space
var pickedUpPickaxe

var gun_imgs = []
func _ready():
	for f in ["botRight", "down", "right", "up", "upRight"]:
		gun_imgs.append(load("res://assets/items/gun/%s.png"%f))
	inv = get_parent().find_node("Inventory")
	connect("on_gold_changed", $CanvasLayer/Label3, "set_text")
	self.gold = 7

func _process(delta):
	if Input.is_action_just_pressed("lc") or Input.is_action_pressed("shoot"):
		shoot()
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

	z_index = (get_parent().find_node("floor").world_to_map(global_position)).y
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

	$Gun.visible = true
	if velocity.y == 0 and velocity.x != 0:
		$AnimationPlayer.playback_speed = velocity.length()/40
		$AnimationPlayer.play("walk_side")
		$Gun.texture = gun_imgs[2]
		$Gun.global_position = $GunPos.get_child(2).global_position
	elif velocity.y > 0 and velocity.x == 0:
		$AnimationPlayer.playback_speed = velocity.length()/40
		$AnimationPlayer.play("walk_down")
		$Gun.texture  = gun_imgs[1]
		$Gun.global_position = $GunPos.get_child(1).global_position
	elif velocity.y < 0 and velocity.x == 0:
		$AnimationPlayer.playback_speed = velocity.length()/40
		$AnimationPlayer.play("walk_up")
		$Gun.global_position = $GunPos.get_child(3).global_position
		$Gun.texture  = gun_imgs[3]
	elif velocity.y < 0 and velocity.x != 0:
		$AnimationPlayer.playback_speed = velocity.length()/40
		$AnimationPlayer.play("walk_updiag")
		$Gun.texture  = gun_imgs[4]
		$Gun.global_position = $GunPos.get_child(4).global_position
	elif velocity.y > 0 and velocity.x != 0:
		$AnimationPlayer.playback_speed = velocity.length()/40
		$AnimationPlayer.play("walk_downdiag")
		$Gun.texture  = gun_imgs[0]
		$Gun.global_position = $GunPos.get_child(0).global_position
	else:
		frame_i = 3
		$AnimationPlayer.stop()
	if velocity.x != 0:
		var b = velocity.x < 0
		$Sprite.flip_h = b
		$Gun.flip_h = b
		if b:
			$Gun.position.x = -$Gun.position.x
	if velocity != Vector2.ZERO:
		pv = velocity
	velocity = move_and_slide(velocity*(speed_bonus +1))
	$Sprite.frame = frame_i* 9 + start_i

func shoot():
	if $ShootSpeed.is_stopped() and $HitStun.is_stopped():
		var p = bullet.instance()
		p.global_position = $Gun.global_position
		p.hit_body = Enemy
		var r = (p.global_position + pv).angle_to_point(p.global_position)
		 #get_global_mouse_position().angle_to_point(p.global_position)
		p.rotate(r)
		p.start_projectile(r)
		
		get_parent().add_child(p)
		$ShootSpeed.start()

func _on_Area2D_body_entered(body):
	if body is Rock:
		can_press_space = true
		object_for_space = body

func _on_Area2D_body_exited(body):
	if body is Rock:
		can_press_space = false
		object_for_space = null
