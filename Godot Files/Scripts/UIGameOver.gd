extends CanvasLayer


func _ready():
	#pause the game and show the gameover menu
	self.visible = true
	get_tree().paused = true
	
	
func _on_button_restart_pressed():
	get_tree().paused = false
	$ButtonSound.play()
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file("res://Scenes/level_1.tscn") #change later to be a variable based on what level they are on


func _on_button_menu_pressed():
	get_tree().paused = false
	$ButtonSound.play()
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")


func _on_button_quit_pressed():
	get_tree().quit()
