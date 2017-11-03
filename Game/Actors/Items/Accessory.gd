# Accessory.gd
#

extends "./Item.gd"

var powers = null setget set_powers, get_powers
var attributes = null setget set_attributes, get_attributes

func set_powers(_powers):
	powers = _powers
	
func get_powers():
	return powers
	
func set_attributes(_attributes):
	attributes = _attributes
	
func get_attributes():
	return attributes