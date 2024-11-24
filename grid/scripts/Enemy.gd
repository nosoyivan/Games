extends CharacterBody2D
class_name Enemy

@export var hp: int
@export var atk: int
@export var dc: int
@export var enemytype: String
@export var range: int

@onready var navigation_agent_2d: NavigationAgent2D = $NavigationAgent2D
@onready var tile_map = $"../Map/Floor"
@onready var sprite_2d = $Sprite2D
@onready var ray = $RayCast2D

var player: Node2D

func _ready():
	# Adjust the path to your player node
	player = get_node("/root/World/Player")
	# Connect to the player's signal correctly
	player.connect("key_pressed", self._on_player_key_pressed)

func _on_player_key_pressed():
	# Set the target position to the player's position
	navigation_agent_2d.target_position = player.global_position

	# Check if the navigation is finished
	if not navigation_agent_2d.is_navigation_finished():
		var next_position = navigation_agent_2d.get_next_path_position()
		var direction = (next_position - global_position).normalized()
		var step_distance = 16  # Adjust to your grid size or desired step size

		# Move the enemy towards the next position by one step
		global_position += direction * step_distance

		# Advance the navigation agent
		navigation_agent_2d.velocity = direction * step_distance
		navigation_agent_2d.advance(step_distance)
	else:
		print("Enemy has reached the player.")
