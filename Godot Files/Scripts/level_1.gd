extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	



func _on_path_connect_enemy(enemy):
	enemy.connect("dealtPlayerDamage", $UI, "_on_tank_1_dealt_player_damage")
	enemy.connect("died", $UI, "_on_tank_1_died")
