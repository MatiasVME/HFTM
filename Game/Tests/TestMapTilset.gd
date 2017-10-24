extends Node2D

onready var player = $Player
onready var player2 = $Player2
onready var camera = $MainCamera
onready var vehicle = $"NJC-104"

func _ready():
	MusicManager.select_music(2)
	MusicManager.play_music()
	PlayerManager.set_camera(camera)
	PlayerManager.add_player(player)
	PlayerManager.add_player(player2)
	PlayerManager.select_player(1)
	
	PlayerManager.add_vehicle(vehicle)
	
	# camera.set_look(player)
	# player.set_camera(camera)