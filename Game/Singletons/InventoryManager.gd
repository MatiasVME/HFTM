extends Node

var current_inventory = null setget set_current_inventory, get_current_inventory
var inventories = []

# Variable para almacenar el slot anterior a tomar el item
var prev_slot = null

# Es para saber si se a cambiado el inventories o no
var has_changed = false

# Se le debe añadir una instancia de Inventory.gd
func add_inventory(inventory):
	if not exist_name(inventory.get_owner()):
		inventories.append(inventory)
		if GameGlobals.debug: print("Se añadió el inventario: ", inventory)
	else:
		if GameGlobals.debug: print("El inventario ya fue añadido")

	# Saber si es el primer inventario añadido
	if inventories.size() == 1:
		# Si lo es, se setea a 0 el primer inventario
		set_current_inventory(0)
		
	if GameGlobals.debug:
		print("Inventories: ", inventories)
		for inventory in inventories:
			print("Inventory: ", inventory.get_owner())
			
	has_changed = true

func exist_name(name):
	for inventory in inventories:
		if inventory.get_owner() == name:
			return true

	return false

# Es para saber si se a cambiado de inventario o no. La variable
# has_changed cambia a false una vez que se consulta este método.

func has_changed():
	if has_changed:
		has_changed = false
		return true
	else:
		return false

# Setters/Getters
#

func set_current_inventory(num):
	if num <= inventories.size() - 1:
		current_inventory = inventories[num]
		if GameGlobals.debug: print("current_inventory: ", current_inventory)
	else:
		if GameGlobals.debug: print("No existe inventario con ese número: ", num)

	has_changed = true

func get_current_inventory():
	return current_inventory