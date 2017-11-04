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
	
	if GameGlobals.music_enable:
		MusicManager.select_music(2)
		MusicManager.play_music()
	
	FocusManager.set_camera(camera)
	FocusManager.add_player(player)
	FocusManager.add_player(player2)
	FocusManager.select_focus(1)
	
	FocusManager.add_vehicle(vehicle, false)
	
	# test items
	var i_item = item.instance()
	self.add_child(i_item)
	i_item.set_item(ItemManager.get_gun("Test gun", 1))
	i_item.position = Vector2(700, 100)
	
	var i_item2 = item.instance()
	self.add_child(i_item2)
	i_item2.set_item(ItemManager.get_gun("Test gun2", 2))
	i_item2.position = Vector2(700, 200)
	
	var i_item3 = item.instance()
	self.add_child(i_item3)
	i_item3.set_item(ItemManager.get_gun("Test gun3", 3))
	i_item3.position = Vector2(700, 300)
	
	var i_item4 = item.instance()
	self.add_child(i_item4)
	i_item4.set_item(ItemManager.get_gun("Test gun3", 10))
	i_item4.position = Vector2(700, 400)
	
	# test item in inventory
	
	var i_player_inventory = player_inventory.new()
	var i_inventory = inventory.new()
	i_inventory.set_owner(player.get_player_name())
	print("owner: ", player.get_player_name())
	i_player_inventory.set_inventory(i_inventory)

	InventoryManager.add_inventory(i_inventory)
	InventoryManager.set_current_inventory(0) # después hay que hacer que sea mas dinámico

	var i_item5 = item.instance()
	i_inventory.add_item(i_item5, 0, 0)
	
	
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
