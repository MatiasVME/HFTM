extends Node2D

onready var tween = $Tween
onready var tree_full_1 = $TreeFull1
onready var tree_full_2 = $TreeFull2

func _ready():
	pass

func _on_DetectArea_body_entered( body ):
	print("OKKKK!!")
	tween.interpolate_property(tree_full_1, "modulate",
			Color(1, 1, 1, 1), Color(1, 1, 1, 0.5), 1,
			Tween.TRANS_LINEAR, Tween.EASE_OUT)
	tween.start()
