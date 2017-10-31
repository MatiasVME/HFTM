extends Node

# Tipo genérico de item
enum ItemType {WEAPON, ARMOR, BATERY, ACCESSORY, MUNITION}
# Para armas
enum WeaponType {GUN, SHOTGUN, MACHINE_GUN, LASER}
enum ShotType {BULLET, FIRE, SLIME, SHADY}

enum Category {UNSUCCESSFUL, COMMON, POWERFUL, OVER_POWER, UNIQUE}

var item
var weapon = preload("res://Game/Actors/Items/Weapon.gd")

# Daños genéricos (por bala)
const GUN_DAMAGE = 0.20
const SHOTGUN_DAMAGE = 0.5
const MACHINE_GUN_DAMAGE = 0.15
const LASER_DAMAGE = 0.35

func _ready():
	randomize()
	get_gun("Pistola", 30)
	
# Por defecto se obtiene un objeto random, si no se especifica.
#

func get_weapon():
	pass
	
func get_gun(name, _level_drop, id_img = null, _category = Category.UNSUCCESSFUL, _shot_type = ShotType.BULLET):
	var id_max = 2
	var img
	
	if id_img == null:
		id_img = randi() % (id_max + 1)
	
	match id_img:
		0:
			img = load("res://Game/Actors/Items/Weapons/Gun/G-101/G-101.png")
		1:
			img = load("res://Game/Actors/Items/Weapons/Gun/F-101/F-101.png")
		2:
			img = load("res://Game/Actors/Items/Weapons/Gun/D-101/D-101.png")
	
	var i_weapon = weapon.new(name, img)
	i_weapon.set_category(_category)
	i_weapon.set_shot_type(_shot_type)
	i_weapon.set_level_drop(_level_drop)
	rand_requirements(i_weapon.get_level_drop() * 4, i_weapon)
	print("calc_damage_max(): ", calc_damage_max(WeaponType.GUN, _category, 0, i_weapon))
	print(i_weapon.get_level_drop())
	
	#i_weapon.set_bullet_damage_max()
	
	# el precio se calcula al final
	# i_weapon.set_price_buy()

# Distribuye los requerimientos de un item al azar
func rand_requirements(_points, item):
	var current_points = _points
	
	var r_strength = 0
	var r_dextery = 0
	var r_vitality = 0
	var r_energy = 0
	
	var requirement
	
	while current_points >= 0:
		requirement = randi() % 4
		
		match requirement:
			0: r_strength += 1
			1: r_dextery += 1
			2: r_vitality += 1
			3: r_energy += 1
			
		current_points -= 1
	
	item.set_requirements(r_strength, r_dextery, r_vitality, r_energy)
	
func calc_damage_max(_weapon_type, _category, _shot_type, _item):
#{UNSUCCESSFUL, COMMON, POWERFUL, OVER_POWER, UNIQUE}
	var damage = 0

	match _weapon_type:
		WeaponType.GUN:
			match _category:
				Category.UNSUCCESSFUL:
					damage = int(GUN_DAMAGE * (randi() % 12 + 5) * _item.get_level_drop())
				Category.COMMON:
					damage = int(GUN_DAMAGE * (randi() % 25 + 12) * item.get_level_drop())
				Category.POWERFUL:
					damage = int(GUN_DAMAGE * (randi() % 35 + 25) * item.get_level_drop())
		WeaponType.SHOTGUN: pass
		WeaponType.MACHINE_GUN: pass
		WeaponType.LASER: pass
	
	return damage
	
	
	
	