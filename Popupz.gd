extends Popup


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("ui_home"):
		showpopup()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func showpopup():
	var popup_instance = $popup
	$PopupContainer.add_child(popup_instance)
	popup_instance.popup_centered()  # Display the pop-up in the center of the screen
