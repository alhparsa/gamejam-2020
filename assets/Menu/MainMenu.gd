extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_StartGame_pressed():
	get_node("ButtonClick").play()
	get_tree().change_scene("res://Level1.tscn")
