extends Object

class_name Item 
var itemName : String
var type: String
var weight: float
var property: Dictionary
var cost: float
var craft_recipe: Dictionary
var map_size: int
var inventory: int
var image: Texture
#		"Water Bottle" : Item.new("Water Bottle", "Health", 1, 
#		{"Hydration": 10 }, 5.00, {}, 10, 10)}


func _init(itemName,type,weight,property,cost,craft_recipe,map_size,inventory): 
	self.itemName=itemName
	self.type=type
	self.weight=weight
	self.property=property
	self.cost=cost
	self.craft_recipe=craft_recipe
	self.map_size=map_size
	self.inventory=inventory
	self.image = load("res://assets/items/"+self.itemName+".png")
	
	


