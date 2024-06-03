extends Bullet

func _ready():
	speed = 500
	damage = 75
	
func _on_area_2d_body_entered(body):
	if body == target:
		#turn on the explosion radius
		$ExplosionRadius/CollisionShape2D.set_deferred("disabled", false)
		
		#Destroy the bullet
		self.visible = false
		#queue_free()


func _on_explosion_radius_body_entered(body):
	#for every enemy in the explosion radius
	if body is Tank1:
		#Deal damage
		#print("explosion on body " + body.name)
		body.health -= damage
