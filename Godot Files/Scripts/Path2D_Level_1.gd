extends Node2D

#@onready var pathRoute = preload("")
#@onready var pathRoute = $PathSpawner/Path2D

func _on_path_spawner_timeout():
	print("Spawn an new tank with a path")
	#var tempRoute = pathRoute.instantiate()
	#add_child(tempRoute)
