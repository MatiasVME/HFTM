extends Node2D

var cursor

func _ready():
	get_node("MenuContainer/Modes/Label").text = tr("MENU_MODES")
	get_node("MenuContainer/Options/Label").text = tr("MENU_OPTIONS")
	get_node("MenuContainer/Credits/Label").text = tr("MENU_CREDITS")
	get_node("MenuContainer/Exit/Label").text = tr("MENU_EXIT")
	
	cursor = preload("res://Game/Cursor/crossair_black.png")
	
	Input.set_custom_mouse_cursor(cursor)

func _on_Exit_pressed():
	get_tree().quit()

func _on_Modes_pressed():
	get_tree().change_scene("res://Game/Tests/TestMapTilset.tscn")
