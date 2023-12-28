extends CharacterBody2D

const SPEED = 300.0

func _process(delta):
	#Gets the current progress from the path2DFollows node that is specific for this instance
	get_parent().set_progress(get_parent().get_progress() + (SPEED * delta))
	
	#Remove the entity once it reaches the end
	if get_parent().get_progress_ratio() == 1:
		queue_free()

