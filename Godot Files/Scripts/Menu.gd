extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/ButtonStart.grab_focus()
	$MusicMenu.play()
	#Preload the game scene here on start up
	

func _on_button_start_pressed():
	$MusicMenu.stop()
	$ButtonSound.play()
	
	get_tree().change_scene_to_file("res://Scenes/level_1.tscn")


func _on_button_options_pressed():
	$ButtonSound.play()


func _on_button_quit_pressed():
	get_tree().quit()
