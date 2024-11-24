extends CharacterBody2D

class_name Enemy1

@export var hp: int
@export var atk: int
@export var dc: int
@export var enemytype: String
@export var range: int = 16

@onready var navigation_agent_2d: NavigationAgent2D = $NavigationAgent2D
@onready var tile_map = $"../Map/Floor"
@onready var sprite_2d = $Sprite2D
@onready var movecheck = $RayCast2D

var current_pos = [120,136]
var px: int = 16

var player: Node2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func _ready():
	## Adjust the path to your player node
	#player = get_node("/root/World/Player")
	## Connect to the player's signal correctly
	#player.connect("playerKeypressed", self.playerKeypressed)
	pass

func _input(event):

	if event.is_action_pressed("up"):
		movecheck.target_position = Vector2.DOWN * range
		movecheck.force_raycast_update()
		if movecheck.is_colliding():
			return
		else:
			current_pos[1] += px

	elif event.is_action_pressed("down"):
		movecheck.target_position = Vector2.UP * range
		movecheck.force_raycast_update()
		if movecheck.is_colliding():
			return
		else:
			current_pos[1] -= px

	elif event.is_action_pressed("left"):
		movecheck.target_position = Vector2.RIGHT * range
		movecheck.force_raycast_update()
		if movecheck.is_colliding():
			return
		else:
			current_pos[0] += px

	elif event.is_action_pressed("right"):
		movecheck.target_position = Vector2.LEFT * range
		movecheck.force_raycast_update()
		if movecheck.is_colliding():
			return
		else:
			current_pos[0] -= px

	self.position = Vector2(current_pos[0], current_pos[1])
