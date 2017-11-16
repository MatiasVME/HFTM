extends Node2D

onready var animation = $Animation
onready var name = $"DialogTop/Name"
onready var image = $"DialogBottom/Image"
onready var text = $"DialogBottom/Text"

var current_dialog = null setget set_current_dialog, get_current_dialog

func _ready():
	pass

func start_dialog():
	if current_dialog == null:
		if GameGlobals.debug: print("El dialogo es null")
		return
		
	animation.play("show")

# Setters/Getters
#

func set_current_dialog(dialog):
	current_dialog = dialog
	
func get_current_dialog():
	return current_dialog