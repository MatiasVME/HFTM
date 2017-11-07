extends TextureButton

func get_drag_data(position):
	InventoryManager.prev_slot = self
	
	if self.texture_normal != null:
		var button = TextureButton.new()
		button.texture_normal = self.texture_normal
		button.rect_scale = Vector2(0.2, 0.2)
		set_drag_preview(button)
		self.texture_normal = null
		
		var cords = get_item_cords(self.get_name())
		# Retirar el item
		var item = InventoryManager.get_current_inventory().retire_item(cords.x, cords.y)
		
		return item
	else:
		if GameGlobals.debug: print("texture_normal: ", self.texture_normal)
	
func can_drop_data(position, data):
	if self.texture_normal == null:
		return true
	else:
		if Input.is_action_just_released("left_click"):
			var cords = InventoryManager.prev_slot.get_item_cords(InventoryManager.prev_slot.get_name())
			InventoryManager.prev_slot.texture_normal = data.get_node("ItemImg").texture
			InventoryManager.get_current_inventory().add_item(data, cords.x, cords.y)
		
		return false
	
func drop_data(position, data):
	var cords = get_item_cords(self.get_name())
	self.texture_normal = data.get_node("ItemImg").texture
	InventoryManager.get_current_inventory().add_item(data, cords.x, cords.y)

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
		"2-1": return Vector2(2,1)
		"2-2": return Vector2(2,2)
		"2-3": return Vector2(2,3)
		"2-4": return Vector2(2,4)
		"2-5": return Vector2(2,5)
		"2-6": return Vector2(2,6)
		"2-7": return Vector2(2,7)
		"2-8": return Vector2(2,8)
		"2-9": return Vector2(2,9)
		"2-10": return Vector2(2,10)
		"3-0": return Vector2(3,0)
		"3-1": return Vector2(3,1)
		"3-2": return Vector2(3,2)
		"3-3": return Vector2(3,3)
		"3-4": return Vector2(3,4)
		"3-5": return Vector2(3,5)
		"3-6": return Vector2(3,6)
		"3-7": return Vector2(3,7)
		"3-8": return Vector2(3,8)
		"3-9": return Vector2(3,9)
		"3-10": return Vector2(3,10)
		"4-0": return Vector2(4,0)
		"4-1": return Vector2(4,1)
		"4-2": return Vector2(4,2)
		"4-3": return Vector2(4,3)
		"4-4": return Vector2(4,4)
		"4-5": return Vector2(4,5)
		"4-6": return Vector2(4,6)
		"4-7": return Vector2(4,7)
		"4-8": return Vector2(4,8)
		"4-9": return Vector2(4,9)
		"4-10": return Vector2(4,10)