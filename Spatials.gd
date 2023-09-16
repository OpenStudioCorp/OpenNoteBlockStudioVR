extends Spatial

var mouse_locked = true  # Track whether the mouse is locked or not

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)  # Start with the mouse locked

func _input(event):
	if event.is_action_pressed("toggle_mouse_lock"):
		print("Toggle mouse lock action detected")
		toggle_mouse_lock()
	elif event.is_action_released("ui_cancel"):
		if mouse_locked:
			unlock_mouse()
		else:
			lock_mouse()

func toggle_mouse_lock():
	print("Toggle mouse lock function called")
	if mouse_locked:
		unlock_mouse()
	else:
		lock_mouse()

func lock_mouse():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	mouse_locked = true

func unlock_mouse():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	mouse_locked = false