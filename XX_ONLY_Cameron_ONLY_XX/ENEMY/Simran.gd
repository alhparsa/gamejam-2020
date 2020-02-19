extends Enemy

class_name Simran

func _ready():
	attack = 35
	health = 18
	armor = 1
	$AttackSpeed.wait_time = 7

func attack_camel():
	$AnimationPlayer.play("attack")

