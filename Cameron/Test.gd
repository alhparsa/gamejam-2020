extends Node
var pickedUpWater = false
var pickedUpDates = false

var camel_stats : CamelStats
var b = []
func _ready():
	camel_stats = CamelStats.new()
	camel_stats.connect("on_hp_change", self, "hi")
	camel_stats.hp += 10
	
func _process(delta):
	if $TileMap.world_to_map($Player.global_position) == Vector2(19,-8) && not pickedUpWater:
		$Inventory.add_item("Water Bottle")
		$wBottle.visible = false
		#queue_free(wBottle)
		pickedUpWater = true
		
	if $TileMap.world_to_map($Player.global_position) == Vector2(17,-6) && not pickedUpDates:
		$Inventory.add_item("Dates")
		$Dates.visible = false;
		pickedUpDates = true
	
	# Let player open inventory if they're close enough to camel
	if ($Player.position - $Path2D/Camel.position).length() < 50:
		$Inventory.can_open = true
	else:
		$Inventory.can_open = false

func hi():
	print("Simran Style")
