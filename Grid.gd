extends Sprite2D

var gridSize = 32
var cursorPos = [0, 0]
var mode_selection_bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#Cursor movement function
func _input(event):
	#Boolean statement to switch between modes
	if (mode_selection_bool == false):
		#waits for Key input to move
		if event.is_action_pressed("grid_move_right"):
			print("move_right")
			cursorPos = [cursorPos[0] + gridSize, cursorPos[1]]
			#Prevents cursor from moving out of screen
			if (cursorPos[0] >= 1024):
				print("Wall")
				cursorPos = [cursorPos[0] - gridSize, cursorPos[1]]
				return
			#if Obejct_list is visible collision with that. Can't go further
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
		elif event.is_action_pressed("Mode_selection"):
			print("Mode Change")
			cursorPos = [1024, 0]
			mode_selection_bool= true
		
		#set new position for cursor
		self.position = Vector2(cursorPos[0], cursorPos[1])
		
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
		if event.is_action_pressed("Mode_selection"):
			cursorPos = Vector2(0, 0)
			mode_selection_bool = false

		self.position = Vector2(cursorPos[0], cursorPos[1])
			
			
			
			
