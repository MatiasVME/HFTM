extends Node

var is_active_info_panel = false

var hud = null setget set_hud, get_hud

func set_info_panel(item):
	if hud == null:
		if GameGlobals.debug: print("HUD es null")
		return
	
	var info_panel = hud.get_node("InfoPanel")
	
	info_panel.get_node("Item").texture = item.get_texture()
	info_panel.get_node("MainGrid/Name").text = item.get_name()
	info_panel.get_node("MainGrid/Category").text = str(item.get_category()) #todo: fix
	info_panel.get_node("MainGrid/Damage").text = str(item.get_damage_max())
	#info_panel.get_node("MainGrid/Speed").text = str(item.get_speed())
	info_panel.get_node("RequirementsGrid/Strength").text = str(item.get_requirements().get_strength())
	info_panel.get_node("RequirementsGrid/Dexterity").text = str(item.get_requirements().get_dexterity())
	info_panel.get_node("RequirementsGrid/Vitality").text = str(item.get_requirements().get_vitality())
	info_panel.get_node("RequirementsGrid/Energy").text = str(item.get_requirements().get_energy())

# Dialog
#

func set_dialog(dialog):
	if hud != null:
		var dialog_panel = hud.get_node("DialogPanel")
		dialog_panel.set_current_dialog(dialog)
	else:
		if GameGlobals.debug: print("hud es null: ", hud)

func get_dialog():
	if hud != null:
		var dialog_panel = hud.get_node("DialogPanel")
		return dialog_panel.get_current_dialog()
	
func start_dialog():
	if hud != null:
		var dialog_panel = hud.get_node("DialogPanel")
		dialog_panel.start_dialog()

# Setters/Getters
#

func set_hud(_hud):
	hud = _hud
	
func get_hud():
	return hud
	
func get_drop_out():
	if hud == null:
		if GameGlobals.debug: print("HUD es null")
		return
	
	return hud.drop_out
	