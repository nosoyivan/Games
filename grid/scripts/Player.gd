extends CharacterBody2D
class_name Player

@export var hp: int
@export var atk: int
@export var dc: int
@export var playerclass: String
@export var range: int


@onready var tile_map = $"../Map/Floor"
@onready var sprite_2d = $Sprite2D
@onready var ray = $RayCast2D

var is_moving = false
var current_pos = [24,24]
var px: int = 16

signal key_pressed

func _input(event):
		
		
	if event.is_action_pressed("up"):
		ray.target_position = Vector2.UP * range
		ray.force_raycast_update()
		if ray.is_colliding():
			return
		else:
			current_pos[1] -= px
			emit_signal("key_pressed")
	elif event.is_action_pressed("down"):
		ray.target_position = Vector2.DOWN * range
		ray.force_raycast_update()
		if ray.is_colliding():
			return
		else:
			current_pos[1] += px
			emit_signal("key_pressed")
	elif event.is_action_pressed("left"):
		ray.target_position = Vector2.LEFT * range
		ray.force_raycast_update()
		if ray.is_colliding():
			return
		else:
			current_pos[0] -= px
			emit_signal("key_pressed")
	elif event.is_action_pressed("right"):
		ray.target_position = Vector2.RIGHT * range
		ray.force_raycast_update()
		if ray.is_colliding():
			return
		else:
			current_pos[0] += px
			emit_signal("key_pressed")

	self.position = Vector2(current_pos[0], current_pos[1])
