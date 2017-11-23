extends Control

func can_drop_data(position, data):
	return true

func drop_data(position, data):
	var focus = FocusManager.get_current_focus()
	var map = get_tree().get_nodes_in_group("Map")[0]
	
	map.add_child(data)
	
	# Por el momento:
	var item_pos = focus.global_position
	item_pos.x = item_pos.x + randi() % 100 - 100
	item_pos.y = item_pos.y + randi() % 100 - 100
	
	data.global_position = item_pos
	data.animation.play("show")
	data.is_taken = false

	self.visible = false