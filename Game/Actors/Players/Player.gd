extends Area2D

onready var camera = $Camera
onready var img = $Image

var pistol_bullet = preload("res://Game/Actors/Shots/PistolBullet.tscn")

const SPEED = 200

var world

func _ready():
	set_physics_process(true)
	
	world = get_world_2d().get_direct_space_state()
	
func _physics_process(delta):
	var motion = Vector2()
	
	var result_up = world.intersect_point(get_position() + Vector2(0, -16))
	var result_down = world.intersect_point(get_position() + Vector2(0, 16))
	var result_left = world.intersect_point(get_position() + Vector2(-16, 0))
	var result_right = world.intersect_point(get_position() + Vector2(16, 0))

	if Input.is_action_pressed("up") and result_up.empty():
		motion += Vector2(0, -1)
	if Input.is_action_pressed("down") and result_down.empty():
		motion += Vector2(0, 1)
	if Input.is_action_pressed("left") and result_left.empty():
		motion += Vector2(-1, 0)
	if Input.is_action_pressed("right") and result_right.empty():
		motion += Vector2(1, 0)
	# zoom temporal
	if Input.is_action_just_released("scroll_up"):
		camera.zoom.x -= 0.1 
		camera.zoom.y -= 0.1
	elif Input.is_action_just_released("scroll_down"):
		camera.zoom.x += 0.1
		camera.zoom.y += 0.1
	
	var pos = self.position
	pos += motion * delta * SPEED
	self.position = pos
	
	var mouse_global_pos = camera.get_global_mouse_position()
	img.look_at(mouse_global_pos)
	
	var mouse_local_pos = camera.get_local_mouse_position()
	
	if Input.is_action_pressed("right_click"):
		var i_pistol_bullet = pistol_bullet.instance()
		i_pistol_bullet.fire(self, mouse_local_pos, delta)
