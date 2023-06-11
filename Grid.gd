extends Sprite2D

var gridSize = 32
var cursorPos = [0, 0]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if event.is_action_pressed("grid_move_right"):
		print("move_right")
		cursorPos = [cursorPos[0] + gridSize, cursorPos[1]]
		self.position = Vector2(cursorPos[0], cursorPos[1])
