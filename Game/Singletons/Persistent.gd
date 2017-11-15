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
var accounts = [] setget , get_accounts

# Generic data path
var data_amount = get_data_amount()

func _ready():
	match type:
		Type.DISK: option_disk()
		Type.ONLINE: option_online()

func option_disk():
	var accounts_file_data = File.new()
	
	if accounts_file_data.file_exists(ACCOUNTS_NAME_PATH):	
		load_accounts()
	else:
		save_accounts()
		load_accounts()

# Implementar en un futuro
func option_online():
	pass

func save_accounts():
	var file = File.new()
	var err = file.open_encrypted_with_pass(ACCOUNTS_NAME_PATH, 
			File.WRITE, temporal_password)
	file.store_var(accounts)
	file.close()

func load_accounts():
	var file = File.new()
	var err = file.open_encrypted_with_pass(ACCOUNTS_NAME_PATH, 
			File.READ, temporal_password)
	
	accounts = file.get_var()
	file.close()
	
	print("accounts: ", accounts)
	
	if accounts.size() >= 1:
		for account in accounts:
			print(account)

func create_account(name):
	accounts.append(name)
	save_accounts()
	create_new_data(name)

# Crea la nueva data y la guarda
func create_new_data(account_name):
	var data_account = create_data_account(account_name)
	
	if account_name != "accounts":
		var path = "user://" + account_name + ".bin"
		var file = File.new()
		var err = file.open_encrypted_with_pass(path, 
			File.WRITE, temporal_password)
		file.store_var(data_account)
		file.close()
	else:
		if GameGlobals.debug: print("account_name no puede llamarse: ", account_name)

func create_data_account(owner):
	var data_account = {
		Owner = owner,
		Players = []
	}
	
	return data_account

func delete_account(name):
	if not accounts.has(name):
		if GameGlobals.debug: print("No se encuentra %s para ser borrado" % name)
		return
	
	delete_account_data(name)
	
	accounts.remove(accounts.find(name))
	save_accounts()
	
func delete_account_data(name):
	var directory = Directory.new()
	var path = "user://" + name + ".bin"
	
	if not directory.file_exists(path):
		if GameGlobals.debug: print("No se puede eliminar ", name, " ya que no existe el path: ", path)
		return

	var err = directory.remove(path)

# Implementar en un futuro
func change_option(type):
	pass
	
# Setters/Getters
#

func get_accounts():
	return accounts

func get_data_amount():
#	var file_data = File.new()
	pass

# Este método es para obtener la data de una cuenta en específico
# para uso mas recurrente es mejor utilizar get_current_account_data.
# Pero si se desea saber la data de otras cuentas es se puede utilizar
# este método.
func get_account_data(account_name):
	var file = File.new()
	var path = "user://" + account_name + ".bin"
	
	if file.file_exists(path):
		var err = file.open_encrypted_with_pass(path, 
				File.READ, temporal_password)
		var account_data = file.get_var()
		file.close()
		
		return account_data