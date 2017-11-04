extends Node

var inventory = null setget set_inventory, get_inventory
var hotbar = null #setget
var armour = null
var batteries = null

# Setters/Getters
#

func set_inventory(_inventory):
	inventory = _inventory
	
func get_inventory():
	return inventory