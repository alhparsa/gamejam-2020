extends Bar



func init(l):
	$Count/Background/Label.text = l
	camel_stats.connect("on_thirst_change", self, "set_gauge")
	print("LOL")

func set_gauge():
	$Gauge.value = camel_stats.thirst
