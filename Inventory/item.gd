extends Object

class_name Item 
var itemName : String
var type: String
var weight: float
var property: Dictionary
var cost: float
var craft_recipe: Dictionary
var map_scale: float
var inv_scale: float
var image: Texture


func _init(itemName, type, weight, property, cost, craft_recipe, map_scale, inv_scale): 
	self.itemName=itemName
	self.type=type
	self.weight=float(weight)
	self.property=property
	self.cost=float(cost)
	self.craft_recipe=craft_recipe
	self.map_scale=float(map_scale)
	self.inv_scale=float(inv_scale)
	self.image = load("res://assets/items/"+self.itemName+".png")
	
	


