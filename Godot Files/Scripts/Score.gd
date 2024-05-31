extends Label

var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	text = "Score: %s" % score
	
func update(value):
	score += value
	#print(score)
	text = "Score: %s" % score

