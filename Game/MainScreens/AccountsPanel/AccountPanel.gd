extends Control

var p_owner = "" setget set_p_owner, get_p_owner

func _ready():
	$"Panel/VBox/HBox/AccountTitle".text = tr("ACCOUNT")
	$"Panel/VBox/AccountName".text = tr("ACCOUNT_NAME")
	$"Panel/VBox/Team".text = tr("TEAM")

func set_p_owner(_owner):
	p_owner = _owner
	
func get_p_owner():
	return p_owner

func _on_DeleteAccount_pressed():
	Persistent.delete_account(owner)
	self.queue_free()
