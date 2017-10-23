extends Camera2D

# look is a player, vehicle or other
var look = null

func _ready():
	set_physics_process(true)
	
func _physics_process(delta):
	# zoom temporal
	if Input.is_action_just_released("scroll_up"):
		zoom.x -= 0.1 
		zoom.y -= 0.1
	elif Input.is_action_just_released("scroll_down"):
		zoom.x += 0.1
		zoom.y += 0.1
		
	self.position = look.position

func move_to(body):
	if body != null:
		self.position = body.position
		look = body