extends Node
var pickedUpWater = false
var pickedUpDates = false

var camel_stats : CamelStats
var b = []
func _ready():
	camel_stats = CamelStats.new()
	camel_stats.connect("on_hp_change", self, "hi")
	camel_stats.hp += 10
	#$Waterbottle.visible = true
	#$Waterbottle.set_global_position(Vector2(19,-8))
	
func _process(delta):
	if $TileMap.world_to_map($Player.global_position) == Vector2(19,-8) && not pickedUpWater:
		$Inventory.add_item("Water Bottle")
		$wBottle.visible = false
		#queue_free(wBottle)
		pickedUpWater = true
		
	if $TileMap.world_to_map($Player.global_position) == Vector2(14,-4) && not pickedUpDates:
		print($Player.global_position)
		$Inventory.add_item("Dates")
		$dateSprite.visible = false
		pickedUpDates = true
	

func hi():
	print("FUCK YOU")
