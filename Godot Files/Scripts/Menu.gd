extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass 
	#Preload the game scene here on start up


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass




func _on_button_start_pressed():
	$ButtonSound.play()


func _on_button_options_pressed():
	$ButtonSound.play()


func _on_button_quit_pressed():
	get_tree().quit()
