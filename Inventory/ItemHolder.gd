extends TextureRect

var item : Item setget setItem, getItem
var quantity : int = 0
var loc : int setget setLoc, getLoc

func _ready():
	$CounterItem.visible = false

func setItem(i):
	item = i
	$ItemTexture.texture = item.image
func getItem():
	return item
	
func setQuantity(i):
	quantity = i
	get_node("CounterItem/Quantity").text = String(quantity)

func show():
	$CounterItem.visible = true

func getQuantity():
	return quantity

func setLoc(i):
	loc = i

func getLoc():
	return loc
	
