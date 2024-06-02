extends Node2D

@onready var pathRoute = preload("res://Scenes/level_1_path.tscn")
@onready var tank1 = preload("res://Scenes/tank_1.tscn")
@onready var tankSlow = preload("res://Scenes/tank_slow.tscn")
@onready var tankFast = preload("res://Scenes/tank_fast.tscn")
var modifier = 0
signal connectEnemy(enemy)
signal nextWave

var waveSpawnCount = [5, 10, 15, 20, 25, 30, 35, 40, 45, 50]
var waveNumber = 0
var maxWaves = 9
var enemiesSpawned = 0

func _on_path_spawner_timeout():
	#print("Spawn a new tank with a path")
	if enemiesSpawned < waveSpawnCount[waveNumber] and waveNumber <= maxWaves:
		#Create a path for the enemy to follow
		var newRoute = pathRoute.instantiate()
		
		var newEnemy
		if waveNumber == 3 or waveNumber == 7:
			newEnemy = tankFast.instantiate()
			
		elif waveNumber == 9:
			newEnemy = tankSlow.instantiate()
			
		else:
			newEnemy = tank1.instantiate()
			
		newEnemy.health += modifier
		
		#Add the enemy to the follow path
		newRoute.get_node("PathFollow2D").add_child(newEnemy)
		
		#Add the path to the level scene under the "Path" node
		add_child(newRoute)
		
		#Connect signals to UI (Signals are not copied when you instantiate an new object)
		connectEnemy.emit(newEnemy)
		
		enemiesSpawned += 1
		
	else:
		if waveNumber >= maxWaves:
			print("Max waves reached, show win screen here")
			
			#And turn off the timer
			var gameWonOverlay = load("res://Scenes/ui_game_win.tscn")
			var instance = gameWonOverlay.instantiate()
			add_child(instance)
		
		else:
			print("Next wave reached")
			waveNumber += 1
			enemiesSpawned = 0
			
			#Update the GUI
			nextWave.emit()
			
			#Make the next wave more difficult
			$PathSpawner.wait_time -= 0.25
			if waveNumber > 2:
				modifier += 35
	
