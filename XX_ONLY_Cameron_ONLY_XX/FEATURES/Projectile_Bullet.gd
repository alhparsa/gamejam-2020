extends Projectile


func _ready():
	damage = 3
	speed = 90
	$Timer.wait_time = 2
