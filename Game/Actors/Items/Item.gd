extends Node

# Propiedades
var name = "" setget set_name, get_name
var texture setget set_texture, get_texture

var price_buy = 0 setget set_price_buy, get_price_buy
var price_sell = 0 setget set_price_sell, get_price_sell
var amount = 1 setget set_amount, get_amount
# Nivel en el cuál se dropea el item
var level_drop = 0 setget set_level_drop, get_level_drop

func get_id():
	return self.get_instance_id()
	
# Setters/Getters
#

func set_price_buy(_price_buy):
	price_buy = _price_buy
	
func get_price_buy():
	return price_buy
	
func set_price_sell(_price_sell):
	price_sell = _price_sell
	
func get_price_sell():
	return price_sell
	
func set_amount(_amount):
	amount = _amount
	
func get_amount():
	return amount

func set_level_drop(_level_drop):
	level_drop = _level_drop
	
func get_level_drop():
	return level_drop

func set_name(_name):
	name = _name
	
func get_name():
	return name

func set_texture(_texture):
	texture = _texture

func get_texture():
	return texture