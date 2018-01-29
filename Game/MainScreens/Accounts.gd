extends Node

onready var account_panel = load("res://Game/MainScreens/AccountsPanel/AccountPanel.tscn")
onready var container = $"VBox/Control/Scroll/VBox"
onready var line_edit = $"VBox/Control/Scroll/VBox/NewAccountPanel/Panel/VBox/LineEdit"

var account_panels = []

func _ready():
	$"VBox/AccountsTitle".text = tr("ACCOUNTS")
	$"VBox/Back/Label".text = tr("BACK")
	
	show_accounts()

func show_accounts():
	var accounts = Persistent.get_accounts()
	
	if accounts.size() < 1:
		if GameGlobals.debug: print("No hay cuentas para añadir a la escena")
		return
	
	for account in accounts:
		var account_panel = create_account_panel()
		account_panel.get_node("Panel/VBox/AccountName").text = account
		
		# Cada panel tiene una referencia a la cuenta a la que pertenece
		# ya que así se puede eliminar el panel con el botón x.
		account_panel.set_p_owner(account)
		
		var account_data = Persistent.get_account_data(account)
		
		if account_data["Players"].size() < 1:
			void_account_panel(account_panel)
		
func create_account_panel():
	var i_account_panel = account_panel.instance()
	account_panels.append(i_account_panel)
	container.add_child(i_account_panel)
	container.move_child(i_account_panel, 0)
	
	return i_account_panel
	
func void_account_panel(account_panel):
	account_panel.get_node("Panel/VBox/Team").queue_free()
	account_panel.get_node("Panel/VBox/Grid").queue_free()
	
func _on_OK_pressed():
	var account_panel = create_account_panel()
	account_panel.get_node("Panel/VBox/AccountName").text = line_edit.text
	void_account_panel(account_panel)
	
	Persistent.create_account(line_edit.text)
	line_edit.text = ""

func _on_Back_pressed():
	get_tree().change_scene("res://Game/MainScreens/MainMenu.tscn")
