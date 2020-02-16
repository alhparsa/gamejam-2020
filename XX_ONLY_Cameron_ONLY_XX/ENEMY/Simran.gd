extends Enemy

class_name Simran

func _ready():
	attack = 15
	health = 10
	armor = 1
	$AttackSpeed.wait_time = 7

func attack_camel():
	$AnimationPlayer.play("attack")

