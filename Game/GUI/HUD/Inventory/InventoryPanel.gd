extends Node2D

onready var panel_grid = $"Panel/Grid"

var item_in_mouse = null
var item_img_in_mouse = null

enum DragState {NONE, DRAG, DROP}
var drag_state = DragState.NONE

var current_button = null
var prev_button = null

func _ready():
	set_process(true)
	
func _process(delta):
	if item_img_in_mouse != null:
		item_img_in_mouse.global_position = self.get_global_mouse_position()
		drag_state = DragState.DRAG
		
	if drag_state == DragState.DRAG and current_button != null:
		var button = panel_grid.get_node(current_button)
		current_button = null

		if Input.is_action_just_released("left_click") and button.texture_normal == null:
			
			button.texture_normal = item_img_in_mouse.texture

			item_img_in_mouse = null
			self.get_owner().remove_child(item_img_in_mouse)
			drag_state = DragState.NONE

func add_item(item, srt_cords):
	if item != null:
		var texture = item.get_node("ItemImg").texture
		panel_grid.get_node(srt_cords).texture_normal = item.get_node("ItemImg").texture

# Añade los item de inventario (Sólo se tiene que ejecutar una sola vez)
func add_inventory_items(current_inventory):
	add_item(current_inventory.get_item(0,0), "0-0")
	add_item(current_inventory.get_item(0,1), "0-1")
	add_item(current_inventory.get_item(0,2), "0-2")
	add_item(current_inventory.get_item(0,3), "0-3")
	add_item(current_inventory.get_item(0,4), "0-4")
	add_item(current_inventory.get_item(0,5), "0-5")
	add_item(current_inventory.get_item(0,6), "0-6")
	add_item(current_inventory.get_item(0,7), "0-7")
	add_item(current_inventory.get_item(0,8), "0-8")
	add_item(current_inventory.get_item(0,9), "0-9")
	add_item(current_inventory.get_item(0,10), "0-10")
	
	add_item(current_inventory.get_item(1,0), "1-0")
	add_item(current_inventory.get_item(1,1), "1-1")
	add_item(current_inventory.get_item(1,2), "1-2")
	add_item(current_inventory.get_item(1,3), "1-3")
	add_item(current_inventory.get_item(1,4), "1-4")
	add_item(current_inventory.get_item(1,5), "1-5")
	add_item(current_inventory.get_item(1,6), "1-6")
	add_item(current_inventory.get_item(1,7), "1-7")
	add_item(current_inventory.get_item(1,8), "1-8")
	add_item(current_inventory.get_item(1,9), "1-9")
	add_item(current_inventory.get_item(1,10), "1-10")
	
	add_item(current_inventory.get_item(2,0), "2-0")
	add_item(current_inventory.get_item(2,1), "2-1")
	add_item(current_inventory.get_item(2,2), "2-2")
	add_item(current_inventory.get_item(2,3), "2-3")
	add_item(current_inventory.get_item(2,4), "2-4")
	add_item(current_inventory.get_item(2,5), "2-5")
	add_item(current_inventory.get_item(2,6), "2-6")
	add_item(current_inventory.get_item(2,7), "2-7")
	add_item(current_inventory.get_item(2,8), "2-8")
	add_item(current_inventory.get_item(2,9), "2-9")
	add_item(current_inventory.get_item(2,10), "2-10")
	
	add_item(current_inventory.get_item(3,0), "3-0")
	add_item(current_inventory.get_item(3,1), "3-1")
	add_item(current_inventory.get_item(3,2), "3-2")
	add_item(current_inventory.get_item(3,3), "3-3")
	add_item(current_inventory.get_item(3,4), "3-4")
	add_item(current_inventory.get_item(3,5), "3-5")
	add_item(current_inventory.get_item(3,6), "3-6")
	add_item(current_inventory.get_item(3,7), "3-7")
	add_item(current_inventory.get_item(3,8), "3-8")
	add_item(current_inventory.get_item(3,9), "3-9")
	add_item(current_inventory.get_item(3,10), "3-10")
	
	add_item(current_inventory.get_item(4,0), "4-0")
	add_item(current_inventory.get_item(4,1), "4-1")
	add_item(current_inventory.get_item(4,2), "4-2")
	add_item(current_inventory.get_item(4,3), "4-3")
	add_item(current_inventory.get_item(4,4), "4-4")
	add_item(current_inventory.get_item(4,5), "4-5")
	add_item(current_inventory.get_item(4,6), "4-6")
	add_item(current_inventory.get_item(4,7), "4-7")
	add_item(current_inventory.get_item(4,8), "4-8")
	add_item(current_inventory.get_item(4,9), "4-9")
	add_item(current_inventory.get_item(4,10), "4-10")
