extends TileMap

var AstarGrid: AStarGrid2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	assigning_astar()
	
func assigning_astar():
	var used_rect = get_used_rect()
	AstarGrid = AStarGrid2D.new()
	AstarGrid.region = used_rect
	AstarGrid.cell_size = tile_set.tile_size
	AstarGrid.diagonal_mode = AStarGrid2D.DIAGONAL_MODE_NEVER
	AstarGrid.update()
	
	# setting up tiles where player can't walk
	for x in range(used_rect.size.x):
		for y in range(used_rect.size.y):
			var tile_position = Vector2i(x + used_rect.position	.x , y + used_rect.position.y)
			var tile_data = get_cell_tile_data(1,tile_position)
			if tile_data == null:
				pass
			elif tile_data.get_custom_data("Walkable") == false:
				AstarGrid.set_point_solid(tile_position)
