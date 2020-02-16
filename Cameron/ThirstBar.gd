extends Bar

func init():
	camel_stats.connect("on_thirst_change", self, "set_gauge")
	
	
func set_gauge():
	$Gauge.value = camel_stats.thirst
