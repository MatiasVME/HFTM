extends Area2D

onready var camera = get_node("Camera")
onready var img = get_node("Image")

const SPEED = 200

func _ready():
	set_process(true)
	
func _process(delta):
	var motion = Vector2()
	
	if Input.is_action_pressed("up"):
		motion += Vector2(0, -1)
	if Input.is_action_pressed("down"):
		motion += Vector2(0, 1)
	if Input.is_action_pressed("left"):
		motion += Vector2(-1, 0)
	if Input.is_action_pressed("right"):
		motion += Vector2(1, 0)
	
	var pos = self.position
	pos += motion * delta * SPEED
	self.position = pos
	
	var mouse_global_pos = camera.get_global_mouse_position()
	img.look_at(mouse_global_pos)
	
	var mouse_local_pos = camera.get_local_mouse_position()
	
	if Input.is_action_pressed("right_click"):
		print("ok")
	#	var i_pistol_bullet = pistol_bullet.instance()
	#	i_pistol_bullet.pistol_bullet(self, mouse_local_pos, delta)
