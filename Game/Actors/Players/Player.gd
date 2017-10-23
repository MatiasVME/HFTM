extends KinematicBody2D

onready var camera = null
onready var img = $Image
onready var touch_area = $TouchArea

var pistol_bullet = preload("res://Game/Actors/Shots/PistolBullet.tscn")

const SPEED = 80
const MOVEMENT = 2

var is_in_area = false
var current_area = null

func _ready():
	set_physics_process(true)

func _physics_process(delta):
	var motion = MOVEMENT * SPEED * delta

	if Input.is_action_pressed("up"):
		move_and_collide(Vector2(0,-motion))
	if Input.is_action_pressed("down"):
		move_and_collide(Vector2(0,motion))
	if Input.is_action_pressed("left"):
		move_and_collide(Vector2(-motion, 0))
	if Input.is_action_pressed("right"):
		move_and_collide(Vector2(motion, 0))
	
	if Input.is_action_just_pressed("use") and is_in_area:
		if current_area is Area2D and current_area.get_groups().has("EnterCarPlayerArea"):
			var car = current_area.get_parent()
			car.can_move = true
			car.get_node("Camera").current = true # need fix =0
			self.queue_free()
	
	look_at_mouse()
	fire(delta)

func look_at_mouse():
	var cam = PlayerManager.get_camera()
	
	if cam != null:
		var mouse_global_pos = cam.get_global_mouse_position()
		img.look_at(mouse_global_pos)

func fire(delta):
	var cam = PlayerManager.get_camera()
	
	if cam != null:
		var mouse_local_pos = cam.get_local_mouse_position()
		
		if Input.is_action_pressed("right_click"):
			var i_pistol_bullet = pistol_bullet.instance()
			i_pistol_bullet.fire(self, mouse_local_pos, delta)

func _on_TouchArea_area_entered( area ):
	is_in_area = true
	current_area = area
	
func _on_TouchArea_area_exited( area ):
	is_in_area = false
