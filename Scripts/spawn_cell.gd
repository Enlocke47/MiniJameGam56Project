extends TileMapLayer

var GridSize_y = 1
var GridSize_x = 1
var dict = {}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_cells()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	GridSize_x = GridSize_x + 1 
	spawn_cells()

func spawn_cells() ->void:
	for x in GridSize_x:
		for y in GridSize_y:
			set_cell(Vector2i(x,y), 0, Vector2i(0,0))


func _on_grow_y_pressed() -> void:
	GridSize_y = GridSize_y + 1 
	spawn_cells()
