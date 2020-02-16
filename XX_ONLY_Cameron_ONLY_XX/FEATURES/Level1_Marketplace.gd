extends "res://XX_ONLY_Cameron_ONLY_XX/FEATURES/Marketplace.gd"


func _ready():
	items =  ["Pickaxe", "Water Bottle"]
	set_shop()

func set_shop():
	for i in items:
		var o = option.instance()
		o.set_item(i)
		$CanvasLayer/Control/VBoxContainer/VBoxContainer.add_child(o)
