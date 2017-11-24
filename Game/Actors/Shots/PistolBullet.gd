extends RigidBody2D

func fire(this, mouse_pos, delta):
	var origin_bullet = this.get_node("Image/Gun")
	var player_pos = this.global_position
	
	if ShotManager.can_fire:
		this.get_parent().add_child(self)
		self.add_to_group("Bullets")
		var direction = (mouse_pos - origin_bullet.global_position)
		self.set_position(this.get_node("Image/Gun").get_global_position())
		self.set_axis_velocity(direction * delta * 500)
		ShotManager.fire(20)
		
func enemy_fire(enemy, player, delta):
	var origin_bullet = enemy.get_node("Body/Canon1")
	var player_pos = player.global_position
	if ShotManager.can_fire:
		enemy.get_parent().add_child(self)
		self.add_to_group("Bullets")
		var direction = (player_pos - origin_bullet.global_position)
		self.set_position(enemy.get_node("Body/Canon1").get_global_position())
		self.set_axis_velocity(direction * delta * 500)
		ShotManager.enemyfire(20)
	
func _on_Destroy_timeout():
	self.queue_free()
