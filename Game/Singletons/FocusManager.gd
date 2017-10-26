extends Node

# enable/disable player manager
var enable = true
# debug player manager
var debug = GameGlobals.debug
# 0 a 4 jugadores (número máximo)
var focus_num_max = 0
# 0 o 4 focos actuales 0 = ninguno
# los focos son normalmente players o vehículos controlables
var current_focus_num = 0
# puede moverse o disparar, etc
var can_action = false
var camera = null setget set_camera, get_camera
# Players o vehículos que pueden tener focus
var focus = []
var vehicles = []
var players = []

const MAX_FOCUS = 4

func _ready():
	if enable : set_process_input(true)

func _input(event):
	if event.is_action_pressed("change_player") and enable:
		next_focus()

func next_focus():
	if focus_num_max > 1 and current_focus_num > 0:
		if current_focus_num + 1 <= focus_num_max:
			current_focus_num += 1
			select_focus(current_focus_num)
		else: 
			current_focus_num = 1
			select_focus(current_focus_num)
	if debug : print("current_focus_num = ", self.current_focus_num)

func last_focus():
	print("focus: ", focus)
	select_focus(focus.size(), false)

# Players

func add_player(player, is_focusable = true):
	if not player is KinematicBody2D:
		if debug : print("player nos es un KinematicBody2D: ", player)
		return
	
	if focus.size() <= MAX_FOCUS and is_focusable:
		focus.append(player)
		focus_num_max += 1
		players.append(player)
	elif not is_focusable:
		players.append(player)
	else:
		if debug : print("focus array is full: ", focus)

func remove_player(player):
	if not player is KinematicBody2D:
		if debug : print("player nos es un KinematicBody2D: ", player)
		return
		
	players.remove(players.find(player))
	focus.remove(focus.find(player))
	focus_num_max -= 1

# Selecciona el foco
func select_focus(num, effect = true):
	deselect_all_players()
	deselect_all_vehicles()
	
	if num > 0 and num <= MAX_FOCUS and camera != null:
		current_focus_num = num
		if effect:
			camera.move_to_with_effect(focus[current_focus_num - 1])
		else:
			camera.move_to(focus[current_focus_num - 1])
		focus[current_focus_num - 1].is_selected = true

func deselect_all_players():
	if players.size() > 0:
		print(get_tree().get_nodes_in_group("Player"))
		for player in get_tree().get_nodes_in_group("Player"):
			player.is_selected = false
			print("player.is_selected: ", player.is_selected)

# Vehicles
func add_vehicle(vehicle, is_focusable = false):
	if not vehicle is KinematicBody2D:
		if debug : print("vehicle nos es un KinematicBody2D: ", vehicle)
		return
	
	if focus.size() <= MAX_FOCUS and is_focusable:
		focus.append(vehicle)
		focus_num_max += 1
		vehicles.append(vehicle)
	elif not is_focusable:
		vehicles.append(vehicle)
	else:
		if debug : print("focus array is full: ", focus)

func remove_vehicle(vehicle):
	if not vehicle is KinematicBody2D:
		if debug : print("vehicle nos es un KinematicBody2D: ", vehicle)
		return
		
	vehicles.remove(vehicles.find(vehicle))
	focus.remove(focus.find(vehicle))

func remove_vehicle_focus(vehicle):
	if not vehicle is KinematicBody2D:
		if debug : print("vehicle nos es un KinematicBody2D: ", vehicle)
		return
	
	focus.remove(focus.find(vehicle))

# esta función va acá ya que es la camara la que hace focus al
# vehículo.
func enter_vehicle(vehicle, player):
	# buscar si el vehiculo fue añadido
	if vehicles.has(vehicle):
		if vehicle.add_player(player) and camera != null:
			vehicle.is_selected = true
			focus.remove(focus.find(player))
			camera.move_to_with_effect(vehicle)
			focus.append(vehicle)
			
			if vehicle.players.size() > 1:
				focus_num_max -= 1
			
			if debug: 
				print("player añadido: ", player)
				print("focus: ", focus)
				print("vehicle.players.size(): ", vehicle.players.size())
		else:
			if debug:
				print("vehículo no añadido o camera es null")
				print(vehicle)
				print(camera)
	else:
		if debug : print("el vehiculo no ha sido añadido: ", vehicle)

# esta función va acá ya que es la camara la que hace focus al
# vehículo.
#func exit_vehicle(vehicle, player_name):
#	var player = _get_player(player_name)
#
#	# valida si los parámetros son los correctos
#	if vehicles.has(vehicle) and players.has(player):
#		# ver cuantos players tiene vehículo para removerlo de focus o no
#		vehicle.remove_player(player_name)
	
func deselect_all_vehicles():
	if vehicles.size() > 0:
		for vehicles in get_tree().get_nodes_in_group("Vehicle"):
			vehicles.is_selected = false
			if debug : print("player.is_selected: ", vehicles.is_selected)

#func _get_player(player_name):
#	for player in players:
#		if player.get_name() == player_name:
#			return player

# Camera
func set_camera(cam):
	if cam is Camera2D:
		camera = cam
		if debug : print("Camera is set")
	else:
		if debug : print("set_camera(cam) no esta recibiendo un Camera2D : ", camera)
	
func get_camera():
	return camera