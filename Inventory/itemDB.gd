extends Node

var item_database : Dictionary 
func _ready() :
		 
	item_database = {
		"Water Bottle" : Item.new("Water Bottle", "Hydration", 1.0, 
		{"Hydration": 10 }, 5.00, {}, 0.5, 10),
		"Palm Tree" : Item.new("Palm Tree", "Plant", 500.0,\
		{"Tree": 0}, 0.00, {}, 0.5, 100),
		"Cactus" : Item.new("Cactus", "Animal", 5.0,\
		{"Plant": 10}, 2.00, {}, 0.3, 100),
		"Dates" : Item.new("Dates", "Food", 1, {"Health": 5}, 1.0, \
		{}, 0.3, 5), 
		"Torch" : Item.new("Torch", "Weapon", 5, {"Weapon": 10}, 10.0, \
		{}, 0.4, 10)}
		
func getItem(name) -> Item:
	return item_database[name]
