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
			print("ok")

# Añade los item de inventario (Sólo se tiene que ejecutar una sola vez)
func add_inventory_items(current_inventory):
	add_item(current_inventory.get_item(0,0), "0-0")
	add_item(current_inventory.get_item(0,1), "0-1")
	add_item(current_inventory.get_item(0,2), "0-2")
	add_item(current_inventory.get_item(0,3), "0-3")
	
func add_item(item, srt_cords):
	if item != null:
		var texture = item.get_node("ItemImg").texture
		panel_grid.get_node(srt_cords).texture_normal = item.get_node("ItemImg").texture

#func move_inventory_items(current_inventory):
#	if current_inventory != null:
#		if current_inventory.get_item(0,0) != null:
#			print("moviendo... ", current_inventory.get_item(0,0).global_position)
#
func item_click(item, srt_cords):
	var img_item = Sprite.new()
	
	img_item.texture = panel_grid.get_node(srt_cords).texture_normal
	img_item.scale = Vector2(0.2, 0.2)
	self.get_owner().add_child(img_item)
	
	item_img_in_mouse = img_item
	item_in_mouse = item
	
	panel_grid.get_node(srt_cords).texture_normal = null

func _on_00_button_down():
	var current_inventory = InventoryManager.get_current_inventory()
	
	if current_inventory != null:
		item_click(current_inventory.get_item(0,0), "0-0")

func _on_00_mouse_entered():
	pass
	
func _on_01_mouse_entered():
	pass


func _on_00_gui_input( ev ):
	if ev.is_action_just_released("left_click"):
		print("hello")
