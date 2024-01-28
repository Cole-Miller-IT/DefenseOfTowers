extends StaticBody2D

var bullet = preload("res://Scenes/bullet.tscn")
var currentTarget = null
var availableTargets = []
var damage = 50
#var fireRate = 2.0 	#How long until the turret shoots again, in seconds




# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (currentTarget != null):
		#print(currentTarget)
		#print(currentTarget.position)
		#global_position.direction_to(currentTarget)
		look_at(currentTarget.global_position)


func _on_timer_fire_rate_timeout():
	#Check if the tower can shoot any units
	if (currentTarget != null):
		#print("shooting at target")
		#print(currentTarget)
		
		#Create a bullet and fire it at the targeted enemy
		var tempBullet = bullet.instantiate()
		tempBullet.damage = damage
		tempBullet.target = currentTarget
		tempBullet.global_position = $BulletFirePosition.global_position

		get_node("BulletContainer").add_child(tempBullet)

func _on_detection_radius_body_entered(body):
	#Detect if the body is a targetable enemy
	if body is Tank1:
		#print("detected" + body.name)
		
		if currentTarget == null:
			currentTarget = body
			#print("Current target is now: " + str(currentTarget))
			
		availableTargets.append(body)
		#print("Available targets are: " + str(availableTargets))
	

func _on_detection_radius_body_exited(body):
	if body is Tank1:
		#If the currently targeted enemy left the radius, choose a new target if there is an available target
		if (body == currentTarget):
			#print("The current target has left the area")
			
			if (!availableTargets):
				pass
				#print("switching to new target")
			else:
				#print("no targets in range to switch to")
				currentTarget = null
