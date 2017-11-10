extends Node2D

onready var animation = $Animation

var player_is_here = false

func _ready():
	animation.set_current_animation("show")
	set_process(true)
	
func _process(delta):
	if not animation.is_playing():
		if player_is_here and animation.get_current_animation() == "show":
			animation.play("hide")
		elif not player_is_here and animation.get_current_animation() == "hide":
			animation.play("show")

func _on_DetectArea_body_entered( body ):
	if body.get_groups().has("Player") or body.get_groups().has("Vehicle"):
		player_is_here = true

func _on_DetectArea_body_exited( body ):
	player_is_here = false
