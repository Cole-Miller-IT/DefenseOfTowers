extends CharacterBody2D

class_name Tank1

var speed = 100.0
var health = 100

signal dealtPlayerDamage(value1)
signal died(value2)


func _process(delta):
	#Gets the current progress from the path2DFollows node that is specific for this instance and increase it
	get_parent().set_progress(get_parent().get_progress() + (speed * delta))
	
	#Remove the entity once it reaches the end
	if get_parent().get_progress_ratio() == 1:
		emit_signal("dealtPlayerDamage", -1)
		queue_free()

	#When the player kills the enemy
	if (health <= 0):
		emit_signal("died", 10)
		queue_free()
