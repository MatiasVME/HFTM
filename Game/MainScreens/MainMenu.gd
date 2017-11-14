extends Control

onready var version = $Version
onready var animation = $Animation

var cursor

func _ready():
	$"VBox/Modes/Label".text = tr("MENU_MODES")
	$"VBox/Options/Label".text = tr("MENU_OPTIONS")
	$"VBox/Credits/Label".text = tr("MENU_CREDITS")
	$"VBox/Exit/Label".text = tr("MENU_EXIT")
	
	$"Modes/ModesTitle".text = tr("MODES_TITLE")
	$"Modes/ModesSolo".text = tr("MODES_SUBTITLE_SOLO")
	$"Modes/ModesMultiplayer".text = tr("MODES_SUBTITLE_MULTIPLAYER")
	
	$"Modes/Campaign/Label".text = tr("MODES_CAMPAIGN")
	$"Modes/Aventure/Label".text = tr("MODES_AVENTURE")
	$"Modes/Defence/Label".text = tr("MODES_DEFENCE")
	$"Modes/VSMultiplayer/Label".text = tr("MODES_VERSUS")
	$"Modes/AventureMultiplayer/Label".text = tr("MODES_AVENTURE")
	$"Modes/DefenceMultiplayer/Label".text = tr("MODES_DEFENCE")
	$"Modes/Back/Label".text = tr("BACK")
	
	cursor = preload("res://Game/Cursor/crossair_black.png")
	
	Input.set_custom_mouse_cursor(cursor)
	version.text = "v" + GameGlobals.version

func _on_Exit_pressed():
	get_tree().quit()

func _on_Modes_pressed():
	animation.play("to_mode")

func _on_Back_pressed():
	animation.play_backwards("to_mode")

func _on_Campaign_pressed():
	get_tree().change_scene("res://Game/Tests/TestMapTilset.tscn")
