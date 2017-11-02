extends Node

onready var melancholic = $Melancholic
onready var siste_viator = $SisteViator
onready var animation = $"Animation"

enum Music {M_MELANCHOLIC = 1, M_SISTE_VIATOR}
var current_music = null

func select_music(p_music):
	if current_music != null:
		current_music.stop()
	
	match p_music:
		Music.M_MELANCHOLIC :
			current_music = melancholic
			animation.play("first_start")
		Music.M_SISTE_VIATOR : 
			current_music = siste_viator
		
func play_music():
	if current_music != null:
		current_music.play()
		
func stop_music():
	if current_music != null:
		current_music.stop()