extends KinematicBody2D

onready var camera = $Camera
onready var img = $Image
onready var touch_area = $TouchArea

var pistol_bullet = preload("res://Game/Actors/Shots/PistolBullet.tscn")

const SPEED = 100
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
	# zoom temporal
	if Input.is_action_just_released("scroll_up"):
		camera.zoom.x -= 0.1 
		camera.zoom.y -= 0.1
	elif Input.is_action_just_released("scroll_down"):
		camera.zoom.x += 0.1
		camera.zoom.y += 0.1
	
	if Input.is_action_just_pressed("use") and is_in_area:
		if current_area is Area2D and current_area.get_groups().has("EnterCarPlayerArea"):
			var car = current_area.get_parent()
			car.can_move = true
			car.get_node("Camera").current = true
			self.queue_free()
	
	var mouse_global_pos = camera.get_global_mouse_position()
	img.look_at(mouse_global_pos)
	
	var mouse_local_pos = camera.get_local_mouse_position()
	
	if Input.is_action_pressed("right_click"):
		var i_pistol_bullet = pistol_bullet.instance()
		i_pistol_bullet.fire(self, mouse_local_pos, delta)


func _on_TouchArea_area_entered( area ):
	is_in_area = true
	current_area = area
	
func _on_TouchArea_area_exited( area ):
	is_in_area = false
