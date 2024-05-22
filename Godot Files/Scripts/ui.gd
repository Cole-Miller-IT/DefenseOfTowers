extends CanvasLayer

#Update health
func _on_tank_1_dealt_player_damage(value):
	#print(value)
	$BoxContainer/Health.update(value)
	
#Update score and gold
func _on_tank_1_died(value):
	#print(value)
	$BoxContainer/Score.update(value)
	$BoxContainer/Gold.update(value)


func _on_button_resume_pressed():
	get_tree().paused = false
	$PauseLabel.visible = false


func _on_button_pause_pressed():
	$PauseLabel.visible = true
	get_tree().paused = true
