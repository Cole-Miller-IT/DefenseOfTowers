extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$UI/PauseLabel.visible = true
	get_tree().paused = true
	
#Connects the new instantiated enemy to the UI
func _on_path_connect_enemy(enemy):
	enemy.connect("dealtPlayerDamage", Callable($UI, "_on_tank_1_dealt_player_damage"))
	enemy.connect("died", Callable($UI, "_on_tank_1_died"))
