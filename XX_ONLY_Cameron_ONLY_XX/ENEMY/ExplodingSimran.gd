extends Simran

var explosion_scene = load("res://Cameron/Explosion.tscn")

func _ready():
	attack = 40
	health = 15
	armor = 3
	speed = 20
	
func attack_camel():
	$AnimationPlayer.play("EXPLOOOOOOOOOSION")
	$AnimationPlayer.playback_speed = 3

func destruction():
	.destruction()
	var explosion = explosion_scene.instance()
	explosion.global_position = global_position
	explosion.play()
	get_parent().add_child(explosion)
	queue_free()
