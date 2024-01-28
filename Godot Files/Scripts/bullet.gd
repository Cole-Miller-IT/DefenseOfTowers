extends CharacterBody2D

#Assigned by the turret
var damage
var target

var speed = 200

func _ready():
	pass

func _physics_process(delta):
	#remove bullets that now no longer have a target b/c a previous bullet killed the target
	if (target == null):
		print("target destroyed")
		queue_free()
		
	else:
		#Get the target's position
		velocity = global_position.direction_to(target.global_position) * speed
		
		#Move towards the target
		look_at(target.global_position)
		move_and_slide()


func _on_area_2d_body_entered(body):
	if body == target:
		#Deal damage
		body.health -= damage
		
		#Destroy the bullet
		queue_free()
		
