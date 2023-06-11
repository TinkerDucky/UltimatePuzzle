extends Node

var gridSize = 32
var excess_length = 3 * gridSize - gridSize
var objectPos = [0, 0]
var object_movement = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
#Obects with Enum doing etc.
func _input(event):
	#Object will be selected and will be moved in position
	if event.is_action_pressed("object_selection"):
		self.position = Vector2(0, 0)
		object_movement = true
		#cursor_movement = false
	if(object_movement == true):
		if event.is_action_pressed("grid_move_right"):
			print("move_right")
			objectPos = [objectPos[0] + gridSize, objectPos[1]]
			if (objectPos[0] >= 1024 - excess_length):
				print("Wall")
				objectPos = [objectPos[0] - gridSize, objectPos[1]]
				return
		if event.is_action_pressed("grid_move_left"):
			print("move_left")
			objectPos = [objectPos[0] - gridSize, objectPos[1]]
			if (objectPos[0] < 0):
				print("Wall")
				objectPos = [objectPos[0] + gridSize, objectPos[1]]
				return
		if event.is_action_pressed("grid_move_up"):
			print("move_up")
			objectPos = [objectPos[0], objectPos[1] - gridSize]
			if (objectPos[1] < 0):
				print("Wall")
				objectPos = [objectPos[0], objectPos[1] + gridSize]
				return
		if event.is_action_pressed("grid_move_down"):
			print("move_down")
			objectPos = [objectPos[0], objectPos[1] + gridSize]
			if (objectPos[1] >= 1024):
				print("Wall")
				objectPos = [objectPos[0], objectPos[1] - gridSize]
				return
		if event.is_action_pressed("set_object"):
			object_movement = false
			#cursor movement = true
			
		self.position = Vector2(objectPos[0], objectPos[1])
	
	
