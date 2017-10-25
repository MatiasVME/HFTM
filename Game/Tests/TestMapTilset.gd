extends Node2D

onready var player = $Player
onready var player2 = $Player2
onready var camera = $MainCamera
onready var vehicle = $"NJC-104"

func _ready():
	MusicManager.select_music(2)
	MusicManager.play_music()
	FocusManager.set_camera(camera)
	FocusManager.add_player(player)
	FocusManager.add_player(player2)
	FocusManager.select_focus(1)
	
	FocusManager.add_vehicle(vehicle, false)
	
	# camera.set_look(player)
	# player.set_camera(camera)