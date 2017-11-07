extends TextureButton

func _ready():
	pass

func get_drag_data(position):
	if self.texture_normal != null:
		var button = TextureButton.new()
		button.texture_normal = self.texture_normal
		button.rect_scale = Vector2(0.2, 0.2)
		set_drag_preview(button)
		return self.texture_normal
	
func can_drop_data(position, data):
	print("data")
	
func drop_data(position, data):
	pass