extends Node2D

onready var panel_grid = $"Panel/Grid"

func _ready():
	set_process(true)
	
func _process(delta):
	# TODO: Ver si un item fue añadido al inventario y hacer una animación al
	# al momento de añadirlo.
	
	pass

# Añade los item de inventario (Sólo se tiene que ejecutar una sola vez)
func add_inventory_items(current_inventory):
	# Esto se podría optimizar a futuro
	for i in range(5):
		add_item(current_inventory.get_item(i,0), str(i)+"-0")
		add_item(current_inventory.get_item(i,1), str(i)+"-1")
		add_item(current_inventory.get_item(i,2), str(i)+"-2")
		add_item(current_inventory.get_item(i,3), str(i)+"-3")
		add_item(current_inventory.get_item(i,4), str(i)+"-4")
		add_item(current_inventory.get_item(i,5), str(i)+"-5")
		add_item(current_inventory.get_item(i,6), str(i)+"-6")
		add_item(current_inventory.get_item(i,7), str(i)+"-7")
		add_item(current_inventory.get_item(i,8), str(i)+"-8")
		add_item(current_inventory.get_item(i,9), str(i)+"-9")
		add_item(current_inventory.get_item(i,10), str(i)+"-10")

# Método que añade un item al inventario dependiendo de sus coordenadas
func add_item(item, srt_cords):
	if item != null:
		var texture = item.get_node("ItemImg").texture
		panel_grid.get_node(srt_cords).texture_normal = item.get_node("ItemImg").texture
	else:
		panel_grid.get_node(srt_cords).texture_normal = null