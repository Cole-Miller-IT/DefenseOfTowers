extends Label

var health = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	text = "Health: %s" % health

func update(value):
	health += value
	print(health)
	text = "Health: %s" % health
