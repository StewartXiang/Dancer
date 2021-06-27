extends TileMap


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const map = [
	[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, ], 
	[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, ], 
	[1, 1, 4, 4, 4, 4, 4, 4, 4, 1, ], 
	[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, ], 
	[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, ], 
	[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, ], 
	[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, ], 
	[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, ], 
	[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, ], 
	[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, ], 
]


# Called when the node enters the scene tree for the first time.
func _ready():
	clear()
	var row = 0
	while row < len(map):
		var col = 0
		while col < len(map[row]):
			set_cell(col, row, map[row][col])
			col += 1
		row += 1
			
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
# pass
