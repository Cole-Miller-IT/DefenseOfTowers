extends CharacterBody2D

class_name Tank1

const SPEED = 100.0
var health = 100

func _process(delta):
	#Gets the current progress from the path2DFollows node that is specific for this instance and increase it
	get_parent().set_progress(get_parent().get_progress() + (SPEED * delta))
	
	#Remove the entity once it reaches the end
	if get_parent().get_progress_ratio() == 1:
		queue_free()

	if (health <= 0):
		queue_free()
