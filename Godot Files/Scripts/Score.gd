extends Label

var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	text = "Score: %s" % score
	
func updateScore():
	#tank_1..connect($UserInterface/ScoreLabel._on_mob_squashed.bind())
