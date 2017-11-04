extends KinematicBody2D

onready var camera = null
onready var img = $Image
onready var touch_area = $TouchArea

var pistol_bullet = preload("res://Game/Actors/Shots/PistolBullet.tscn")

const SPEED = 80
const MOVEMENT = 2

export (String) var player_name = "none" setget set_player_name, get_player_name

var is_in_area = false
var current_area = null
# Si esta seleccionado se puede mover y etc
var is_selected = false

var player_inventory = load("res://Game/Actors/Players/PlayerInventory.gd")
var inventory = load("res://Game/GUI/HUD/Inventory/Inventory.gd")
var item = load("res://Game/Actors/Items/ItemFigure.tscn")

func _ready():
	var i_player_inventory = player_inventory.new()
	var i_inventory = inventory.new()
	i_inventory.set_owner(self.get_player_name())
	i_player_inventory.set_inventory(i_inventory)
	
	InventoryManager.add_inventory(i_inventory)
	InventoryManager.select_inventory(0) # después hay que hacer que sea mas dinámico
	
	var i_item = item.instance()
	i_player_inventory.add_item(i_item, 0, 0)

func _physics_process(delta):
	if is_selected:
		movement_input(delta)
		use_input()
		camera_related(delta)
	
func movement_input(delta):
	var motion = MOVEMENT * SPEED * delta

	if Input.is_action_pressed("up"):
		move_and_collide(Vector2(0,-motion))
	if Input.is_action_pressed("down"):
		move_and_collide(Vector2(0,motion))
	if Input.is_action_pressed("left"):
		move_and_collide(Vector2(-motion, 0))
	if Input.is_action_pressed("right"):
		move_and_collide(Vector2(motion, 0))

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
		var mouse_global_pos = camera.get_global_mouse_position()
		img.look_at(mouse_global_pos)

func fire(delta):
	if camera != null:
		var mouse_local_pos = camera.get_local_mouse_position()
		
		if Input.is_action_pressed("right_click"):
			var i_pistol_bullet = pistol_bullet.instance()
			i_pistol_bullet.fire(self, mouse_local_pos, delta)

func set_player_name(name):
	player_name = name

func get_player_name():
	return player_name

func _on_TouchArea_area_entered( area ):
	is_in_area = true
	current_area = area
	
func _on_TouchArea_area_exited( area ):
	is_in_area = false
