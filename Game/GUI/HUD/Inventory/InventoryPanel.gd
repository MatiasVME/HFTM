extends Node2D

onready var inventory_node = $Inventory
onready var panel_grid = $"Panel/Grid"

var item_pos = null

func _ready():
	set_physics_process(true)
	
func _physics_process(delta):
	update()

# Añade los item de inventario (Sólo se tiene que ejecutar una sola vez)
func add_inventory_items(current_inventory):
	if current_inventory.get_item(0,0) != null:
		print("___current_inventory.get_item(0,0): ", current_inventory.get_item(0,0))
		#inventory_node.get_node("0-0").add_child(current_inventory.get_item(0,0))
		#inventory_node.get_node("0-0").add_child(current_inventory.get_item(0,0))
		#current_inventory.get_item(0,0).scale = Vector2(1.1, 0.1)
		var texture = current_inventory.get_item(0,0).get_node("ItemImg").texture
		panel_grid.get_node("0-0").texture_normal = current_inventory.get_item(0,0).get_node("ItemImg").texture
		panel_grid.get_node("0-0").rect_scale = Vector2(0.1, 0.1)
		
func move_inventory_items(current_inventory):
	if current_inventory != null:
		if current_inventory.get_item(0,0) != null:
			print("moviendo... ", current_inventory.get_item(0,0).global_position)
#			item_pos = current_inventory.get_item(0,0).global_position
#			current_inventory.get_item(0,0).position = inventory_node.get_node("0-0").position
#			current_inventory.get_item(0,0).position.x -= 1000
#			current_inventory.get_item(0,0).position.y -= 500
func _draw():
	if item_pos != null:
		print("draww!!")
		var player = get_tree().get_nodes_in_group("Player")[1]
		var item_p = item_pos
		item_p.x -= 0
		item_p.y -= 0
		draw_line(player.position, item_p, Color(1,0,0), 3)
		draw_circle(item_p, 10, Color(0, 1, 0))

