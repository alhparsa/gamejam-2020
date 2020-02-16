extends TextureButton

var item

func set_item(ming):
	item = itemDB.getItem(ming)
	$Label.text = "%s / %d Gold"%[ming, item.cost]
	texture_normal = item.image


func _on_ItemOption_pressed():
	var x = get_parent()
	for i in range(5):
		x = x.get_parent()
	var player = x.find_node("Player")
	if player.gold - item.cost >= 0:
		player.gold -= item.cost
		x.find_node("Inventory").add_item(item.itemName)
	
