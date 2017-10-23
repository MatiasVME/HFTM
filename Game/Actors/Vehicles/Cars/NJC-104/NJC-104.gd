extends "../GenericCar.gd"
#extends KinematicBody2D

func _ready():
	Skin = $Image
	mass = 3
	max_speed = 700
	
#	set_process(true)
	
#func _process(delta):
#	if Input.is_action_pressed("up") or Input.is_action_pressed("down") or Input.is_action_pressed("left") or Input.is_action_pressed("right"):
#		if !$Sound.playing and can_move:
#			$Sound.playing = true