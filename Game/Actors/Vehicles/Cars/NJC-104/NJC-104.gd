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


func _input(event):
	if event.is_action_pressed("use") and is_selected:
		exit_left_door()

func exit_left_door():
	var player = exit_vehicle()
	
	if player != null:
		player.global_position = left_door.global_position
		get_owner().add_child(player)