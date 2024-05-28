extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	#self.visible = false
	pass


func _on_master_audio_slider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), value)


func _on_button_exit_pressed():
	$AudioStreamPlayer.stop()
	self.visible = false


func _on_button_test_sound_pressed():
	$AudioStreamPlayer.play()
