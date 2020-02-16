extends Node

var pickedUpWater = false
var items_picked_up : Dictionary = {}
func _ready():
	$StatusBar/FullStatusBar/BarsHolder.camel_stats = $Path2D/Camel
	create_items()
	pass


func create_items():
	randomize()
	var chance : float = 0
	var location : Vector2 = Vector2.ZERO
	for item in itemDB.item_database.values():
		chance = randf()
		location = $TileMap.map_to_world(Vector2(randi()%13+11,randi()%17-12))
		if chance >= 0.1:
			items_picked_up[location] = {"pickedUp": false,"loc": location, "item_name": item.itemName, 'item_texture': item.image, "scale": item.map_scale}
	display_items()

func display_items():
	for item in items_picked_up.values():
		var sprite = Sprite.new()
		sprite.global_position = item.loc
		sprite.name = item.item_name
		sprite.scale = Vector2.ONE*item.scale
		sprite.texture = item.item_texture
		sprite.z_index = 69
		$Items.add_child(sprite)


func _process(delta):
	for item in items_picked_up.values():
		if ($Player.position - item.loc).length() < 15 and not item.pickedUp:
			$Inventory.add_item(item.item_name)
			item.pickedUp = true
			$Items.get_node(item.item_name).visible = false
	if ($Player.position - $Path2D/Camel.position).length() < 50:
		$Inventory.can_open = true
	else:
		$Inventory.can_open = false
