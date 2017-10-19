extends KinematicBody2D

var direction = Vector2()
var speed = 0
var acceleration = 1800
var decceleration = 1000

var world
var result_up 
var result_down
var result_left
var result_right

func _ready():
	set_physics_process(true)
	world = get_world_2d().get_direct_space_state()

func _physics_process(delta):
	result_up = world.intersect_point(get_position() + Vector2(0, -64))
	result_down = world.intersect_point(get_position() + Vector2(0, 64))
	result_left = world.intersect_point(get_position() + Vector2(-64, 0))
	result_right = world.intersect_point(get_position() + Vector2(64, 0))
