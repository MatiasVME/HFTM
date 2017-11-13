extends Node2D

onready var img_lvl1 = $LVL1
onready var img_lvl2 = $LVL2
onready var img_lvl3 = $LVL3
onready var img_rand = $Rand

onready var tween_lvl1 = $TweenLVL1
onready var tween_lvl2 = $TweenLVL2
onready var tween_lvl3 = $TweenLVL3
onready var tween_rand = $TweenRand

enum LVL {L1, L2, L3, RAND}
enum LVL1 {IMG1, IMG2, IMG3, IMG4, IMG5, IMG6}
enum LVL2 {IMG1, IMG2, IMG3, IMG4, IMG5, IMG6, IMG7, IMG8, IMG9, IMG10, IMG11}
enum LVL3 {IMG1, IMG2, IMG3, IMG4, IMG5, IMG6, IMG7, IMG8, IMG9}
enum Rand {IMG1, IMG2, IMG3, IMG4, IMG5, IMG6}

var texture_lvl1 
var texture_lvl2
var texture_lvl3
var texture_rand

var ot = false

func _ready():
	randomize()
	
	rand_img(LVL.L1)
	rand_img(LVL.L2)
	rand_img(LVL.L3)
	rand_img(LVL.RAND)
	
	set_process(true)
	
	if GameGlobals.debug:
		set_process_input(true)
	
func _process(delta):
	if tween_lvl1.get_runtime() == 0:
		animate(texture_lvl1, 0)
	if tween_lvl2.get_runtime() == 0:
		animate(texture_lvl2, 1)
	if tween_lvl3.get_runtime() == 0:
		animate(texture_lvl3, 2)
	if tween_rand.get_runtime() == 0:
		animate(texture_rand, 3)

func _input(event):
	if event.is_action_pressed("1"):
		rand_img(LVL.L1)
	if event.is_action_pressed("2"):
		rand_img(LVL.L2)
	if event.is_action_pressed("3"):
		rand_img(LVL.L3)
	if event.is_action_pressed("4"):
		rand_img(LVL.RAND)

func rand_img(_LVL):
	match _LVL:
		LVL.L1:
			load_texture_lvl1(randi() % 6)
		LVL.L2:
			load_texture_lvl2(randi() % 11)
		LVL.L3:
			load_texture_lvl3(randi() % 9)
		LVL.RAND:
			load_texture_rand(randi() % 6)

func load_texture_lvl1(_LVL1):
	match _LVL1:
		LVL1.IMG1:
			var tex = load("res://Game/Backgrounds/Circles/lvl1_1.png")
			process_img(tex)
		LVL1.IMG2:
			var tex = load("res://Game/Backgrounds/Circles/lvl1_2.png")
			process_img(tex)
		LVL1.IMG3:
			var tex = load("res://Game/Backgrounds/Circles/lvl1_3.png")
			process_img(tex)
		LVL1.IMG4:
			var tex = load("res://Game/Backgrounds/Circles/lvl1_4.png")
			process_img(tex)
		LVL1.IMG5:
			var tex = load("res://Game/Backgrounds/Circles/lvl1_5.png")
			process_img(tex)
		LVL1.IMG6:
			var tex = load("res://Game/Backgrounds/Circles/lvl1_6.png")
			process_img(tex)

func load_texture_lvl2(_LVL2):
	match _LVL2:
		LVL2.IMG1:
			var text = load("res://Game/Backgrounds/Circles/lvl2_1.png")
			process_img(text, LVL.L2)
		LVL2.IMG2:
			var text = load("res://Game/Backgrounds/Circles/lvl2_2.png")
			process_img(text, LVL.L2)
		LVL2.IMG3:
			var text = load("res://Game/Backgrounds/Circles/lvl2_3.png")
			process_img(text, LVL.L2)
		LVL2.IMG4:
			var text = load("res://Game/Backgrounds/Circles/lvl2_4.png")
			process_img(text, LVL.L2)
		LVL2.IMG5:
			var text = load("res://Game/Backgrounds/Circles/lvl2_5.png")
			process_img(text, LVL.L2)
		LVL2.IMG6:
			var text = load("res://Game/Backgrounds/Circles/lvl2_6.png")
			process_img(text, LVL.L2)
		LVL2.IMG7:
			var text = load("res://Game/Backgrounds/Circles/lvl2_7.png")
			process_img(text, LVL.L2)
		LVL2.IMG8:
			var text = load("res://Game/Backgrounds/Circles/lvl2_8.png")
			process_img(text, LVL.L2)
		LVL2.IMG9:
			var text = load("res://Game/Backgrounds/Circles/lvl2_9.png")
			process_img(text, LVL.L2)
		LVL2.IMG10:
			var text = load("res://Game/Backgrounds/Circles/lvl2_10.png")
			process_img(text, LVL.L2)
		LVL2.IMG11:
			var text = load("res://Game/Backgrounds/Circles/lvl2_11.png")
			process_img(text, LVL.L2)

func load_texture_lvl3(_LVL3):
	match _LVL3:
		LVL3.IMG1:
			var tex = load("res://Game/Backgrounds/Circles/lvl3_1.png")
			process_img(tex, LVL.L3)
		LVL3.IMG2:
			var tex = load("res://Game/Backgrounds/Circles/lvl3_2.png")
			process_img(tex, LVL.L3)
		LVL3.IMG3:
			var tex = load("res://Game/Backgrounds/Circles/lvl3_3.png")
			process_img(tex, LVL.L3)
		LVL3.IMG4:
			var tex = load("res://Game/Backgrounds/Circles/lvl3_4.png")
			process_img(tex, LVL.L3)
		LVL3.IMG5:
			var tex = load("res://Game/Backgrounds/Circles/lvl3_5.png")
			process_img(tex, LVL.L3)
		LVL3.IMG6:
			var tex = load("res://Game/Backgrounds/Circles/lvl3_6.png")
			process_img(tex, LVL.L3)
		LVL3.IMG7:
			var tex = load("res://Game/Backgrounds/Circles/lvl3_7.png")
			process_img(tex, LVL.L3)
		LVL3.IMG8:
			var tex = load("res://Game/Backgrounds/Circles/lvl3_8.png")
			process_img(tex, LVL.L3)
		LVL3.IMG9:
			var tex = load("res://Game/Backgrounds/Circles/lvl3_9.png")
			process_img(tex, LVL.L3)

func load_texture_rand(_Rand):
	match _Rand:
		Rand.IMG1:
			var tex = load("res://Game/Backgrounds/Circles/rand1.png")
			process_img(tex, LVL.RAND)
		Rand.IMG2:
			var tex = load("res://Game/Backgrounds/Circles/rand2.png")
			process_img(tex, LVL.RAND)
		Rand.IMG3:
			var tex = load("res://Game/Backgrounds/Circles/rand3.png")
			process_img(tex, LVL.RAND)
		Rand.IMG4:
			var tex = load("res://Game/Backgrounds/Circles/rand4.png")
			process_img(tex, LVL.RAND)
		Rand.IMG5:
			var tex = load("res://Game/Backgrounds/Circles/rand5.png")
			process_img(tex, LVL.RAND)
		Rand.IMG6:
			var tex = load("res://Game/Backgrounds/Circles/rand6.png")
			process_img(tex, LVL.RAND)
	
func process_img(texture, _LVL = 0):
	match _LVL:
		LVL.L1:
			position_img(texture, img_lvl1)
			animate(img_lvl1, 0)
			texture_lvl1 = img_lvl1
		LVL.L2:
			position_img(texture, img_lvl2)
			animate(img_lvl2, 1)
			texture_lvl2 = img_lvl2
		LVL.L3:
			position_img(texture, img_lvl3)
			animate(img_lvl3, 2)
			texture_lvl3 = img_lvl3
		LVL.RAND:
			position_img(texture, img_rand)
			animate(img_rand, 3)
			texture_rand = img_rand

func position_img(_texture, _img):
	_img.texture = _texture
	_img.modulate = Color(1, 1, 1, 0)
	_img.position = Vector2(GameGlobals.RES_X / 2,
			GameGlobals.RES_Y / 2)
	
func animate(img, num_tween):
	var trans_rand = randi() % 11
	var ease_rand = randi() % 4
	var rot_finish_rand = randi() % 1080 + 360
	var time_rand = randi() % 20 + 10
	var modulate_rand = Color(randf(), randf(), randf(), randf())
	
	match num_tween:
		0 :
			tween_lvl1.interpolate_property(img, "rotation_degrees", 
					img.rotation_degrees, rot_finish_rand, time_rand, trans_rand, ease_rand)
			tween_lvl1.interpolate_property(img, "modulate",
					img.modulate, modulate_rand, time_rand, trans_rand, ease_rand)
			tween_lvl1.start()
		1 :
			tween_lvl2.interpolate_property(img, "rotation_degrees",
					img.rotation_degrees, rot_finish_rand, time_rand, trans_rand, ease_rand)
			tween_lvl2.interpolate_property(img, "modulate",
					img.modulate, modulate_rand, time_rand, trans_rand, ease_rand)
			tween_lvl2.start()
		2 :
			tween_lvl3.interpolate_property(img, "rotation_degrees",
					img.rotation_degrees, rot_finish_rand, time_rand, trans_rand, ease_rand)
			tween_lvl3.interpolate_property(img, "modulate",
					img.modulate, modulate_rand, time_rand, trans_rand, ease_rand)
			tween_lvl3.start()
		3 :
			tween_rand.interpolate_property(img, "rotation_degrees",
					img.rotation_degrees, rot_finish_rand, time_rand, trans_rand, ease_rand)
			tween_rand.interpolate_property(img, "modulate",
					img.modulate, modulate_rand, time_rand, trans_rand, ease_rand)
			tween_rand.start()
