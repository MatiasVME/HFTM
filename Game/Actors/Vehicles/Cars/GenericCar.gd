extends KinematicBody2D

export (float) var mass = 3
export (float) var max_speed = 600
export (bool) var can_move = false

# Asientos que tiene el auto para contener players
var seating_max = 0
var seating_taken = 0
var players = []

var motion = Vector2()
var target_motion = Vector2()
var steering = Vector2()

var direction = Vector2()
var speed = 0
var acceleration = 1800
var decceleration = 1000

var Skin = null
var target_angle = 0

func _ready():
	set_physics_process(true)

func _physics_process(delta):
	if can_move:
		input_car()
		move_car(delta)

func input_car():
	direction = Vector2()

	if Input.is_action_pressed("up"):
		direction.y = -1
	elif Input.is_action_pressed("down"):
		direction.y = 1

	if Input.is_action_pressed("left"):
		direction.x = -1
	elif Input.is_action_pressed("right"):
		direction.x = 1
	
func move_car(delta):
	if direction != Vector2():
		speed += acceleration * delta
	else:
		speed -= decceleration * delta

	speed = clamp(speed, 0, max_speed)
	
	target_motion = speed * direction.normalized() * delta
	steering = target_motion - motion

	if steering.length() > 1:
		steering = steering.normalized()
	
	motion += steering / mass

	if speed == 0:
		motion = Vector2()

	move_and_collide(motion)

	if motion != Vector2():
		target_angle = atan2(motion.x, motion.y) - PI / 2
		Skin.rotation = -target_angle

func add_player(player):
	if not player is KinematicBody2D:
		if GameGlobals.debug : print("player no es un KinematicBody2D: ", player)
		return false
		
	if seating_max > 0 and seating_taken < seating_max:
		seating_taken += 1
		var new_player = player.duplicate()
		player.queue_free()
		players.append(new_player)
		return true
	else:
		return false
		
func remove_player(player):
	if not player is KinematicBody2D:
		if GameGlobals.debug : print("player no es un KinematicBody2D: ", player)
		return false
	
	if seating_taken > 0 and players.has(player):
		seating_taken -= 1
		players.remove(player)
		return true
	else:
		return false