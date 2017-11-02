extends Node2D

onready var item_img = $ItemImg

func _ready():
	pass

func set_item(item):
	item_img.texture = item.get_texture()
	
func _on_Area_mouse_entered():
	HUDManager.is_active_info_panel = true
	
func _on_Area_mouse_exited():
	HUDManager.is_active_info_panel = false
