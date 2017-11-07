extends TextureButton

func get_drag_data(position):
	InventoryManager.prev_slot = self
	
	if self.texture_normal != null:
		var button = TextureButton.new()
		button.texture_normal = self.texture_normal
		button.rect_scale = Vector2(0.2, 0.2)
		set_drag_preview(button)
		self.texture_normal = null
		
		# Retirar el item
		var cords = get_item_cords(self.get_name())
		var item = InventoryManager.get_current_inventory().retire_item(cords.x, cords.y)
		
		return item
	else:
		if GameGlobals.debug: print("texture_normal: ", self.texture_normal)
	
func can_drop_data(position, data):
	if self.texture_normal == null:
		return true
	else:
		if GameGlobals.debug: print("can_drop_data data no es null: ", data)
		return false
	
func drop_data(position, data):
#	if self.texture_normal == null:
	var cords = get_item_cords(self.get_name())
	self.texture_normal = data.get_node("ItemImg").texture
	InventoryManager.get_current_inventory().add_item(data, cords.x, cords.y)
#	else:
#		var cords = InventoryManager.prev_slot.get_item_cords(InventoryManager.prev_slot.get_name())
#		InventoryManager.prev_slot.texture_normal = data.get_node("ItemImg").texture
#		InventoryManager.get_current_inventory().add_item(data, cords.x, cords.y)
#

func get_item_cords(node_name):
	match node_name:
		"0-0": return Vector2(0,0)
		"0-1": return Vector2(0,1)
		"0-2": return Vector2(0,2)
		"0-3": return Vector2(0,3)
		"0-4": return Vector2(0,4)
		"0-5": return Vector2(0,5)
		"0-6": return Vector2(0,6)
		"0-7": return Vector2(0,7)
		"0-8": return Vector2(0,8)
		"0-9": return Vector2(0,9)
		"0-10": return Vector2(0,10)
		"1-0": return Vector2(1,0)
		"1-1": return Vector2(1,1)
		"1-2": return Vector2(1,2)
		"1-3": return Vector2(1,3)
		"1-4": return Vector2(1,4)
		"1-5": return Vector2(1,5)
		"1-6": return Vector2(1,6)
		"1-7": return Vector2(1,7)
		"1-8": return Vector2(1,8)
		"1-9": return Vector2(1,9)
		"1-10": return Vector2(1,10)
		"2-0": return Vector2(2,0)
			