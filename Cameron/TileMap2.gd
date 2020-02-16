extends Node

var current_scene = null
signal my_signal
var x
var y

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

#for i in 15:
#		$Control/GridContainer.add_child(inv_holder.instance()) 	// finish this later
#
# Called when the node enters the scene tree for the first time.
func _ready():
	
	

		
	
		
	connect("front_rock", self, "signal_handler")
	#TODO, check if player is below y axis of rock, if so set layer higher
	
	var Player = get_node("signal_handler")
#	Player.
func signal_handler():
	print("front of rock")

