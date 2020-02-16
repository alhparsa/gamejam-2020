extends VBoxContainer
var camel_stats : CamelStats = null

func _ready():
	camel_stats = get_parent().get_parent().get_parent().find_node("Path2D").get_child(0)
	var signals = {"on_hp_change" : "Health",
				"on_thirst_change" : "Thirst",
				"on_hunger_change" : "Hunger",
				"on_armor_change" : "Armor",
				"on_speed_change" : "Speed"}
	var i = 0
	for sig in signals.keys():
		var c = get_child(i)
		c.find_node("Count").find_node("Background").find_node("Label").text = signals[sig]
		c.find_node("Gauge").max_value = 100
		c.find_node("Gauge").value = camel_stats.hp
		camel_stats.connect(sig, c.find_node("Gauge"), "set_value")
		i += 1
