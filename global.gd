extends Node



var is_game_paused = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func pause_game():
	is_game_paused = true
	# Disable player input, camera movement, or any other relevant controls
	# For example, set player's input functions to no-op, disable camera rotation, etc.

func unpause_game():
	is_game_paused = false
	# Restore player input, camera movement, or any other relevant controls

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
