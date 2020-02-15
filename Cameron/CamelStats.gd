extends KinematicBody2D

class_name CamelStats

var hp : float setget set_hp, get_hp
var thirst : float setget set_thirst, get_thirst
var hunger : float setget set_hunger, get_hunger
var armor : float setget set_armor, get_armor
var speed : float setget set_speed, get_speed

signal on_hp_change
signal on_thirst_change
signal on_hunger_change
signal on_armor_change
signal on_speed_change

var path

func set_hp(val : float) -> void:
	hp = val
	emit_signal("on_hp_change")
	
func get_hp() -> float:
	return hp
	
func set_thirst(val : float) -> void:
	thirst = val
	emit_signal("on_thirst_change")
	
func get_thirst() -> float:
	return thirst

func set_hunger(val : float) -> void:
	hunger = val
	emit_signal("on_hunger_change")
	
func get_hunger() -> float:
	return hunger

func set_armor(val : float) -> void:
	armor = val
	emit_signal("on_armor_change")
	
func get_armor() -> float:
	return armor

func set_speed(val : float) -> void:
	speed = val
	emit_signal("on_speed_change")

func get_speed() -> float:
	return speed


func _init() -> void:
	self.hp = 100
	self.thirst = 100
	self.hunger = 100
	self.armor = 30
	path = self.get_parent()
	
	
func _process(delta):
	pass
