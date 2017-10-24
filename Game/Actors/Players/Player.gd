extends KinematicBody2D

onready var camera = null
onready var img = $Image
onready var touch_area = $TouchArea

var pistol_bullet = preload("res://Game/Actors/Shots/PistolBullet.tscn")

const SPEED = 80
const MOVEMENT = 2

var is_in_area = false
var current_area = null
# Si esta seleccionado se puede mover y etc
var is_selected = false

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
			PlayerManager.enter_vehicle(car, self)
	
func camera_related(delta):
	if camera == null:
		camera = PlayerManager.get_camera()
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

# esto se usa en caso de que se quiera ocultar el player por un momento
# por ejemplo en el caso de que entre a un vehiculo, etc.
func disappear_player():
	self.visible = false
	is_selected = false

func _on_TouchArea_area_entered( area ):
	is_in_area = true
	current_area = area
	
func _on_TouchArea_area_exited( area ):
	is_in_area = false
