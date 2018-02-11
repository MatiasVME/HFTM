extends KinematicBody2D

onready var anim = $Animation
onready var feets = $Feets
onready var body = $Body

var pistol_bullet = preload("res://Game/Actors/Shots/PistolBullet.tscn")

export var test_mode = true

enum State {IDLE, WALK, ATACK, AIM, AIM_ATACK}
var state = State.IDLE

var one_time = true

var player_is_here = false
var player = null

func _ready():
	set_process(true)

func _process(delta):
	
	if player_is_here:
		state = State.AIM_ATACK
	else:
		state = State.IDLE
	
	states(delta)
	
	# Test mode
	if test_mode:
		test_mode()
	
func states(delta):
	if state == State.IDLE and one_time:
		anim.play("Idle1")
		feets.frame = 0
		feets.playing = false
		body.frame = 0
		body.playing = false
		one_time = false
	elif state == State.WALK and one_time:
		feets.playing = true
		body.playing = true
		body.rotation_degrees = 0
		anim.stop()
		one_time = false
	elif state == State.AIM:
		body.look_at(player.global_position)
		body.rotation_degree += 90
	elif state == State.AIM_ATACK:
		body.look_at(player.global_position)
		body.rotation_degrees += 90
#		var i_canon_bullet = pistol_bullet.instance()
#		i_canon_bullet.enemy_fire(self, player, delta)

func test_mode():
	if Input.is_action_just_pressed("1"):
		state = State.IDLE
		one_time = true
	elif Input.is_action_just_pressed("2"):
		state = State.WALK
		one_time = true

func _on_DetectArea_body_entered( body ):
	
	if body is KinematicBody2D:
		if body.is_in_group("Player"):
			player = body
			player_is_here = true

func _on_DetectArea_body_exited( body ):
	if body is KinematicBody2D:
		if body.is_in_group("Player"):
			player_is_here = false