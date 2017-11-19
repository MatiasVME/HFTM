extends Node2D

onready var animation = $Animation

const TEST_MODE = true

var player_is_here = false
var dialog_active = false

var is_talking = false

func _ready():
	animation.set_current_animation("show")
	
	set_process(true)
	set_process_input(true)
	
func _process(delta):
	if not animation.is_playing():
		if player_is_here and animation.get_current_animation() == "show":
			animation.play("hide")			
		elif not player_is_here and animation.get_current_animation() == "hide":
			animation.play("show")
			
	if dialog_active and player_is_here and not is_talking:
		test_mode()

func test_mode():
	if TEST_MODE:
		var texture_robot = load("res://Game/GUI/HUD/Photos/NB-072-Mini.jpg")
#		var robot_img = Texture.new()
#		robot_img.texture = texture_robot
		
		var texture_tree = load("res://Game/GUI/HUD/Photos/Tree.png")
#		var tree_img = Texture.new()
#		tree_img.texture = texture_tree
		
		var dialog = load("res://Game/GUI/HUD/Dialog.gd")
		var i_dialog = dialog.new()
		
		i_dialog.add_section("Juansito", "¿Hola árbol cómo estás?", texture_robot)
		i_dialog.add_section("Árbol", "...", texture_tree)
		i_dialog.add_section("Juansito", "¿Por qué no hablas?", texture_robot)
		i_dialog.add_section("Árbol", "Porque los árboles no hablamos, bueno no normalmente...", texture_tree)
		i_dialog.add_section("Juansito", "Creo que estoy drogado...", texture_robot)
		i_dialog.add_section("Árbol", "Puede ser...", texture_tree)
	
		HUDManager.set_dialog(i_dialog.get_dialogue())
		HUDManager.start_dialog()
		is_talking = true
		dialog_active = false

func _input(event):
	if event.is_action_pressed("ui_accept") and not is_talking:
		dialog_active = true

func _on_DetectArea_body_entered( body ):
	if body.get_groups().has("Player") or body.get_groups().has("Vehicle"):
		player_is_here = true

func _on_DetectArea_body_exited( body ):
	player_is_here = false
	dialog_active = false
