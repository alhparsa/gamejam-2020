extends Projectile



func _ready():
	damage = 10
	speed = 60
	$Timer.wait_time = 1.7
