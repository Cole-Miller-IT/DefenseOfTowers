extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	await get_tree().create_timer(1).timeout
	$AnimationPlayer.play("fade")
	await get_tree().create_timer(2).timeout
	#$AnimationPlayer.play_backwards("fade")
	#await get_tree().create_timer(2).timeout
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")

