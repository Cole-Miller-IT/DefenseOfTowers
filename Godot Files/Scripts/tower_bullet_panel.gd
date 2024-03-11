extends Panel

@onready var tower = preload("res://Scenes/tower_bullet.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_gui_input(event):
	var tempTower = tower.instantiate()
	
	print(event)
	if event is InputEventMouseButton and event.button_mask == 1:
		add_child(tempTower)
		
	elif event is InputEventMouseMotion and event.button_mask == 1:
		get_child(1).global_position = event.global_position
		
	elif event is InputEventMouseButton and event.button_mask == 0:
		print("left button up")
	
	else:
		pass
