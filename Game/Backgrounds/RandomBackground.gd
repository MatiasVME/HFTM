extends Node2D

onready var img_lvl1 = $LVL1
onready var img_lvl2 = $LVL2
onready var img_lvl3 = $LVL3
onready var img_rand = $Rand

onready var tween = $Tween

enum LVL {L1, L2, L3, RAND}
enum LVL1 {IMG1, IMG2, IMG3, IMG4, IMG5, IMG6}
enum LVL2 {IMG1, IMG2, IMG3, IMG4, IMG5, IMG6, IMG7, IMG8, IMG9, IMG10, IMG11}
enum LVL3 {IMG1, IMG2, IMG3, IMG4, IMG5, IMG6, IMG7, IMG8, IMG9}
enum Rand {IMG1, IMG2, IMG3, IMG4, IMG5, IMG6}

func _ready():
	randomize()
	
	set_process(true)
	
	if GameGlobals.debug:
		set_process_input(true)
	
func _process(delta):
	pass
	
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
			load_texture_lvl1(randi() % 7)
		LVL.L2:
			load_texture_lvl2(randi() % 12)
		LVL.L3:
			load_texture_lvl3(randi() % 10)
		LVL.RAND:
			load_texture_rand(randi() % 7)

func load_texture_lvl1(_LVL1):
	match _LVL1:
		LVL1.IMG1:
			var img = load("res://Game/Backgrounds/Circles/lvl1_1.png")
			process_img(img)
		LVL1.IMG2:
			var img = load("res://Game/Backgrounds/Circles/lvl1_2.png")
			process_img(img)
		LVL1.IMG3:
			var img = load("res://Game/Backgrounds/Circles/lvl1_3.png")
			process_img(img)
		LVL1.IMG4:
			var img = load("res://Game/Backgrounds/Circles/lvl1_4.png")
			process_img(img)
		LVL1.IMG5:
			var img = load("res://Game/Backgrounds/Circles/lvl1_5.png")
			process_img(img)
		LVL1.IMG6:
			var img = load("res://Game/Backgrounds/Circles/lvl1_6.png")
			process_img(img)

func load_texture_lvl2(_LVL2):
	match _LVL2:
		LVL2.IMG1:
			var texture = load("res://Game/Backgrounds/Circles/lvl2_1.png")
			process_img(texture, LVL.L2)
		LVL2.IMG2:
			var texture = load("res://Game/Backgrounds/Circles/lvl2_2.png")
			process_img(texture, LVL.L2)
		LVL2.IMG3:
			var texture = load("res://Game/Backgrounds/Circles/lvl2_3.png")
			process_img(texture, LVL.L2)
		LVL2.IMG4:
			var texture = load("res://Game/Backgrounds/Circles/lvl2_4.png")
			process_img(texture, LVL.L2)
		LVL2.IMG5:
			var texture = load("res://Game/Backgrounds/Circles/lvl2_6.png")
			process_img(texture, LVL.L2)
		LVL2.IMG6:
			var texture = load("res://Game/Backgrounds/Circles/lvl2_7.png")
			process_img(texture, LVL.L2)
		LVL2.IMG7:
			var texture = load("res://Game/Backgrounds/Circles/lvl2_8.png")
			process_img(texture, LVL.L2)
		LVL2.IMG8:
			var texture = load("res://Game/Backgrounds/Circles/lvl2_9.png")
			process_img(texture, LVL.L2)
		LVL2.IMG9:
			var texture = load("res://Game/Backgrounds/Circles/lvl2_10.png")
			process_img(texture, LVL.L2)
		LVL2.IMG10:
			var texture = load("res://Game/Backgrounds/Circles/lvl2_11.png")
			process_img(texture, LVL.L2)

func load_texture_lvl3(_LVL3):
	match _LVL3:
		LVL3.IMG1:
			var texture = load("res://Game/Backgrounds/Circles/lvl3_1.png")
			process_img(texture, LVL.L3)
		LVL3.IMG2:
			var texture = load("res://Game/Backgrounds/Circles/lvl3_2.png")
			process_img(texture, LVL.L3)
		LVL3.IMG3:
			var texture = load("res://Game/Backgrounds/Circles/lvl3_3.png")
			process_img(texture, LVL.L3)
		LVL3.IMG4:
			var texture = load("res://Game/Backgrounds/Circles/lvl3_4.png")
			process_img(texture, LVL.L3)
		LVL3.IMG5:
			var texture = load("res://Game/Backgrounds/Circles/lvl3_5.png")
			process_img(texture, LVL.L3)
		LVL3.IMG6:
			var texture = load("res://Game/Backgrounds/Circles/lvl3_6.png")
			process_img(texture, LVL.L3)
		LVL3.IMG7:
			var texture = load("res://Game/Backgrounds/Circles/lvl3_7.png")
			process_img(texture, LVL.L3)
		LVL3.IMG8:
			var texture = load("res://Game/Backgrounds/Circles/lvl3_8.png")
			process_img(texture, LVL.L3)
		LVL3.IMG9:
			var texture = load("res://Game/Backgrounds/Circles/lvl3_9.png")
			process_img(texture, LVL.L3)

func load_texture_rand(_Rand):
	match _Rand:
		Rand.IMG1:
			var texture = load("res://Game/Backgrounds/Circles/rand1.png")
			process_img(texture, LVL.RAND)
		Rand.IMG2:
			var texture = load("res://Game/Backgrounds/Circles/rand2.png")
			process_img(texture, LVL.RAND)
		Rand.IMG3:
			var texture = load("res://Game/Backgrounds/Circles/rand3.png")
			process_img(texture, LVL.RAND)
		Rand.IMG4:
			var texture = load("res://Game/Backgrounds/Circles/rand4.png")
			process_img(texture, LVL.RAND)
		Rand.IMG5:
			var texture = load("res://Game/Backgrounds/Circles/rand5.png")
			process_img(texture, LVL.RAND)
		Rand.IMG6:
			var texture = load("res://Game/Backgrounds/Circles/rand6.png")
			process_img(texture, LVL.RAND)
	
func process_img(texture, _LVL = 0):
	match _LVL:
		LVL.L1:
			position_img(texture, img_lvl1)
			animate(img_lvl1)
		LVL.L2:
			position_img(texture, img_lvl2)
			animate(img_lvl2)
		LVL.L3:
			position_img(texture, img_lvl3)
			animate(img_lvl3)
		LVL.RAND:
			position_img(texture, img_rand)
			animate(img_rand)

func position_img(_texture, _img):
	_img.texture = _texture
	_img.position = Vector2(GameGlobals.RES_X / 2,
			GameGlobals.RES_Y / 2)
	
func animate(img):
	var trans_rand = randi() % 11
	var ease_rand = randi() % 4
	var rot_finish_rand = randi() % 1080 + 360
	var time_rand = randi() % 30 + 10
	
	tween.interpolate_property(img, "rotation_deg",
			0, rot_finish_rand, time_rand, trans_rand, ease_rand)
	tween.start()
