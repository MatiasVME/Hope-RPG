
extends Node2D

func _ready():
	pass

func _on_Timer_timeout():
	get_node("black").queue_free()
