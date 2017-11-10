extends Node

# Owner es el nombre del player que tiene el inventario
var owner = null setget set_owner, get_owner
var has_changed = false

var inventory = [
	[null, null, null, null, null, null, null, null, null, null, null],
	[null, null, null, null, null, null, null, null, null, null, null],
	[null, null, null, null, null, null, null, null, null, null, null],
	[null, null, null, null, null, null, null, null, null, null, null],
	[null, null, null, null, null, null, null, null, null, null, null]
]

func add_item(item, pos_x, pos_y):
	if inventory[pos_x][pos_y] == null:
		inventory[pos_x][pos_y] = item
	else:
		return false

# Añade un item en una posición siguiente en el inventario, si añade el item
# retorna true, si no retorna false.
func add_item_next_position(_item):
	var i = 0
	var j = 0
	
	while i < inventory.size():
		while j < inventory[i].size():
			if inventory[i][j] == null:
				inventory[i][j] = _item
				
				if GameGlobals.debug: print("se va a añadió el item: ", _item)
				print(inventory)
				return true
			j += 1
		i += 1
	
	if GameGlobals.debug: print("no se pudo añadir el item: ", _item)
	
	has_changed = true
	
	return false

func delete_item(pos_x, pos_y):
	inventory[pos_x][pos_y] = null
	
	has_changed = true
	
func retire_item(pos_x, pos_y):
	var item = inventory[pos_x][pos_y]
	inventory[pos_x][pos_y] = null
	
	has_changed = true
	
	return item

# Se utiliza para ver si el inventario a cambiado.
# Si algo ha cambiado responde afirmativo y después cambia la variable
# has_changed a false para que más adelante se pueda reutilizar si otra cosa
# cambia en el inventario.

func has_changed():
	if has_changed:
		has_changed = false
		return true
	else:
		return false

# Setters/Getters
#

func set_owner(_owner):
	owner = _owner
	
func get_owner():
	return owner
	
func get_item(pos_x, pos_y):
	return inventory[pos_x][pos_y]
	
func get_inventory():
	return inventory