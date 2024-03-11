extends Panel

@onready var tower = preload("res://Scenes/tower_bullet.tscn")

func _on_gui_input(event):
	var tempTower = tower.instantiate()
	
	#print(event)
	#spawn a new tower for the user when clicking on the gui panel
	if event is InputEventMouseButton and event.button_mask == 1:
		#event.button_mask == 1 is mouse button down 
		add_child(tempTower)
		
	#update tempTower's position so the user can click and drag to tower around
	elif event is InputEventMouseMotion and event.button_mask == 1:
		#event.button_mask == 1 is mouse button down 
		if get_child_count() > 1:
			get_child(1).global_position = event.global_position
		
	#Add the tower to the level once the user has let go of the mouse button they were previously holding
	elif event is InputEventMouseButton and event.button_mask == 0:
		#event.button_mask == 0 is mouse button up
		#Removes any extra towers, should only be one tower selectable at a time.
		if get_child_count() > 1:
				get_child(1).queue_free()
		
		#Prevents placing towers in the GUI space. >= 976 would be in the GUI space
		if event.global_position.x < 976: #960 + 16
			#Add the tempTower the user is holding and add it to the "Towers" node in the current level
			var path = get_tree().get_root().get_node("Level 1/Towers")	
			path.add_child(tempTower)
			tempTower.global_position = event.global_position
			tempTower.get_node("GUIArea").hide()
		
	else:
		#Removes any extra towers, should only be one tower selectable at a time.
		if get_child_count() > 1:
			get_child(1).queue_free()
