extends RigidBody2D

onready var item_img = $ItemImg
onready var animation = $Animation

var item = null setget set_item
var is_mouse_inside = false

var is_taken = false

func _ready():
	set_process_input(true)
	set_process(true)
	
func _input(event):
	if event.is_action_pressed("left_click") and is_mouse_inside:
		animation.stop()
		animation.play("take")
		InventoryManager.get_current_inventory().add_item_next_position(self)
		is_taken = true
		
		# TODO: Hacer esto solo cuando el inventario este abierto.
		# Añade el item al inventario
		var inventory_panel = get_tree().get_nodes_in_group("InventoryPanel")[0]
		inventory_panel.add_inventory_items(InventoryManager.get_current_inventory())

func _process(delta):
	if is_taken and not animation.is_playing():
		get_parent().remove_child(self)
	elif not is_taken and not animation.is_playing():
		animation.play("idle")

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
