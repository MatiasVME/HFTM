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

# Requerimientos para ser utilizado
var requirements setget set_requirements, get_requirements
# Munición de la arma
var munition setget set_munition, get_munition

func _init():
	var class_requirements = load("res://Game/Actors/Items/Attributes.gd")
	var class_munition = load("res://Game/Actors/Items/Munition.gd")
	
	requirements = class_requirements.new(0, 0, 0, 0)
	munition = class_munition.new()

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
	
func set_requirements(strength = 0, dexterity = 0, vitality = 0, energy = 0):
	requirements.set_strength(strength)
	requirements.set_dexterity(dexterity)
	requirements.set_vitality(vitality)
	requirements.set_energy(energy)

func get_requirements():
	return requirements
	
func set_munition(amount, type):
	munition.set_amount(amount)
	munition.set_type(type)
	
func set_munition_amount(amount):
	munition.set_amount(amount)
	
func get_munition_amount():
	return munition.get_amount()
	
func set_munition_type(type):
	munition.set_type(type)

func get_mnition_type():
	return munition.get_type()

func get_munition():
	return munition