#Rotating of Objects?
#if object is set you can't press i again but u to move it again
#Object selection is more like. Take that ONE Object to move it again

#To-list
#programm the selection of more than one object
#Enum? with gridsize

extends Sprite2D
#cursor_movement is faster if key is pressed hold
var gridSize = 32
var cursorPos = [0, 0]
var mode_selection_bool = false
#je nach Baustein in x und y Achse?
var objectPos = [0, 0]
var object_movement = false
var cursor_movement = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	#print(get_node("Object_List").get_children(false)[0])
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#Cursor movement function
func _input(event):
	
	var excess_length = get_node("Object_List").get_children(false)[0].size.x - gridSize
	
	if(cursor_movement == true):
	#if(1 == 1):
		#Boolean statement to switch between modes
		if(mode_selection_bool == false):
			#waits for Key input to move
			if event.is_action_pressed("grid_move_right"):
				print("move_right")
				cursorPos = [cursorPos[0] + gridSize, cursorPos[1]]
				#Prevents cursor from moving out of screen
				if (cursorPos[0] >= 1024):
					print("Wall")
					cursorPos = [cursorPos[0] - gridSize, cursorPos[1]]
					return
			elif event.is_action_pressed("grid_move_left"):
				print("move_left")
				cursorPos = [cursorPos[0] - gridSize, cursorPos[1]]
				if (cursorPos[0] < 0):
					print("Wall")
					cursorPos = [cursorPos[0] + gridSize, cursorPos[1]]
					return
			elif event.is_action_pressed("grid_move_up"):
				print("move_up")
				cursorPos = [cursorPos[0], cursorPos[1] - gridSize]
				if (cursorPos[1] < 0):
					print("Wall")
					cursorPos = [cursorPos[0], cursorPos[1] + gridSize]
					return
			elif event.is_action_pressed("grid_move_down"):
				print("move_down")
				cursorPos = [cursorPos[0], cursorPos[1] + gridSize]
				if (cursorPos[1] >= 1024):
					print("Wall")
					cursorPos = [cursorPos[0], cursorPos[1] - gridSize]
					return
			#Change into object_list Mode
			elif event.is_action_pressed("mode_selection"):
				print("Mode Change")
				cursorPos = [1024, 0]
				mode_selection_bool = true
			
			#set new position for cursor
			#self.position = Vector2(cursorPos[0], cursorPos[1])
			get_node("Cursor").position = Vector2(cursorPos[0], cursorPos[1])
			
		elif(mode_selection_bool == true):
			if event.is_action_pressed("grid_move_up"):
				print("move_up")
				cursorPos = [cursorPos[0], cursorPos[1] - 2 * gridSize]
				if (cursorPos[1] < 0):
					print("Wall")
					cursorPos = [cursorPos[0], cursorPos[1] + 2 * gridSize]
					return
			elif event.is_action_pressed("grid_move_down"):
				print("move_down")
				cursorPos = [cursorPos[0], cursorPos[1] + 2 * gridSize]
				if (cursorPos[1] >= 1024):
					print("Wall")
					cursorPos = [cursorPos[0], cursorPos[1] - 2 * gridSize]
					return
			#Change into Gameboard Mode
			if event.is_action_pressed("mode_selection"):
				cursorPos = Vector2(0, 0)
				mode_selection_bool = false
				
			#self.position = Vector2(cursorPos[0], cursorPos[1])
			get_node("Cursor").position = Vector2(cursorPos[0], cursorPos[1])
			
	#else:
		#return
	#Object will be selected and will be moved in position	
	if event.is_action_pressed("object_selection"):
		get_node("Object_List").get_children(false)[0].global_position = Vector2(0, 0)
		object_movement = true
		cursor_movement = false
	if(object_movement == true):
		if event.is_action_pressed("grid_move_right"):
			print("move_right")
			objectPos = [objectPos[0] + gridSize, objectPos[1]]
			if (objectPos[0] >= 1024 - excess_length):
				print("Wall")
				objectPos = [objectPos[0] - gridSize, objectPos[1]]
				return
		elif event.is_action_pressed("grid_move_left"):
			print("move_left")
			objectPos = [objectPos[0] - gridSize, objectPos[1]]
			if (objectPos[0] < 0):
				print("Wall")
				objectPos = [objectPos[0] + gridSize, objectPos[1]]
				return
		elif event.is_action_pressed("grid_move_up"):
			print("move_up")
			objectPos = [objectPos[0], objectPos[1] - gridSize]
			if (objectPos[1] < 0):
				print("Wall")
				objectPos = [objectPos[0], objectPos[1] + gridSize]
				return
		elif event.is_action_pressed("grid_move_down"):
			print("move_down")
			objectPos = [objectPos[0], objectPos[1] + gridSize]
			if (objectPos[1] >= 1024):
				print("Wall")
				objectPos = [objectPos[0], objectPos[1] - gridSize]
				return
		elif event.is_action_pressed("set_object"):
			object_movement = false
			cursor_movement = true
			
		get_node("Object_List").get_children(false)[0].global_position = Vector2(objectPos[0], objectPos[1])
		
