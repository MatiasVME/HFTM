extends Control

onready var write = $Write

enum Sound {
	WRITE
}

func play_sound(_Sound):
	match _Sound:
		Sound.WRITE: write.play()
