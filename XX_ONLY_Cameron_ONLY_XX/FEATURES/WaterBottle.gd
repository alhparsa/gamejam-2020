extends Projectile

class_name WaterBottle
func _ready():
	damage = 0
	speed = 70
	$Timer.wait_time = 2


func onhit(body):
	body.move_and_slide(Vector2.ONE * angle * 1000)
