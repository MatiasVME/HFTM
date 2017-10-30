extends Node

# Propiedades
var name = ""
var id = null
var item_texture = null
var price_buy = 0
var price_sell = 0
var amount = 1

# Requerimientos para ser utilizado
var requirements = {
		Strength = 0,
		Dexterity = 0,
		Vitality = 0,
		Energy = 0,
		Level = 0
	}

func _init(_name, _item_texture):
	pass