extends Node2D

func _ready():
	get_node("Modes/Label").text = tr("MENU_MODES")
	get_node("Options/Label").text = tr("MENU_OPTIONS")
	get_node("Credits/Label").text = tr("MENU_CREDITS")
	get_node("Exit/Label").text = tr("MENU_EXIT")

func _on_Exit_pressed():
	get_tree().quit()

func _on_Modes_pressed():
	get_tree().change_scene("res://Game/Tests/TestMapTilset.tscn")
