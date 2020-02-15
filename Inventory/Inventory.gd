tool
extends CanvasLayer

var inv_holder = load("res://Inventory/ItemHolder.tscn")
var items : Dictionary = {}
var counter : int = 0

func _ready(): 
	$Control.visible = false
	for i in 15:
		$Control/GridContainer.add_child(inv_holder.instance())

# warning-ignore:unused_argument
func _process(delta):
	if Input.is_action_just_pressed("tab"):
		$Control.visible = true
	if Input.is_action_just_released("tab"):
		$Control.visible = false
	
func add_item(item : String):
	var holder = $Control/GridContainer.get_child(counter)
	if item in items:
		items[item].quantity += 1
		$Control/GridContainer.get_child(items[item].loc).setQuantity(items[item].quantity)
	elif counter < 15:
		holder.setItem(itemDB.getItem(item))
		holder.setLoc(counter)
		holder.show()
		items[item] = holder
		counter += 1
	else:
		print("Invertory is full")

		
func remove_item(loc):
	$Control/GridContainer.get_child(loc).item = null
