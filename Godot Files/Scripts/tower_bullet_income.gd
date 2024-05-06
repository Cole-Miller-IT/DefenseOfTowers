extends StaticBody2D

#Back up two levels to get to the level_# parent, then go back down through to the UI's gold node
@onready var goldPath = $"../../UI/BoxContainer/Gold"

var cost = 50
var incomeGained = 5

func _ready():
	pass

func _on_timer_income_timeout():
	#Update player's gold
	goldPath.update(incomeGained)
	
	#Restart the timer
	#Auto restart already enabled
