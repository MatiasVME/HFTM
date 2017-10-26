extends "../GenericCar.gd"
#extends KinematicBody2D

onready var left_door = $LeftDoor
onready var right_door = $RightDoor

func _ready():
	Skin = $Image
	mass = 3
	max_speed = 700
	seating_max = 2
	
	set_process_input(true)
#	set_process(true)

func _input(event):
	if event.is_action_pressed("use") and is_selected:
		exit_left_door()

#func _process(delta):
#	if Input.is_action_pressed("up") or Input.is_action_pressed("down") or Input.is_action_pressed("left") or Input.is_action_pressed("right"):
#		if !$Sound.playing and can_move:
#			$Sound.playing = true

func exit_left_door():
	var player = exit_vehicle()
	
	if player != null:
		player.global_position = left_door.global_position
		get_owner().add_child(player)