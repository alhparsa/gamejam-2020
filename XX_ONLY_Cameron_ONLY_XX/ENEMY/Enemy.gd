extends KinematicBody2D
class_name Enemy

# ENEMY MUST BE SAME ON THE SAME TREE LEVEL AS THE CAMEL
var velocity : Vector2 = Vector2.ZERO
var speed_bonus : int = 0
var inputdir = Vector2(0,0)
var speed : float = 30
var camel : CamelStats = null
var can_move : bool = true

var attack : int = 0
var health : int = 0
var armor : int = 0

func take_dmg(dmg : int):
	health -= dmg
	if health <= 0:
		on_death()
		queue_free()

func on_death():
	pass

func _physics_process(delta):
	can_move = camel == null
	if can_move:
		if camel != null:
			if global_position.x < camel.global_position.x - 10:
				if scale.x > 0: scale.x = -abs(scale.x)
			elif global_position.x > camel.global_position.x + 10:
				if scale.x < 0: scale.x = abs(scale.x)
		follow_camel()
	z_index = (get_parent().find_node("TileMap").world_to_map(global_position)).y
	if camel != null:
		if $AttackSpeed.is_stopped():
			$AttackSpeed.start()
			attack_camel()
			
func attack_camel():
	pass
	
func destruction():
	if camel != null:
		camel.take_dmg(attack)
		
func follow_camel():
	var camelPosition = get_parent().get_node("Path2D")
	if camelPosition.get_child_count() == 0:
		return
		
#	print(camelPosition.get_child(0).global_position)
	camelPosition = camelPosition.get_child(0).global_position
	inputdir.x = camelPosition[0] - self.global_position.x
	inputdir.y = camelPosition[1] - self.global_position.y
	inputdir = inputdir.clamped(1)
	velocity = inputdir*speed
	var collideInfo = move_and_slide(velocity*(speed_bonus + 1))


func _on_Hitbox_body_entered(body):
	if body is CamelStats:
		camel = body
		
func _on_Hitbox_body_exited(body):
	if body is CamelStats:
		camel = null
