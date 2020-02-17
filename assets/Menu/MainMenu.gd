extends Control

# Called when the node enters the scene tree for the first time.
func _process(delta):
	if Input.is_action_just_pressed("start"):
		_on_StartGame_pressed()

func _on_StartGame_pressed():
	get_node("ButtonClick").play()
	get_tree().change_scene("res://Cameron/Test.tscn")
