# Armor.gd
#

extends "./Item.gd"

var defence = 0 setget set_defence, get_defence
var type = ItemManager.ArmorType.HELMET setget set_type, get_type

# Setters/Getters
#

func set_defence(_defence):
	defence = _defence
	
func get_defence():
	return defence

func set_type(_ArmoreType):
	type = _ArmoreType
	
func get_type():
	return type