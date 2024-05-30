extends Panel

@onready var tower = preload("res://Scenes/tower_bullet.tscn")
var currentTile
var validTile = Vector2i(4,5) #What tile from the tilemap is valid for placing a tower on. Atlas tile (4,5)
var tempTower

func _on_gui_input(event):
	var tempTower = tower.instantiate()
	#print(tempTower.cost)
	#print(tempTower.name)
	
	if get_parent().get_node("BoxContainer/Gold").gold >= tempTower.cost:
		#print("Has enough gold")
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
				
				#Retrieve info to check what tile the user is currently holding the tower over. i.e. is it over grass, dirt, etc.
				var mapPath = get_tree().get_root().get_node("Level/TileMap")
				var tile = mapPath.local_to_map(get_global_mouse_position())
				currentTile = mapPath.get_cell_atlas_coords(0, tile, false)
				
				#If the tile is on a valid space. i.e. not on the path the enemies take
				if (currentTile == validTile):
					#Show a green area
					get_child(1).get_node("GUIArea").modulate = Color(0, 255, 0, 0.5)
				else:
					#show a red area
					get_child(1).get_node("GUIArea").modulate = Color(255, 0, 0, 0.5)
				
		#Add the tower to the level once the user has let go of the mouse button they were previously holding
		elif event is InputEventMouseButton and event.button_mask == 0:
			#event.button_mask == 0 is mouse button up
			#Removes any extra towers, should only be one tower selectable at a time.
			if get_child_count() > 1:
					get_child(1).queue_free()
			
			#Prevents placing towers in the GUI space. >= 976 would be in the GUI space
			if event.global_position.x < 976: #960 + 16
				#If the tile is on a valid space. i.e. not on the path the enemies take
				if (currentTile == validTile):
					#Add the tempTower the user is holding and add it to the "Towers" node in the current level
					var path = get_tree().get_root().get_node("Level/Towers")	
					path.add_child(tempTower)
					tempTower.global_position = event.global_position
					tempTower.get_node("GUIArea").hide()
					
					get_parent().get_node("BoxContainer/Gold").update(-tempTower.cost)
			
		else:
			#Removes any extra towers, should only be one tower selectable at a time.
			if get_child_count() > 1:
				get_child(1).queue_free()
