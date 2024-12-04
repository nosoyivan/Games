extends Node2D

@onready var enemy: Node2D = $Enemy

@onready var enemysprite: Sprite2D = $"Enemy/Base"

var area: int
var newgame: bool = false

func _ready():
	if Data.sit == null:
		print("sit = null")
	if newgame == true:
		area = 0
	else:
		area = Data.area
		print(Data.area)
		pass
	process_mode = Node.PROCESS_MODE_PAUSABLE
	state()

func state():
	if area == 0:
		enemysprite.frame_coords.x = 3
		enemy.hp = 0
		pass
	if area == 1:
		enemysprite.frame_coords.x = 4
		enemy.hp = 5
		pass
	if area == 2:
		enemysprite.frame_coords.x = 5
		enemy.hp = 8
		pass

func _process(delta):
	pass

func playerKeypressed():
	get_tree().paused = true
	await get_tree().create_timer(0.125).timeout
	get_tree().paused = false
	pass  # Replace with function body.
