extends TextureRect

var item : Item setget setItem, getItem
var quantity : int = 0

func setItem(i):
	item = i
	$ItemTexture.texture = item.image
func getItem():
	return item
