extends CanvasLayer

func _ready(): 
	var item = itemDB.getItem("Water Bottle")
	$Control/ItemHolder.item = item
	print($Control/ItemHolder.item.property)
	
