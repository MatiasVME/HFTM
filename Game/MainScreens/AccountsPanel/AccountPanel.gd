extends Control

var panel_owner = "" setget set_panel_owner, get_panel_owner

func _ready():
	$"Panel/VBox/HBox/AccountTitle".text = tr("ACCOUNT")
	$"Panel/VBox/AccountName".text = tr("ACCOUNT_NAME")
	$"Panel/VBox/Team".text = tr("TEAM")

func set_panel_owner(_owner):
	panel_owner = _owner
	
func get_panel_owner():
	return panel_owner

func _on_DeleteAccount_pressed():
	Persistent.delete_account(panel_owner)
	self.queue_free()
