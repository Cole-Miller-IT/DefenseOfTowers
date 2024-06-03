extends BulletTower


# Called when the node enters the scene tree for the first time.
func _ready():
	bullet = preload("res://Scenes/bullet_freeze.tscn")
	damage = 10
	#cost = 50

