extends CharacterBody2D

var Tile_map: TileMap
var Astar = AStarGrid2D

var current_id_path:Array[Vector2i]
var speed := 60
func _ready() -> void:
	Tile_map = get_parent().get_node("TileMap")
	Astar = Tile_map.AstarGrid
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("RightClick"):
		get_coord()
func get_coord():
	var start_point = Tile_map.local_to_map(global_position)
	var end_point = Tile_map.local_to_map(get_global_mouse_position())
	current_id_path = Astar.get_id_path(start_point,end_point).slice(1)

func _physics_process(delta: float) -> void:
	# if character not moving
	if current_id_path.is_empty():
		return
	var target_position = Tile_map.map_to_local(current_id_path[0])
	if global_position.distance_to(target_position) < 2:
		current_id_path.pop_front()
		if current_id_path.is_empty():
			return
		target_position = Tile_map.map_to_local(current_id_path[0])

	move_PlayerTo(target_position , delta) 

func move_PlayerTo(target: Vector2, delta: float) -> void: 
	var direction = (target- global_position).normalized()
	global_position += direction * speed * delta
	move_and_slide()
