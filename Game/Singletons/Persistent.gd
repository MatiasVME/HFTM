# Persistent.gd
# Para guardar y cargar datos en disco o en una base
# de datos online (En un futuro)

extends Node

enum Type {DISK, ONLINE}
var type = Type.DISK

# Sólo es un password temporal ya que no esta funcionando
# OS.get_unique_id()
var temporal_password = "y~mu_L!6$qq9o119y1W("

const ACCOUNTS_NAME_PATH = "user://accounts.bin"
var accounts_is_loaded = false
var accounts = [] setget , get_accounts


# Generic data path
var g_data_path = "user://account_.bin"
var data_amount = get_data_amount()

func _ready():
	match type:
		Type.DISK: option_disk()
		Type.ONLINE: option_online()

func option_disk():
	var accounts_file_data = File.new()
	
	if accounts_file_data.file_exists(ACCOUNTS_NAME_PATH):	
		load_accounts_data()
		print("existe fichero accounts")
	else:
		save_accounts_data()
		print("no existe fichero accounts")

# Implementar en un futuro
func option_online():
	pass

func save_accounts_data():
	var file = File.new()
	var err = file.open_encrypted_with_pass(ACCOUNTS_NAME_PATH, 
			File.WRITE, temporal_password)
	file.store_var(accounts)
	file.close()
	
	accounts_is_loaded = false

func load_accounts_data():
	var file = File.new()
	var err = file.open_encrypted_with_pass(ACCOUNTS_NAME_PATH, 
			File.READ, temporal_password)
	
	accounts = file.get_var()
	file.close()
	
	print("accounts: ", accounts)
	
	if accounts.size() >= 1:
		for account in accounts:
			print(account)
			
	accounts_is_loaded = true

func create_account(name):
	if accounts_is_loaded:
		accounts.append(name)
		save_accounts_data()
	else:
		if GameGlobals.debug: print("El fichero aún no esta cargado")
	
func create_new_data():
	pass

# Implementar en un futuro
func change_option(type):
	pass
	
# Setters/Getters
#

func get_accounts():
	return accounts

func get_data_amount():
	var file_data = File.new()
	