extends StaticBody2D

var currentTarget = null
var availableTargets = []
#var damage = 10
#var fireRate




# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_fire_rate_timeout():
	#Check if the tower can shoot any units
	if len(availableTargets) == 0:
		#Nothing to shoot
		print("Nothing to shoot")
	else:
		if currentTarget == null:
			currentTarget = availableTargets[0] #Attack the first thing found
			
		#Shoot a bullet at the current target
		print("shoot")
			


func _on_detection_radius_body_entered(body):
	#Detect if the body is a targetable enemy
	if body is Tank1:
		print("detected" + body.name)
		
		if currentTarget == null:
			currentTarget = body
			print("Current target is now: " + str(currentTarget))
			
		availableTargets.append(body)
		print("Available targets are: " + str(availableTargets))
	


func _on_detection_radius_body_exited(body):
	if body is Tank1:
		print("tank left detection area")
		#Remove the 
