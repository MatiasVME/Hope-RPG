
extends Node2D

func _ready():
	save.load_or_save_global_data() # Esta creado el global data?

func _on_Timer_timeout():
	if save.global_data["first_time"]:
		save.global_data["first_time"] = false
		save.save_global_data()
		get_tree().change_scene("res://scenes/intro.tscn")
	else:
		music.select_music("intro", 2)
		get_tree().change_scene("res://scenes/menu.tscn")
	
