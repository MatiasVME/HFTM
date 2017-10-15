extends RigidBody2D

func fire(this, mouse_pos, delta):
	if ShotManager.can_fire:
		this.get_parent().add_child(self)
		self.add_to_group("Bullets")
		self.set_pos(this.get_pos())
		self.apply_impulse(Vector2(0,0), mouse_pos * delta * 200)
		ShotManager.fire(5)

func _on_Destroy_timeout():
	self.queue_free()
