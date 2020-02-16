extends Bar
func init():
	camel_stats.connect("on_hp_change", self, "set_gauge")
	
	
func set_gauge():
	print(camel_stats.hp)
	$Gauge.value = camel_stats.hp
	
	

