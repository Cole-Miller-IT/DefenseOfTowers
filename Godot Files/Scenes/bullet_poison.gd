extends Bullet

var hitEnemy = false

func _physics_process(delta):
	if hitEnemy == false:
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
		#turn the bullet into a stationary object that now deals damage in an AOE around it every second
		hitEnemy = true
		print("hit poison")
		
		#start timer until it despawns, timer for when it should deal damage, and make the poison radius visible
		$timerDespawn.start()
		$TimerDamage.start()
		
		$Poison/PoisonRadius.disabled = false
		
		$TowerDefenseTile130.visible = true
		


func _on_timer_despawn_timeout():
	queue_free()


func _on_timer_damage_timeout():
	$Poison/PoisonRadius.disabled = false
	

func _on_poison_body_entered(body):
	if body is Tank1:
		#Deal damage
		#print("explosion on body " + body.name)
		body.health -= damage
	
	$Poison/PoisonRadius.disabled = true
