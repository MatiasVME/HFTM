extends Node2D

onready var animation = $Animation
onready var name = $"DialogTop/Name"
onready var image = $"DialogBottom/Image"
onready var dialog_text = $"DialogBottom/Text"
onready var timer = $Timer

# Para test
onready var dialog = load("res://Game/GUI/HUD/Dialog.gd")

const TEST_MODE = false

var current_dialog = null setget set_current_dialog, get_current_dialog

var index_dialog = 0
var index_letter = 0
var current_text = ""
var text_progress = ""
var has_increased = false
var next_dialog = false
var is_finish = false

func _ready():
	if TEST_MODE:
		var i_dialog = dialog.new()
		i_dialog.add_section("Pedro picapiedras", "hablo muchas cosas blab balblakjsdlk asdjlkfj s kflj askfj ", null)
		i_dialog.add_section("Holaxs", "hafsgfdg dgdf  gf  balblakjsdlk asdjlkfj s kflj askfj ", null)
		i_dialog.add_section("xD", "sdfsdaf jsdlk asdjlkfj s kflj askfj ", null)
		i_dialog.add_section("Pedro sd", "hablogd g fdgb balblakjsdlk asdjlkfj s kflj askfj ", null)
		i_dialog.add_section("fdsa picapiedras", "hablo mgdf  gdgdgs blab balblakjsdlk asdjlkfj s kflj askfj ", null)
		i_dialog.add_section("Pedro fads", "hablo muchas cosas blab balblakjsdlk asdjlkfj s kflj askfj ", null)
		self.set_current_dialog(i_dialog.get_dialogue())
		start_dialog()
	
	set_process_input(true)
	
func _input(event):
	if event.is_action_pressed("ui_accept"):
		if is_finish:
			stop_dialog()
			
		next_dialog()

func start_dialog():
	if current_dialog == null or current_text == null:
		if GameGlobals.debug: print("El dialogo es null: ", current_dialog)
		return
		
	animation.play("show")
	has_increased = true
	timer.start()
	
func stop_dialog():
	animation.play_backwards("show")
	current_dialog = null
	
	index_dialog = 0
	index_letter = 0
	current_text = ""
	text_progress = ""
	has_increased = false
	next_dialog = false
	is_finish = false

# Es para ver si el index_dialog ha incrementado
func has_increased():
	if has_increased:
		has_increased = false
		return true
	else:
		return false

func next_dialog():
	if next_dialog:
		next_dialog = false
		return true
	else:
		return false

# Setters/Getters
#

func set_current_dialog(dialog):
	current_dialog = dialog
	
func get_current_dialog():
	return current_dialog

# Events
#

func _on_Timer_timeout():
	if next_dialog:
		text_progress = ""
		return
	
	if has_increased:
		current_text = current_dialog[index_dialog]["Text"]
		name.text = current_dialog[index_dialog]["Transmitter"]
		image.texture = current_dialog[index_dialog]["Img"]
	
	text_progress += current_text[index_letter]
	index_letter += 1
	
	if index_letter == current_text.length():
		index_letter = 0
		index_dialog += 1
		has_increased = true
		next_dialog = true
		
	if index_letter < current_text.length() and index_letter % 2 == 0:
		SoundManager.play_sound(SoundManager.Sound.WRITE)

	dialog_text.text = text_progress

	if current_dialog.size() == index_dialog and current_text.length() == text_progress.length():
		is_finish = true
		timer.stop()
