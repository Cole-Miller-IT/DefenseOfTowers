extends Bullet

class_name  BulletFreeze

#var freezeDuration = 2 	#In seconds

func _ready():
	speed = 400
	
func _on_area_2d_body_entered(body):
	if body == target:
		#Deal damage
		body.health -= damage
		
		body.speed = 50
		
		#Destroy the bullet
		queue_free()
