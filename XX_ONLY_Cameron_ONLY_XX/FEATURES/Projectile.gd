extends KinematicBody2D
class_name Projectile
var damage : int = 0
var speed : int = 60
var duration : int = 2
var velocity : Vector2 = Vector2.ZERO

var hit_body = CamelStats

func start_projectile(angle):
	angle +  + PI/2
	$AnimationPlayer.play("throw")
	velocity = Vector2(cos(angle), sin(angle))

func _physics_process(delta):
	move_and_slide(velocity.normalized() * speed)


func _on_Hitbox_body_entered(body):
	if body is hit_body:
		body.take_dmg(damage)
		queue_free()

func _on_Timer_timeout():
	queue_free()
