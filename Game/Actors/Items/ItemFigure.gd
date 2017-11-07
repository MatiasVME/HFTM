extends RigidBody2D

onready var item_img = $ItemImg
onready var animation = $Animation

var item = null setget set_item
var is_mouse_inside = false

func _ready():
	set_process_input(true)
	
func _input(event):
	if event.is_action_pressed("left_click") and is_mouse_inside:
		animation.stop()
		animation.play("take")
		InventoryManager.get_current_inventory().add_item_next_position(self)
		get_parent().remove_child(self)

func set_item(_item):
	item_img.texture = _item.get_texture()
	item = _item
	
func _on_Area_mouse_entered():
	HUDManager.is_active_info_panel = true
	
	if item != null:
		HUDManager.set_info_panel(item)
		
	is_mouse_inside = true
	
func _on_Area_mouse_exited():
	HUDManager.is_active_info_panel = false
	is_mouse_inside = false
