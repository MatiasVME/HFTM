extends Node

var amount = 0 setget set_amount, get_amount
var type = ItemManager.ShotType.BULLET setget set_type, get_type

func set_amount(_amount):
	amount = _amount
	
func get_amount():
	return amount
	
func set_type(_type):
	type = _type
	
func get_type():
	return type