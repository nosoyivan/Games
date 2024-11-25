extends Node2D
var playerStartPos = [24,24]
func _ready():
	process_mode = Node.PROCESS_MODE_PAUSABLE

func _process(delta):
	pass

func playerKeypressed():
	get_tree().paused = true
	await get_tree().create_timer(0.125).timeout
	get_tree().paused = false
	pass  # Replace with function body.
