extends Label


var curWave = 0
var maxWave = 9

# Called when the node enters the scene tree for the first time.
func _ready():
	text = "Wave: %s/%s " %[curWave, maxWave]

func update():
	curWave += 1
	#print(curWave)
	text = "Wave: %s/%s " %[curWave, maxWave]
