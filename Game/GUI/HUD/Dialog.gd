extends Node

var dialogue = []

func add_section(transmitter, text, img):
	var section = new_section()
	
	section["Transmitter"] = transmitter
	section["Text"] = text
	section["Img"] = img
	
	dialogue.append(section)
	
	
func new_section():
	var section = {
		Transmitter = null,
		Text = null,
		Img = null
	}
	
	return section