
extends Node

var current_music = null

func select_music(name, offset = 0):
	if name == "win_a":
		current_music = get_node("win_a")
		current_music.play(offset)
	elif name == "win_b":
		current_music = get_node("win_b")
		current_music.play(offset)
	elif name == "battle":
		current_music = get_node("battle")
		current_music.play(offset)
	elif name == "boss_battle":
		current_music = get_node("boss_battle")
		current_music.play(offset)
	elif name == "first_intro":
		current_music = get_node("first_intro")
		current_music.play(offset)
	elif name == "intro":
		current_music = get_node("intro")
		current_music.play(offset)

func stop_music():
	if current_music != null:
		current_music.stop()
