# Player.gd

extends KinematicBody2D

onready var camera = null
onready var img = $Image
onready var touch_area = $TouchArea

var pistol_bullet = preload("res://Game/Actors/Shots/PistolBullet.tscn")

const SPEED = 10
const MOVEMENT = 3

export (String) var player_name = null setget set_player_name, get_player_name

var is_in_area = false
var current_area = null
# Si esta seleccionado se puede mover y etc
var is_selected = false

var player_inventory = load("res://Game/Actors/Players/PlayerInventory.gd").new()
var inventory = load("res://Game/GUI/HUD/Inventory/Inventory.gd").new()
var item = load("res://Game/Actors/Items/ItemFigure.tscn")

var move
var player_lives = 20

func _physics_process(delta):
	if is_selected:
		move = movement_input(delta)
		use_input()
		camera_related(delta)
	
	# Detectando las colisiones.
	if move != null:
		if move["collider"].is_in_group("Bullets"):
			player_lives -= 1
			print(player_lives)
	
func movement_input(delta):
	var local_move = null # Controla las colisiones
	
	if Input.is_action_pressed("up"):
		local_move = move_and_collide(Vector2(0, -MOVEMENT))
	if Input.is_action_pressed("down"):
		local_move = move_and_collide(Vector2(0, MOVEMENT))
	if Input.is_action_pressed("left"):
		local_move = move_and_collide(Vector2(-MOVEMENT, 0))
	if Input.is_action_pressed("right"):
		local_move = move_and_collide(Vector2(MOVEMENT, 0))
	
	return local_move # Nos dice si se encuentra una colision mientras se mueve

func use_input():
	if Input.is_action_just_pressed("use") and is_in_area:
		if current_area is Area2D and current_area.get_groups().has("EnterCarPlayerArea"):
			var car = current_area.get_parent()
			FocusManager.enter_vehicle(car, self)
	
func camera_related(delta):
	if camera == null:
		camera = FocusManager.get_camera()
	else:
		look_at_mouse()
		fire(delta)

func look_at_mouse():
	if camera != null:
		img.look_at(camera.get_global_mouse_position())

func fire(delta):
	if camera != null:
		var mouse_global_pos = camera.get_global_mouse_position()
		
		if Input.is_action_pressed("right_click"):
			var i_pistol_bullet = pistol_bullet.instance()
			i_pistol_bullet.fire(self, mouse_global_pos, delta)

func create_inventory():
	if player_name != null:
		player_inventory.set_inventory(inventory)
		InventoryManager.add_inventory(inventory)
	else:
		if GameGlobals.debug: print("Para crear un inventario del player se tiene que saber el nombre del jugador primero: ", 
			player_name)

# Setters/Getters

func set_player_name(name):
	player_name = name
	inventory.set_i_owner(name)

func get_player_name():
	return player_name

# Eventos

func _on_TouchArea_area_entered( area ):
	is_in_area = true
	current_area = area
	
func _on_TouchArea_area_exited( area ):
	is_in_area = false
