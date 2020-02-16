extends StaticBody2D

var option = load("res://XX_ONLY_Cameron_ONLY_XX/FEATURES/ItemOption.tscn")
var items : Array

func _ready():
	$CanvasLayer/Control.visible = false

func _on_Area2D_body_entered(body):
	if body is Player:
		$CanvasLayer/Control.visible = true
	
func _on_Area2D_body_exited(body):
	if body is Player:
		$CanvasLayer/Control.visible = false
