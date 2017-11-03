extends Node2D

onready var item_img = $ItemImg

var item = null setget set_item

func _ready():
	pass

func set_item(_item):
	item_img.texture = _item.get_texture()
	item = _item
	
func _on_Area_mouse_entered():
	HUDManager.is_active_info_panel = true
	
	if item != null:
		HUDManager.set_info_panel(item)
	
func _on_Area_mouse_exited():
	HUDManager.is_active_info_panel = false
