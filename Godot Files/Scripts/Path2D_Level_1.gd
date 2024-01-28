extends Node2D

@onready var pathRoute = preload("res://Scenes/level_1_path.tscn")
@onready var enemy = preload("res://Scenes/tank_1.tscn")


func _on_path_spawner_timeout():
	print("Spawn a new tank with a path")
	
	#Create a path for the enemy to follow
	var newRoute = pathRoute.instantiate()
	var newEnemy = enemy.instantiate()
	
	#Add the enemy to the follow path
	newRoute.get_node("PathFollow2D").add_child(newEnemy)
	
	#Add the path to the level scene under the "Path" node
	add_child(newRoute)
