extends Bar



func init(l):
	$Count/Background/Label.text = l
	camel_stats.connect("on_hp_change", self, "set_gauge")
	print("GG")

func set_gauge():
	$Gauge.value = camel_stats.hp

