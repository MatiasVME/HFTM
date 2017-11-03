extends Node

# Atributos que pueden ser utilizados como requerimientos o atributos
# que proporciona un item, o atributos del jugador.

var strength setget set_strength, get_strength
var dexterity setget set_dexterity, get_dexterity
var vitality setget set_vitality, get_vitality
var energy setget set_energy, get_energy

func _init(_strength, _dexterity, _vitality, _energy):
	strength = _strength
	dexterity = _dexterity
	vitality = _vitality
	energy = _energy
	
# Setters/Getters
#

func set_strength(_strength):
	strength = _strength
	
func get_strength():
	return strength
	
func set_dexterity(_dexterity):
	dexterity = _dexterity
	
func get_dexterity():
	return dexterity
	
func set_vitality(_vitality):
	vitality = _vitality
	
func get_vitality():
	return vitality
	
func set_energy(_energy):
	energy = _energy
	
func get_energy():
	return energy