extends CanvasLayer

var tutorialMsg = 1  #1 represents the first msg, 2 the second, etc..
	
func _ready():
	pass
	#$Tutorial/ButtonTutorial.visible = false
	#$Tutorial/TutorialMsg.visible = false
	
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


func _on_button_tutorial_pressed():
	if tutorialMsg == 1:
		$Tutorial/TutorialMsg.text = "Tanks will spawn and attempt to reach the end of the path, stop them by placing towers."
		tutorialMsg = 2
		
	elif tutorialMsg == 2:
		$Tutorial/TutorialMsg.text = "Unpause the game (using the \"Resume\" button) and you can begin placing towers."
		tutorialMsg = 3
		
	elif tutorialMsg == 3:
		$Tutorial/ButtonTutorial.visible = false
		$Tutorial/TutorialMsg.visible = false
		


func _on_button_tower_info_pressed():
	$TowerInfoOverlay.visible = true
