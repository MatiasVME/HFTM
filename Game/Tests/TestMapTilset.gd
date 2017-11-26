extends Node2D

onready var player = $Player
onready var player2 = $Player2
onready var camera = $MainCamera
onready var vehicle = $"NJC-104"
onready var HUD = $HUD

onready var player_inventory = load("res://Game/Actors/Players/PlayerInventory.gd")
onready var inventory = load("res://Game/GUI/HUD/Inventory/Inventory.gd")
onready var item = preload("res://Game/Actors/Items/ItemFigure.tscn")

func _ready():
	set_process_input(true)
	
	# en un futuro esto será automático
	player.set_player_name("Pepito")
	player2.set_player_name("Pedrito")
	player.create_inventory()
	player2.create_inventory()
	
	if GameGlobals.music_enable:
		MusicManager.select_music(2)
		MusicManager.play_music()
	
	FocusManager.set_camera(camera)
	FocusManager.add_player(player)
	FocusManager.add_player(player2)
	FocusManager.select_focus(2)
	# FocusManager.next_focus()
	
	FocusManager.add_vehicle(vehicle, false)
	
	# test items
	var i_item = item.instance()
	self.add_child(i_item)
	i_item.set_item(ItemManager.get_gun("Test gun", 1))
	i_item.position = Vector2(700, 100)
	
	var i_item2 = item.instance()
	self.add_child(i_item2)
	i_item2.set_item(ItemManager.get_gun("Test gun2", 2))
	i_item2.position = Vector2(700, 105)
	
	var i_item3 = item.instance()
	self.add_child(i_item3)
	i_item3.set_item(ItemManager.get_gun("Test gun3", 3))
	i_item3.position = Vector2(700, 100)
	
	var i_item4 = item.instance()
	self.add_child(i_item4)
	i_item4.set_item(ItemManager.get_gun("Test gun3", 10))
	i_item4.position = Vector2(700, 100)
	
	var i_item6 = item.instance()
	self.add_child(i_item6)
	i_item6.set_item(ItemManager.get_gun("Test gun3", 10))
	i_item6.position = Vector2(700, 100)

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		if HUD.get_node("MenuPause").is_visible():
			HUD.get_node("MenuPause").visible = false
			get_tree().set_pause(false)
		else:
			HUD.get_node("MenuPause").visible = true
			get_tree().set_pause(true)
	
func _exit_tree():
	FocusManager.focus = []
	get_tree().set_pause(false)

func _on_ShowHud_timeout():
	HUDManager.hud_show_all()
