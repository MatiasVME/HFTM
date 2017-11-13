extends Node

onready var account_panel = load("res://Game/MainScreens/AccountsPanel/AccountPanel.tscn")
onready var container = $"VBox/Control/Scroll/VBox"

var account_panels = []

func _ready():
	pass

func _on_OK_pressed():
	var i_account_panel = account_panel.instance()
	account_panels.append(i_account_panel)
	container.add_child(i_account_panel)
