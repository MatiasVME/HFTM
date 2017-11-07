extends Control

onready var write = $Write

enum Sound {
	WRITE
}

func play_sound(_Sound):
	if not GameGlobals.sound_enable:
		return
		
	match _Sound:
		Sound.WRITE: write.play()
