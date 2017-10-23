extends Node2D

onready var player = $Player
onready var camera = $MainCamera

func _ready():
	PlayerManager.set_camera(camera)
	PlayerManager.add_player(player)
	PlayerManager.select_player(1)
	
	# camera.set_look(player)
	# player.set_camera(camera)