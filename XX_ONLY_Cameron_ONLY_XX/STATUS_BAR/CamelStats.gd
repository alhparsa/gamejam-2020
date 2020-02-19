extends KinematicBody2D

class_name CamelStats

var isTouchingSimran = false
var bounceSpeed = 200
const MAX_STAT = 175

var hp : float setget set_hp, get_hp
var thirst : float setget set_thirst, get_thirst
var hunger : float setget set_hunger, get_hunger
var armor : float setget set_armor, get_armor
var speed : float setget set_speed, get_speed
var velocity: Vector2 = Vector2(0, 0)

export (NodePath) var patrol_path
var patrol_points: Array
var patrol_index: int = 0

signal on_hp_change(v)
signal on_thirst_change(v)
signal on_hunger_change(v)
signal on_armor_change(v)
signal on_speed_change(v)


var value : float 

func set_hp(val : float) -> void:
	hp = val
	if hp <= 0:
		on_death()
		queue_free()
		get_tree().change_scene("res://GAMEOVER.tscn")
	emit_signal("on_hp_change", hp)

func get_hp() -> float:
	return hp
	
func set_thirst(val : float) -> void:
	thirst = val
	emit_signal("on_thirst_change", thirst)
	
func get_thirst() -> float:
	return thirst

func set_hunger(val : float) -> void:
	hunger = val
	emit_signal("on_hunger_change", hunger)
	
func get_hunger() -> float:
	return hunger

func set_armor(val : float) -> void:
	armor = val
	emit_signal("on_armor_change", armor)
	
func get_armor() -> float:
	return armor

func set_speed(val : float) -> void:
	speed = val
	emit_signal("on_speed_change", speed)

func get_speed() -> float:
	return speed


func _init() -> void:
	self.hp = 150
	self.thirst = 100
	self.hunger = 100
	self.armor = 2
	self.speed = 25
	
func _ready():

	if patrol_path:
		patrol_points = get_node(patrol_path).curve.get_baked_points()

func _physics_process(delta):

	# Follow the path sho leggo 
	if !patrol_path:
		return
	var target = patrol_points[patrol_index]
	if position.distance_to(target) < 1:
		patrol_index = wrapi(patrol_index + 1, 0, patrol_points.size())
		target = patrol_points[patrol_index]
	
	velocity = (target - position).normalized() * get_speed()
	if velocity.y < 0 and velocity.x < 0:
		$AnimationPlayer.play("topleft")
	elif velocity.y < 0 and velocity.x > 0:
		$AnimationPlayer.play("topright")
	elif velocity.y > 0 and velocity.x < 0:
		$AnimationPlayer.play("botleft")
	elif velocity.y > 0 and velocity.x > 0:
		$AnimationPlayer.play("botright")
	else:
		pass
		#$AnimationPlayer.stop()
	if($Timer.is_stopped()):
		var vect = move_and_slide(velocity)
	else:
		var vel= Vector2(randi() % 2, randi() % 2) * bounceSpeed
		move_and_slide(vel)


func _process(delta):
	z_index = (get_parent().get_parent().find_node("TileMap").world_to_map(global_position)).y
#	print(get_parent().get_child(0).global_position)

	

func take_dmg(dmg : int):
	dmg -= armor
	if dmg > 5:
		hit_stun()
	if(dmg > 0):
		self.hp -= dmg
		print("CAMEL TOOK %d dmg"%dmg)
			
func on_death():
	pass


func hit_stun():
	$Timer.start()


func _on_ThirstDrain_timeout():
	self.thirst -= 1
	self.hunger -= 2
