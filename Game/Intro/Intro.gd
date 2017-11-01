
extends Node2D

onready var txt = $Text

var intro_text = [
	tr("INTRO_LINE1"),
	tr("INTRO_LINE2"),
	tr("INTRO_LINE3"),
	tr("INTRO_LINE4"),
	tr("INTRO_LINE5")
	]
var current_text = ""
var next_step = false

var i = 0 # incremento de caracteres
var j = 0 # incremento para frase
var last_step  = false # último paso para cambiar a la proxima escena

func _ready():
	set_process_input(true)
	MusicManager.stop_music()
	
func _input(event):
	if event.is_action_pressed("ui_accept"):
		next_step = true
	if event.is_action_pressed("ui_cancel"):
		MusicManager.select_music(MusicManager.Music.M_MELANCHOLIC)
		MusicManager.play_music()
		get_tree().change_scene("res://Game/MainScreens/MainMenu.tscn")

func _on_Timer_timeout():
	update_text()
	
	if i < intro_text[j].length():
		i += 1
	
	next_step()
	
	if last_step and next_step:
		get_tree().change_scene("res://Game/MainScreens/MainMenu.tscn")
	
func next_step():
	if next_step and j < intro_text.size() - 1:
		next_step = false
		j += 1
		i = 0
		current_text = ""
		
		if j == intro_text.size() - 1:
			MusicManager.select_music(MusicManager.Music.M_MELANCHOLIC)
			MusicManager.play_music()
			last_step = true
		
func update_text():
	if i < intro_text[j].length() and j < intro_text.size():
		current_text += intro_text[j][i]
		txt.set_text(current_text)