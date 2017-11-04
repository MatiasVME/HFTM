extends Node

var current_inventory = null setget set_current_inventory, get_current_inventory
var inventories = []


func add_inventory(inventory):
	if not exist_name(inventory.get_owner):
		inventories.append(inventory)
	else:
		if Global.debug: print("El inventario ya fue añadido")

func select_inventory(num):
	if inventories.size() <= num:
		current_inventory = inventories[num]
	else:
		if GameGlobals.debug: print("No existe inventario con ese número: ", num)

func exist_name(name):
	for inventory in inventories:
		if inventory.get_owner() == name:
			return true

	return false