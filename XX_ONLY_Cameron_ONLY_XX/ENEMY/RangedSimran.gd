extends Simran

var sword = load("res://XX_ONLY_Cameron_ONLY_XX/FEATURES/Projectile_SimranSword.tscn")

func _ready():
	health = 10
	attack = 10
	speed = 12
	$AttackSpeed.wait_time = 6

func destruction():
	if camel != null:
		var proj = sword.instance()
		proj.global_position = global_position
		proj.start_projectile(camel.global_position.angle_to_point(global_position))
		get_parent().add_child(proj)
