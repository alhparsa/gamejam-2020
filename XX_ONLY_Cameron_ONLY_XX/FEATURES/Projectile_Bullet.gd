extends Projectile


func _ready():
	damage = 3
	speed = 400
	$Timer.wait_time = 2
