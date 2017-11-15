extends Control

var owner = "" setget set_owner, get_owner

func set_owner(_owner):
	owner = _owner
	
func get_owner():
	return owner

func _on_DeleteAccount_pressed():
	Persistent.delete_account(owner)
	self.queue_free()
