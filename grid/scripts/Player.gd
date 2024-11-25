extends CharacterBody2D

class_name Player

signal playerKeypressed

@export var hp: int
@export var atk: int
@export var dc: int
@export var playerclass: String
@export var range: int = 22


@onready var tile_map = $"../Map/Floor"
@onready var sprite_2d = $Sprite2D
@onready var movecheck = $RayCast2D
var can_move = false
var is_moving = false
var current_pos = [24,24]
var px: int = 16
var start_pos: Vector2
@onready var world = $".."



func _ready():
	pass
func _input(event):
	if event.is_action_pressed("up"):
		movecheck.target_position = Vector2.UP * range
		movecheck.force_raycast_update()
		if movecheck.is_colliding():
			return
		else:
			current_pos[1] -= px
			emit_signal("playerKeypressed")
			
	elif event.is_action_pressed("down"):
		movecheck.target_position = Vector2.DOWN * range
		movecheck.force_raycast_update()
		if movecheck.is_colliding():
			return
		else:
			current_pos[1] += px
			emit_signal("playerKeypressed")
	elif event.is_action_pressed("left"):
		movecheck.target_position = Vector2.LEFT * range
		movecheck.force_raycast_update()
		if movecheck.is_colliding():
			return
		else:
			current_pos[0] -= px
			emit_signal("playerKeypressed")
	elif event.is_action_pressed("right"):
		movecheck.target_position = Vector2.RIGHT * range
		movecheck.force_raycast_update()
		if movecheck.is_colliding():
			return
		else:
			current_pos[0] += px
			emit_signal("playerKeypressed")

	self.position = Vector2(current_pos[0], current_pos[1])
