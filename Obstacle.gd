extends Node2D

class_name Obstacle

var isDeadly : bool
var isCleared : bool
var obstacletype1
var obstacletype2

signal on_clicked

func init(deadly : bool, obstacle_type1, obstacle_type2) -> void:
	isDeadly = deadly
	isCleared = false
	obstacletype1 = obstacle_type1
	obstacletype2 = obstacle_type2
	
	$Sprite.texture = load(obstacletype1)
	
func _process(delta):
	var pz = get_parent().find_node("Player")
	z_index = pz.z_index - 1 if global_position.y < pz.global_position.y else pz.z_index + 1

func set_cleared(cleared : bool):
	isCleared = cleared

func get_cleared() -> bool:
	return isCleared

func onClick() -> void:
	$Sprite.texture = load(obstacletype2)
	
func _ready():
	connect("on_clicked", self, "onClick")