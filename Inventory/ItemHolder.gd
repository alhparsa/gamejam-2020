extends TextureRect

var item : Item setget setItem, getItem

func setItem(i):
	item = i
	texture = item.image
func getItem():
	return item
