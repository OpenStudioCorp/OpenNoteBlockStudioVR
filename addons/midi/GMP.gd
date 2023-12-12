"""
	Godot MIDI Player Plugin by あるる（きのもと 結衣） @arlez80

	MIT License
"""

tool
extends EditorPlugin

#var sf2_import_plugin

func _enter_tree( ):
	pass
	#self.add_custom_type( "GodotMIDIPlayer", "Node", preload("MidiPlayer.gd"), preload("icon.png") )

	#self.sf2_import_plugin = preload("SoundFontImporter.gd").new( )
	#self.add_import_plugin( self.sf2_import_plugin )

func _exit_tree( ):
	pass
	#self.remove_custom_type( "GodotMIDIPlayer" )

	#self.remove_import_plugin( self.sf2_import_plugin )
	#self.sf2_import_plugin = null

func has_main_screen():
	return false

func make_visible( visible:bool ):
	pass

func get_plugin_name( ):
	return "Godot MIDI Player"
