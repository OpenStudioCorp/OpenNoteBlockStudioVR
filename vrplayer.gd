extends Spatial

func _ready():
	# Check if we're running in desktop mode
	if Engine.editor_hint or OS.get_cmdline_args().find("--desktop") != -1:
		# We're in desktop mode, so disable the viewport
		get_viewport().visible = false
		return

	# Initialize VR
	var VR = ARVRServer.find_interface("OpenVR")
	if VR and VR.initialize():
		get_viewport().arvr = true
		get_viewport().hdr = false

		OS.vsync_enabled = false
		Engine.target_fps = 90
		# Also, the physics FPS in the project settings is also 90 FPS. This makes the physics
		# run at the same frame rate as the display, which makes things look smoother in VR!
