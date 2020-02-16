extends Node2D

class_name Obstacle

var isCleared : bool setget set_cleared, get_cleared
var isDeadly : bool
var obstacletype1
var obstacletype2
signal on_clicked

func init(deadly, obstacle_type1, obstacle_type2) -> void:
	self.isDeadly = deadly
	isCleared = false
	obstacletype1 = obstacle_type1
	obstacletype2 = obstacle_type2
	$Sprite.texture = load(obstacletype1)
	
func _process(delta):
	z_index = get_parent().find_node("floor").world_to_map(global_position).y + 5

func set_cleared(cleared : bool):
	isCleared = cleared

func get_cleared() -> bool:
	return isCleared

func onClick() -> void:
	$Sprite.texture = load(obstacletype2)
	
func _ready():
	connect("on_clicked", self, "onClick")
	
