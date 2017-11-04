extends Node

# Owner es el nombre del player que tiene el inventario
var owner = null setget set_owner, get_owner

const COLUMNS = 11
const ROWS = 5

var inventory = [COLUMNS, ROWS]

func _ready():
	print(inventory)

func add_item(item, pos_x, pos_y):
	if inventory[pos_x][pos_y] != null:
		inventory[pos_x][pos_y] = item
	else:
		return -1
		
func delete_item(pos_x, pos_y):
	inventory[pos_x][pos_y] = null
	
func retire_item(pos_x, pos_y):
	var item = inventory[pos_x][pos_y]
	inventory[pos_x][pos_y] = null
	return item

# Setters/Getters
#

func set_owner(_owner):
	owner = _owner
	
func get_owner():
	return owner