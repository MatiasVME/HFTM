extends Node2D

func _ready():
	pass

func _on_Exit_pressed():
	get_tree().quit()

func _on_Modes_pressed():
	get_tree().change_scene("res://Game/Tests/TestMapTilset.tscn")
