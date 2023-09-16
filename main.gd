extends Node

var globalthing = "res://global.gd"
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
 # You can change this based on your project structure

# Function to open the pop-up
func _on_OpenPopupButton_pressed():
	var popup_instance = preload("res://Popup.tscn").instance()
	$PopupContainer.add_child(popup_instance)
	popup_instance.popup_centered()  # Display the pop-up in the center of the screen

# Function to close the pop-up
func _on_CloseButton_pressed():
	if $PopupContainer.get_child_count() > 0:
		$PopupContainer.get_child(0).queue_free()  # Remove the pop-up from the scene
		
		
