extends Node

onready var account_panel = load("res://Game/MainScreens/AccountsPanel/AccountPanel.tscn")
onready var container = $"VBox/Control/Scroll/VBox"
onready var line_edit = $"VBox/Control/Scroll/VBox/NewAccountPanel/Panel/VBox/LineEdit"

var account_panels = []

func _ready():
	pass

func _on_OK_pressed():
	var i_account_panel = account_panel.instance()
	account_panels.append(i_account_panel)
	container.add_child(i_account_panel)
	container.move_child(i_account_panel, 0)
	
	Persistent.create_account(line_edit.text)
	line_edit.text = ""
