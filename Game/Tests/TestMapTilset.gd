extends Node2D

onready var player = $Player
onready var player2 = $Player2
onready var camera = $MainCamera
onready var vehicle = $"NJC-104"
onready var HUD = $HUD

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
	
	# camera.set_look(player)
	# player.set_camera(camera)
	
func _input(event):
	if event.is_action_pressed("ui_cancel"):
		if HUD.get_node("Menu").is_visible():
			HUD.get_node("Menu").visible = false
		else:
			HUD.get_node("Menu").visible = true