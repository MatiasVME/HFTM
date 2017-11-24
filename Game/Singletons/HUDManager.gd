extends Node

var is_active_info_panel = false

var hud = null setget set_hud, get_hud

enum HudElement {BARS, PHOTOS_MINI, HOTBAR, HUD_MENU}

# Show Hud Elements (no se ha testiado de momento)
func hud_element_show_and_hide(element):
	match element:
		hud.HudElement.BARS:
			hud.hud_show_and_hide(hud.HudElement.BARS)
		hud.HudElement.PHOTOS_MINI:
			hud.hud_show_and_hide(hud.HudElement.PHOTOS_MINI)
		hud.HudElement.HOTBAR:
			hud.hud_show_and_hide(hud.HudElement.HOTBAR)
		hud.HudElement.HUD_MENU:
			hud.hud_show_and_hide(hud.HudElement.HUD_MENU)

func hud_show_all():
	hud.animation_all.play("show")

func set_info_panel(item):
	if hud_is_null(): return
	
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
	if hud_is_null(): return
	
	var dialog_panel = hud.get_node("DialogPanel")
	dialog_panel.set_current_dialog(dialog)

func get_dialog():
	if hud_is_null(): return
	
	var dialog_panel = hud.get_node("DialogPanel")
	
	return dialog_panel.get_current_dialog()
	
func start_dialog():
	if hud != null:
		var dialog_panel = hud.get_node("DialogPanel")
		dialog_panel.start_dialog()

func hud_is_null():
	if hud == null:
		if GameGlobals.debug: print("HUD es null")
		return true
		
	return false

# Setters/Getters
#

func set_hud(_hud):
	hud = _hud
	
func get_hud():
	return hud
	
func get_drop_out():
	if hud_is_null(): return
	
	return hud.drop_out
	