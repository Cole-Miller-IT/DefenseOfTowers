extends Label

var gold = 200

# Called when the node enters the scene tree for the first time.
func _ready():
	text = "gold: %s" % gold

func update(value):
	gold += value
	#print(gold)
	text = "gold: %s" % gold
