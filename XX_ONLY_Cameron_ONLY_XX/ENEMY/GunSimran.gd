extends "res://XX_ONLY_Cameron_ONLY_XX/ENEMY/RangedSimran.gd"


var bullet = load("res://XX_ONLY_Cameron_ONLY_XX/FEATURES/Projectile_Bullet.tscn")

func _ready():
	health = 10
	speed = 30
	attack = 4
	$AttackSpeed.wait_time = .3
	$AnimationPlayer.playback_speed = $AnimationPlayer.playback_speed/$AttackSpeed.wait_time

func destruction():
	if camel != null:
		var proj = bullet.instance()
		proj.global_position = global_position
		proj.start_projectile(camel.global_position.angle_to_point(global_position))
		get_parent().add_child(proj)


