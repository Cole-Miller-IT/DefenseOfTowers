extends Control


func _on_button_1_pressed():
	print("go to level 1")
	$ButtonSound.play()
	get_tree().change_scene_to_file("res://Scenes/level_1.tscn") #change later to be a variable based on what level they are on


func _on_button_2_pressed():
	print("go to level 2")
	$ButtonSound.play()
	get_tree().change_scene_to_file("res://Scenes/level_2.tscn")


func _on_button_3_pressed():
	print("go to level 3")
	$ButtonSound.play()
	get_tree().change_scene_to_file("res://Scenes/level_3.tscn")


func _on_button_4_pressed():
	print("go to level 4")
	$ButtonSound.play()


func _on_button_5_pressed():
	print("go to level 5")
	$ButtonSound.play()
