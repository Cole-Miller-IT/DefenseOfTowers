extends Control

# Preload the shader material
var erosion_shader_material = preload("res://Shaders/erosion.tres")
var erosion_duration = 2.0 # Duration of the erosion effect in seconds
var elapsed_time = 0.0
var is_eroding = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/ButtonStart.grab_focus()
	$MusicMenu.play()
	
	
func _process(delta):
	if is_eroding:
		# Update the elapsed time
		elapsed_time += delta
		if elapsed_time >= erosion_duration:
			elapsed_time = erosion_duration
			is_eroding = false
			
		# Calculate the erosion_time value
		var erosion_time = elapsed_time / erosion_duration
		
		# Set the erosion_time uniform in the shader
		$PlaceholderMainMenuImage.material.set_shader_parameter("erosion_time", erosion_time - 0.60)
		
		# If the effect is done
		if not is_eroding:
			get_tree().change_scene_to_file("res://Scenes/level_menu.tscn")
			
func _on_button_start_pressed():
	$MusicMenu.stop()
	$ButtonSound.play()
	
	# Start the erosion effect
	elapsed_time = 0.0
	is_eroding = true
	
	# Set the shader material to the sprite
	$PlaceholderMainMenuImage.material = erosion_shader_material
	
	#Will change scenes once the shader effect ends above


func _on_button_options_pressed():
	$MusicMenu.stop()
	$ButtonSound.play()
	$SettingsMenu.visible = true
	

func _on_button_quit_pressed():
	#print("dsa")
	#await get_tree().create_timer(1).timeout
	get_tree().quit()
