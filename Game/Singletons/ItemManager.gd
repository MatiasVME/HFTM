extends Node

# Tipo genérico de item
enum ItemType {WEAPON, ARMOR, BATERY, ACCESSORY, MUNITION}
# Para armas
enum WeaponType {GUN, SHOTGUN, MACHINE_GUN, LASER}
enum ShotType {BULLET, FIRE, SLIME, SHADY}

enum Category {UNSUCCESSFUL, COMMON, POWERFUL, OVER_POWER, UNIQUE}

func _ready():
	randomize()
	
	get_gun()

# Por defecto se obtiene un objeto random, si no se especifica.
#

func get_weapon():
	pass
	
func get_gun(id_img = null, _Category = null):
	var item
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
	
	
	
	
	
	
	
	
	
	
	
	
	