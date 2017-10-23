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
		else: 
			current_player_num = 1
	if debug : print("current_player_num = ", self.current_player_num)

# Players

func add_player(player):
	if not player is KinematicBody2D:
		if debug : print("player nos es un KinematicBody2D: ", player)
	
	if players.size() <= MAX_PLAYERS:
		players.append(player)
		player_num_max += 1
	else:
		if debug : print("players array is full: ", players)

func select_player(num):
	if num > 0 and num <= MAX_PLAYERS and camera != null:
		current_player_num = num
		camera.move_to(players[current_player_num - 1])

# Vehicles

# Camera
func set_camera(cam):
	if cam is Camera2D:
		camera = cam
		if debug : print("Camera is set")
	else:
		if debug : print("set_camera(cam) no esta recibiendo un Camera2D : ", camera)
	
func get_camera():
	return camera