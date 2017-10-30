extends Node2D

func _ready():
	get_node("MenuContainer/Modes/Label").text = tr("MENU_MODES")
	get_node("MenuContainer/Options/Label").text = tr("MENU_OPTIONS")
	get_node("MenuContainer/Credits/Label").text = tr("MENU_CREDITS")
	get_node("MenuContainer/Exit/Label").text = tr("MENU_EXIT")

func _on_Exit_pressed():
	get_tree().quit()

func _on_Modes_pressed():
	get_tree().change_scene("res://Game/Tests/TestMapTilset.tscn")
