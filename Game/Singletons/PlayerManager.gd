extends Node

# enable/disable player manager
var enable = true
# debug player manager
var debug = GameGlobals.debug
# 0 a 4 jugadores (número máximo)
var player_num_max = 0
# 0 o 4 jugadores (numero del player actual) 0 = ninguno
var current_player_num = 0
# puede moverse o disparar, etc
var can_action = false
var players = []
var camera = null setget set_camera, get_camera
var vehicles = []

const MAX_PLAYERS = 4

func _ready():
	if enable : set_process_input(true)

func _input(event):
	if event.is_action_pressed("change_player") and enable:
		next_player(current_player_num, player_num_max)

func next_player(p_current_player_num, p_player_num_max):
	if p_player_num_max > 1 and current_player_num > 0:
		if p_current_player_num + 1 <= p_player_num_max:
			current_player_num += 1
			select_player(current_player_num)
		else: 
			current_player_num = 1
			select_player(current_player_num)
	if debug : print("current_player_num = ", self.current_player_num)

# Players

func add_player(player):
	if not player is KinematicBody2D:
		if debug : print("player nos es un KinematicBody2D: ", player)
		return
	
	if players.size() <= MAX_PLAYERS:
		players.append(player)
		player_num_max += 1
	else:
		if debug : print("players array is full: ", players)

func select_player(num):
	deselect_all_players()
	
	if num > 0 and num <= MAX_PLAYERS and camera != null:
		current_player_num = num
		camera.move_to_with_effect(players[current_player_num - 1])
		players[current_player_num - 1].is_selected = true

func deselect_all_players():
	if players.size() > 0:
		print(get_tree().get_nodes_in_group("Player"))
		for player in get_tree().get_nodes_in_group("Player"):
			player.is_selected = false
			print("player.is_selected: ", player.is_selected)

# Vehicles
func add_vehicle(vehicle):
	if not vehicle is KinematicBody2D:
		if debug : print("player nos es un KinematicBody2D: ", vehicle)
		return
	
	vehicles.append(vehicle)

func enter_vehicle(vehicle, player):
	# buscar si el vehiculo fue añadido
	if vehicles.has(vehicle):
		if vehicle.add_player(player) and camera != null:
			vehicle.can_move = true
			player.disappear_player()
			camera.move_to_with_effect(vehicle)
			if debug : print("player añadido: ", player)
		else:
			if debug:
				print("vehículo no añadido o camera es null")
				print(vehicle)
				print(camera)
				
	else:
		if debug : print("el vehiculo no ha sido añadido: ", vehicle)
	
# Camera
func set_camera(cam):
	if cam is Camera2D:
		camera = cam
		if debug : print("Camera is set")
	else:
		if debug : print("set_camera(cam) no esta recibiendo un Camera2D : ", camera)
	
func get_camera():
	return camera