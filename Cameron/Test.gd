extends Node
var pickedUpWater = false
var pickedUpDates = false

var camel_stats : CamelStats
#var rocks: TileMap2
var b = []
func _ready():
	camel_stats = CamelStats.new()
	camel_stats.connect("on_hp_change", self, "hi")
	camel_stats.hp += 10
	#$Waterbottle.visible = true
	#$Waterbottle.set_global_position(Vector2(19,-8))
#	rocks = TileMap2.new()
#	rocks.connect("front_rock", self, "hi")
	
	
	
func _process(delta):
	
	if $TileMap.world_to_map($Player.global_position) == Vector2(0,-2) && not pickedUpWater:
		$Inventory.add_item("Water Bottle")
		$wBottle.visible = false
		#queue_free(wBottle)
		pickedUpWater = true
		
	if $TileMap.world_to_map($Player.global_position) == Vector2(1,2) && not pickedUpDates:
		$Inventory.add_item("Dates")
		pickedUpDates = true
		
#	if $TileMap2.world_to_map($Player.global_position) < $TileMap2.global_position):
#		$Inventory.add_item("Dates")
#		pickedUpDates = true
	

func hi():
	print("FUCK YOU")
