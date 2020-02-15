extends Node


var camel_stats : CamelStats
var b = []
func _ready():
	camel_stats = CamelStats.new()
	camel_stats.connect("on_hp_change", self, "hi")
	camel_stats.hp += 10

func _process(delta):
	if $TileMap.world_to_map($Player.global_position) == Vector2(19,-8):
		$Inventory.add_item("Water Bottle")
	

func hi():
	print("FUCK YOU")
