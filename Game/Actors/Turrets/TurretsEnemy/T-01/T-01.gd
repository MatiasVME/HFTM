extends KinematicBody2D
onready var body = $Body

var pistol_bullet = preload("res://Game/Actors/Shots/PistolBullet.tscn")

export var test_mode = true

enum State {IDLE, AIM, AIM_ATACK}
var state = State.IDLE

var one_time = true

var player_is_here = false
var player = null

func _ready():
	set_process(true)

func _process(delta):
	if player_is_here:
		state = State.AIM_ATACK
	states(delta)
	
	# Test mode
	if test_mode:
		test_mode()
	
func states(delta):
	if state == State.AIM:
		body.look_at(player.global_position)
		body.frame = 0
		body.rotation_degrees += 90
	elif state == State.AIM_ATACK:
		body.look_at(player.global_position)
		body.frame = 1
		body.rotation_degrees += 90
		var i_canon_bullet = pistol_bullet.instance()
		i_canon_bullet.enemy_fire(self, player, delta)
	elif state == State.IDLE:
		body.frame = 0
		player_is_here = false

func test_mode():
	if Input.is_action_just_pressed("1"):
		state = State.IDLE
		one_time = true

func _on_PacificArea_body_entered( body ):
	if body.is_in_group("Player"):
		player = body
		state = State.AIM

func _on_RedArea_body_entered( body ):
	if body.is_in_group("Player"):
		player = body
		player_is_here = true

func _on_PacificArea_body_exited(body):
	if body.is_in_group("Player"):
		player_is_here =false
		state = State.IDLE