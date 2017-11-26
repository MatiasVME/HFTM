extends Camera2D

onready var tween = $Tween

# look is a player, vehicle or other
var look = null
var can_move = true
var tween_is_completed = false

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

	if look != null and tween_is_completed:
		self.position = look.position

func move_to(body):
	if body != null:
		self.position = body.position
		look = body

func move_to_with_effect(body):
	tween_is_completed = false
	
	if body != null:
		tween.interpolate_property(self, "position", 
				self.position, body.position, 0.5, 
				Tween.TRANS_CUBIC, Tween.EASE_OUT)
		tween.start()
		look = body

func _on_Tween_tween_completed( object, key ):
	tween_is_completed = true
