extends "../GenericCar.gd"
#extends KinematicBody2D

var motion = Vector2()
var target_motion = Vector2()
var steering = Vector2()

const MASS = 2
const MAX_SPEED = 600

var Skin = null
var target_angle = 0

func _ready():
	Skin = $Image
	set_physics_process(true)

func _physics_process(delta):
	direction = Vector2()
	
	# por el momento

	if Input.is_action_pressed("up"):
		direction.y = -1
	elif Input.is_action_pressed("down"):
		direction.y = 1

	if Input.is_action_pressed("left"):
		direction.x = -1
	elif Input.is_action_pressed("right"):
		direction.x = 1
	
	if direction != Vector2():
		speed += acceleration * delta
	else:
		speed -= decceleration * delta

	speed = clamp(speed, 0, MAX_SPEED)
	
	target_motion = speed * direction.normalized() * delta
	steering = target_motion - motion

	if steering.length() > 1:
		steering = steering.normalized()
	
	motion += steering / MASS

	if speed == 0:
		motion = Vector2()

	move_and_collide(motion)

	if motion != Vector2():
		target_angle = atan2(motion.x, motion.y) - PI / 2
		Skin.rotation = -target_angle
