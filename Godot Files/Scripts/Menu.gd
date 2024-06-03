extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/ButtonStart.grab_focus()
	$MusicMenu.play()
	
	#Preload the game scene here on start up
	

func _on_button_start_pressed():
	$MusicMenu.stop()
	$ButtonSound.play()
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file("res://Scenes/level_menu.tscn")


func _on_button_options_pressed():
	$MusicMenu.stop()
	$ButtonSound.play()
	$SettingsMenu.visible = true
	

func _on_button_quit_pressed():
	#print("dsa")
	#await get_tree().create_timer(1).timeout
	get_tree().quit()
