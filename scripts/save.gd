
extends Node

# Global Data
#

const PATH_GLOBAL_DATA = "user://global_data.txt"
var global_data = {}

func create_global_data():
	var save_dict = {
		first_time = true
	}
	
	return save_dict

func save_global_data():
	var savegame = File.new()
	
	if (!savegame.file_exists(PATH_GLOBAL_DATA)):
		global_data = create_global_data()
	
	savegame.open(PATH_GLOBAL_DATA, File.WRITE)
	savegame.store_line(global_data.to_json())
	savegame.close()

func load_global_data():
	# Instancia el fichero
	var savegame = File.new()
	# Verifica si el fichero no existe
	if (!savegame.file_exists(PATH_GLOBAL_DATA)):
		return

	# Diccionario en el cual se va a almacenar los datos
	var dict = {}
	
	# Abre el fichero
	savegame.open(PATH_GLOBAL_DATA, File.READ)
	#savegame.open_encrypted_with_pass(PATH_GLOBAL_DATA, File.WRITE, OS.get_unique_ID())
	
	# Se lee linea por linea y se pasa a json
	dict.parse_json(savegame.get_line())
	
	# Se cierra el fichero
	savegame.close()
	
	# La data se almacena en un diccionario
	global_data = dict

func load_or_save_global_data():
	if save.file_exist_global_data():
		save.load_global_data()
	else:
		save.save_global_data()

func file_exist_global_data():
	# Instancia el fichero
	var savegame = File.new()
	# Verifica si el fichero no existe
	if (savegame.file_exists(PATH_GLOBAL_DATA)):
		return true
	else:
		return false

# Game Data
#

const PATH_GAME_DATA = "user://game_data.txt"
var game_data = {}

func create_game_data():
	var save_dict = {
		player = {
			name = "",
			hp = 20,
			mana = 10,
			stats = {
				strength = 5,
				life = 5,
				lucky = 5,
				magic = 5
			}
		}
	}
	
	return save_dict

func save_game_data():
	var savegame = File.new()
	
	if (!savegame.file_exists(PATH_GAME_DATA)):
		game_data = create_game_data()
	
	savegame.open(PATH_GAME_DATA, File.WRITE)
	savegame.store_line(game_data.to_json())
	savegame.close()

func load_game_data():
	# Instancia el fichero
	var savegame = File.new()
	# Verifica si el fichero no existe
	if (!savegame.file_exists(PATH_GAME_DATA)):
		return
	
	# Diccionario en el cual se va a almacenar los datos
	var dict = {}
	
	# Abre el fichero
	savegame.open(PATH_GAME_DATA, File.READ)
	#savegame.open_encrypted_with_pass(PATH_GLOBAL_DATA, File.WRITE, OS.get_unique_ID())
	
	# Se lee linea por linea y se pasa a json
	dict.parse_json(savegame.get_line())
	
	# Se cierra el fichero
	savegame.close()
	
	# La data se almacena en un diccionario
	game_data = dict

func load_or_save_game_data():
	if save.file_exist_game_data():
		save.load_game_data()
	else:
		save.save_game_data()

func file_exist_game_data():
	# Instancia el fichero
	var savegame = File.new()
	# Verifica si el fichero no existe
	if (savegame.file_exists(PATH_GAME_DATA)):
		return true
	else:
		return false