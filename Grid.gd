extends TileMap

var tile_size = get_cell_size()
var half_tile_size = tile_size / 2

var grid_size = vector2(16, 16)
var grid = []

# Called when the node enters the scene tree for the first time.
func _ready():
	for x in range(grid_size.x):
		grid.append([])
		for y in range(grid_size.y):
				grid[x].append[null]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process():
