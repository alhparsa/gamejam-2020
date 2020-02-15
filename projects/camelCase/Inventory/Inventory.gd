extends CanvasLayer

func _ready(): 
	var item = Item.new("Water Bottle")
	$Control/ItemHolder.setItem(item)
	
