extends StaticBody2D

var y
var vect = Vector2()

	
#onready var node = get_node("/root/Test/Player")

	
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ($Player.position[1] < vect.y):
			$Player.z_index = 4
			vect.z_index = 3
	if ($Player.position[1] > vect.y):
			$Player.z_inde = 3
			vect.z_index = 4
			
		
		
		
#static func get_absolute_z_index(target: Node2D) -> int:
#    var node = target;
#    var z_index = 0;
#    while node and node.is_class('Node2D'):
#        z_index += node.z_index;
#        if !node.z_as_relative:
#            break;
#        node = node.get_parent();
#    return z_index;
