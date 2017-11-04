extends Node

var current_inventory = null setget set_current_inventory, get_current_inventory
var inventories = []

func add_inventory(inventory):
	if not exist_name(inventory.get_owner()):
		inventories.append(inventory)
		if GameGlobals.debug: print("Se añadió el inventario: ", inventory)
	else:
		if GameGlobals.debug: print("El inventario ya fue añadido")

func exist_name(name):
	for inventory in inventories:
		if inventory.get_owner() == name:
			return true

	return false

# Setters/Getters
#
	
func set_current_inventory(num):
	if num <= inventories.size() - 1:
		current_inventory = inventories[num]
		if GameGlobals.debug: print("current_inventory: ", current_inventory)
	else:
		if GameGlobals.debug: print("No existe inventario con ese número: ", num)

func get_current_inventory(num):
	return current_inventory