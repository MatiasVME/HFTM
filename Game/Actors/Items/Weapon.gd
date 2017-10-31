# Weapon.gd
#

extends "./Item.gd"

var bullet_damage_max = 1 setget set_bullet_damage_max, get_bullet_damage_max
var bullet_damage_min = 0 setget set_bullet_damage_min, get_bullet_damage_min
# Cantidad de bullet que utiliza la arma para un disparo
var bullet_demand = 1 setget set_bullet_demand, get_bullet_demand

# Por defecto son los valores mínimos
var category = ItemManager.Category.UNSUCCESSFUL setget set_category, get_category
var shot_type = ItemManager.ShotType.BULLET setget set_shot_type, get_shot_type

func _init(_name, _item_texture).(name, item_texture):
	name = _name
	item_texture = _item_texture
	
# Getters/Setters
#

func set_bullet_damage_max(max_damage):
	bullet_damage_max = max_damage
	
func get_bullet_damage_max():
	return bullet_damage_max
	
func set_bullet_damage_min(min_damage):
	bullet_damage_min = min_damage
	
func get_bullet_damage_min():
	return bullet_damage_min
	
func set_bullet_demand(demand):
	bullet_demand = demand
	
func get_bullet_demand():
	return bullet_demand
	
func set_category(_category):
	category = _category
	
func get_category():
	return category
	
func set_shot_type(_shot_type):
	shot_type = _shot_type
	
func get_shot_type():
	return shot_type