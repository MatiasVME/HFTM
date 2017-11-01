# Weapon.gd
#

extends "./Item.gd"

var damage_max = 1 setget set_damage_max, get_damage_max
var damage_min = 0 setget set_damage_min, get_damage_min
# Cantidad de bullet que utiliza la arma para un disparo
var bullet_demand = 1 setget set_bullet_demand, get_bullet_demand

# Por defecto son los valores mínimos
var category = ItemManager.Category.UNSUCCESSFUL setget set_category, get_category
var shot_type = ItemManager.ShotType.BULLET setget set_shot_type, get_shot_type

	
# Getters/Setters
#

func set_damage_max(max_damage):
	damage_max = max_damage
	
func get_damage_max():
	return damage_max
	
func set_damage_min(min_damage):
	damage_min = min_damage
	
func get_damage_min():
	return damage_min
	
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