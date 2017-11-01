extends Node2D

onready var item_img = $ItemImg

func _ready():
#	var img = load("res://Game/Actors/Items/Weapons/Gun/G-101/G-101.png")
#	item_img.texture = img
	pass

func set_item(item):
	item_img.texture = item.get_texture()
	