extends Node

# Tipo genérico de item
enum ItemType {WEAPON, ARMOR, BATERY, ACCESSORY, MUNITION}
# Para armas
enum WeaponType {GUN, SHOTGUN, MACHINE_GUN, LASER}
enum ShotType {BULLET, SLIME, FIRE, SHADY}

# Para armaduras
enum ArmorType {HELMET, SUIT, GLOVE_LEFT, GLOVE_RIGHT, BOOTS}

enum Category {UNSUCCESSFUL, COMMON, POWERFUL, OVER_POWER, UNIQUE}

var item
var weapon = preload("res://Game/Actors/Items/Weapon.gd")

# Daños genéricos (por bala)
const GUN_DAMAGE = 0.40
const SHOTGUN_DAMAGE = 1
const MACHINE_GUN_DAMAGE = 0.30
const LASER_DAMAGE = 0.70

# Daños genéricos dependiendo de la bala
const BULLET_DAMAGE = 0.6
const SLIME_DAMAGE = 0.8
const FIRE_DAMAGE = 1
const SHADY_DAMAGE = 1.3

# Velocidad genérica (por bala)
#const GUN_SPEED = 

func _ready():
	randomize()
	
#	for i in range(1, 20):
#		print("=====", i, "=====")
#		get_gun("Pistola", i)
	
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
			img = load("res://Game/Actors/Items/Weapons/Gun/G-101/G-101-Mini.png")
		1:
			img = load("res://Game/Actors/Items/Weapons/Gun/F-101/F-101-Mini.png")
		2:
			img = load("res://Game/Actors/Items/Weapons/Gun/D-101/D-101-Mini.png")
	
	var i_weapon = weapon.new()
	i_weapon.set_name(name)
	i_weapon.set_texture(img)
	i_weapon.set_category(_category)
	i_weapon.set_shot_type(_shot_type)
	i_weapon.set_level_drop(_level_drop)
	rand_requirements(i_weapon.get_level_drop() * 5, i_weapon)
	i_weapon.set_damage_max(calc_damage_max(WeaponType.GUN, _category,
			_shot_type, i_weapon))
	
	
	#debug_max_damage(i_weapon)
	#i_weapon.set_bullet_damage_max()
	
	# el precio se calcula al final
	# i_weapon.set_price_buy()
	
	return i_weapon

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
	var damage

	match _weapon_type:
		WeaponType.GUN:
			match _category:
				Category.UNSUCCESSFUL:
					match _shot_type:
						ShotType.BULLET:
							# damage = int(GUN_DAMAGE * randf() * _item.get_requirements().get_strength() * _item.get_level_drop() * 0.5 + _item.get_level_drop())
							damage = int(_item.get_requirements().get_strength() * _item.get_level_drop() * GUN_DAMAGE * BULLET_DAMAGE * 0.5 * randf())
						ShotType.SLIME: pass
						ShotType.FIRE: pass
						ShotType.SHADY: pass
				Category.COMMON:
					match _shot_type:
						ShotType.BULLET:
							# damage = int(GUN_DAMAGE * randf() * _item.get_requirements().get_strength() * _item.get_level_drop() * 0.5 + _item.get_level_drop())
							damage = int(_item.get_requirements().get_strength() * _item.get_level_drop() * GUN_DAMAGE * BULLET_DAMAGE * 1 * randf())
						ShotType.SLIME: pass
						ShotType.FIRE: pass
						ShotType.SHADY: pass
				Category.POWERFUL:
					match _shot_type:
						ShotType.BULLET:
							# damage = int(GUN_DAMAGE * randf() * _item.get_requirements().get_strength() * _item.get_level_drop() * 0.5 + _item.get_level_drop())
							damage = int(_item.get_requirements().get_strength() * _item.get_level_drop() * GUN_DAMAGE * BULLET_DAMAGE * 1.5 * randf())
						ShotType.SLIME: pass
						ShotType.FIRE: pass
						ShotType.SHADY: pass
				Category.OVER_POWER:
					match _shot_type:
						ShotType.BULLET:
							# damage = int(GUN_DAMAGE * randf() * _item.get_requirements().get_strength() * _item.get_level_drop() * 0.5 + _item.get_level_drop())
							damage = int(_item.get_requirements().get_strength() * _item.get_level_drop() * GUN_DAMAGE * BULLET_DAMAGE * 2 * randf())
						ShotType.SLIME: pass
						ShotType.FIRE: pass
						ShotType.SHADY: pass
		WeaponType.SHOTGUN: pass
		WeaponType.MACHINE_GUN: pass
		WeaponType.LASER: pass
	
	if damage < 3:
		damage = randi() % 2 + 1
		
	return damage
	
func debug_max_damage(weapon):
	print("UNSUCCESSFUL, COMMON, POWERFUL, OVER_POWER")
	for i in range(5):
		print(calc_damage_max(WeaponType.GUN, Category.UNSUCCESSFUL, 0, weapon), " - ", 
				calc_damage_max(WeaponType.GUN, Category.COMMON, 0, weapon),
				" - ", calc_damage_max(WeaponType.GUN, Category.POWERFUL, 0, weapon),
				" - ", calc_damage_max(WeaponType.GUN, Category.OVER_POWER, 0, weapon))
	