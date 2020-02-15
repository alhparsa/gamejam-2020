extends Node

var item_database : Dictionary 
func _ready() :
		 
	item_database = {
		"Water Bottle" : Item.new("Water Bottle", "Hydration", 1, 
		{"Hydration": 10 }, 5.00, {}, 10, 10),
		"Palm Tree" : Item.new("Palm Tree", "Plant", 500.0,\
		{"Tree": 0}, 0, {}, -1, 100),
		"Cactus" : Item.new("Cactus", "Animal", 5,\
		{"Plant": 10}, 2.00, {}, 20, 100),
		"Dates" : Item.new("Dates", "Food", 1, {"Health": 5}, 1.0, \
		{}, 10, 5), 
		"Camel Milk" : Item.new("Camel Milk", "Food", 2, {"Health": 5}, 5.0, \
		{}, 5, 10),
		"Torch" : Item.new("Torch", "Weapon", 5, {"Weapon": 10}, 10.0, \
		{}, 10, 10)}
		
func getItem(name) -> Item:
	return item_database[name]
