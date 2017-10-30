# Weapon.gd
#

extends "./Item.gd"

var bullet_damage_max = 1
var bullet_damage_min = 0
# Cantidad de bullet que utiliza la arma para un disparo
var bullet_demand = 1

# Por defecto son los valores mínimos
var category = ItemManager.Category.UNSUCCESSFUL
var shot_type = ItemManager.ShotType.BULLET

func _init(_name, _item_texture).(name, item_texture):
	name = _name
	item_texture = _item_texture

func _ready():
	pass
