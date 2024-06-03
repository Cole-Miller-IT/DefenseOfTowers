extends BulletTower


# Called when the node enters the scene tree for the first time.
func _ready():
	bullet = preload("res://Scenes/bullet_bomb.tscn")
	damage = 200
	cost = 100
