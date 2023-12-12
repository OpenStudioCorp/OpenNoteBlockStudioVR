tool
extends EditorImportPlugin

enum Presets { PRESET_DEFAULT }

func get_importer_name( ):
	return "SoundFont Importer for Godot MIDI Player"

func get_visible_name( ):
	return "SoundFont"

func get_recognized_extensions( ):
	return ["sf2"]

func get_save_extension( ):
	return "res"

func get_resource_type( ):
	return "Resource"

func get_preset_count( ):
	return Presets.size()

func get_preset_name( preset:int ):
	match preset:
		Presets.PRESET_DEFAULT:
			return "Default"
		_:
			return "Unknown"

func get_import_options( preset:int ):
	match preset:
		Presets.PRESET_DEFAULT:
			return [{
					   "name": "default",
					   "default_value": false
					}]
		_:
			return []

func get_option_visibility( option:String, options:Dictionary ):
	return true

func import( source_file:String, save_path:String, s:Dictionary, platform_variants:Array, gen_files:Array ) -> int:
	var sf_reader: = SoundFont.new( )
	var result: = sf_reader.read_file( source_file )
	if result.error != OK:
		return result.error

	var bank: = Bank.new( )
	bank.read_soundfont( result.data )

	return ResourceSaver.save( "%s.%s" % [save_path, self.get_save_extension( )], bank, ResourceSaver.FLAG_COMPRESS )
