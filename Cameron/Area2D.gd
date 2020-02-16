extends Area2D

signal body_entered_rock

func _entered_rock(rock):
	
	rock.queue_free()
