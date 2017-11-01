extends Node2D

onready var item_img = $ItemImg

func _ready():
	pass

func set_item(item):
	item_img.texture = item.get_texture()
	