extends CanvasLayer

onready var animation_inventory = $AnimationInventory
onready var animation_stats = $AnimationStats
onready var animation_bars = $AnimationBars
onready var animation_hud_menu = $"AnimationHUD-Menu"
onready var animation_photos_mini = $AnimationPhotosMini
onready var animation_hotbar = $AnimationHotbar
onready var animation_info_player = $AnimationInfoPanel

var bars_show = false
var photos_mini_show = false
var hotbar_show = false
var hud_menu_show = false
var inventory_show = false
var stats_show = false

enum HudElement {BARS, PHOTOS_MINI, HOTBAR, HUD_MENU}

func _ready():
	set_process(true)
	set_process_input(true)
	
	HUDManager.set_hud(self)
	
func _process(delta):
	if HUDManager.is_active_info_panel and not animation_info_player.get_current_animation() == "info_panel_show":
		info_panel_show()
	elif not HUDManager.is_active_info_panel and not animation_info_player.get_current_animation() == "info_panel_hide":
		info_panel_hide()

func _input(event):
	if event.is_action_pressed("inventory") and not animation_inventory.is_playing():
		if not inventory_show:
			inventory_show = true
			animation_inventory.play("inventory_show")
		else:
			inventory_show = false
			animation_inventory.play("inventory_hide")
	if event.is_action_pressed("stats") and not animation_stats.is_playing():
		if not stats_show:
			stats_show = true
			animation_stats.play("stats_show")
		else:
			stats_show = false
			animation_stats.play("stats_hide")
	
	if GameGlobals.debug: debug_hud(event)

func debug_hud(event):
	if event.is_action_pressed("1"):
		hud_show_and_hide(HudElement.BARS)
	if event.is_action_pressed("2"):
		hud_show_and_hide(HudElement.PHOTOS_MINI)
	if event.is_action_pressed("3"):
		hud_show_and_hide(HudElement.HOTBAR)
	if event.is_action_pressed("4"):
		hud_show_and_hide(HudElement.HUD_MENU)

func hud_show_and_hide(_HudElement):
	match _HudElement:
		HudElement.BARS: bars_show_and_hide()
		HudElement.PHOTOS_MINI: photos_mini_show_and_hide()
		HudElement.HOTBAR: hotbar_show_and_hide()
		HudElement.HUD_MENU: hud_menu_show_and_hide()
			
func bars_show_and_hide():
	if not animation_bars.is_playing():
		if not bars_show:
			animation_bars.play("bars_show")
			bars_show = true
		else:
			animation_bars.play("bars_hide")
			bars_show = false

func photos_mini_show_and_hide():
	if not animation_photos_mini.is_playing():
		if not photos_mini_show:
			animation_photos_mini.play("photos_mini_show")
			photos_mini_show = true
		else:
			animation_photos_mini.play("photos_mini_hide")
			photos_mini_show = false

func hotbar_show_and_hide():
	if not animation_hotbar.is_playing():
		if not hotbar_show:
			animation_hotbar.play("hotbar_show")
			hotbar_show = true
		else:
			animation_hotbar.play("hotbar_hide")
			hotbar_show = false
			
func hud_menu_show_and_hide():
	if not animation_hud_menu.is_playing():
		if not hud_menu_show:
			animation_hud_menu.play("hud_menu_show")
			hud_menu_show = true
		else:
			animation_hud_menu.play("hud_menu_hide")
			hud_menu_show = false
			
func info_panel_show():
	animation_info_player.play("info_panel_show")

func info_panel_hide():
	animation_info_player.play("info_panel_hide")