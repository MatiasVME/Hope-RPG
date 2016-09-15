
extends Node2D

func _on_Timer_timeout():
	get_node("black").queue_free()

func _on_shop_chest_pressed():
	get_tree().change_scene("res://scenes/shop_chest.tscn")

func _on_stats_pressed():
	get_tree().change_scene("res://scenes/stats.tscn")

func _on_upgrade_pressed():
	print("todavía no se que hace el upgrade")

func _on_mapa_pressed():
	# En el caso de que este pasando el primer mundo lo dirije
	# a la primera pantalla de niveles. En el caso de que ya
	# haya pasado más de un mundo lo dirige a la pantalla de
	# worlds
	get_tree().change_scene("res://scenes/levels.tscn")
