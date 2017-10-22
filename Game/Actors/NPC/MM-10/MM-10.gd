extends KinematicBody2D

onready var anim = $Animation
onready var feets = $Feets
onready var body = $Body

export var test_mode = true

enum State {IDLE, WALK, ATACK, AIM}
var state = State.IDLE

var one_time = true

func _ready():
	set_process(true)

func _process(delta):
	states()
	
	# Test mode
	if test_mode:
		test_mode()
	
func states():
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
		body.rotation_deg = 0
		anim.stop()
		one_time = false

func test_mode():
	if Input.is_action_just_pressed("1"):
		state = State.IDLE
		one_time = true
	elif Input.is_action_just_pressed("2"):
		state = State.WALK
		one_time = true