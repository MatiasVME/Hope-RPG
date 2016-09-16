
extends Node2D

onready var txt = get_node("txt")

var intro_text = [
	"El mundo se está hundiendo.",
	"Hay enemigos en todas partes.",
	"Debo saber qué es lo que está pasando.",
	"He estado escondido en esta cueva durante mucho tiempo.",
	"Y ya no hay abasto.",
	"Pero..",
	"Hoy es diferente…",
	"O por lo menos para mi.",
	"Porque hoy, me levanté y decidí luchar."
	]
var current_text = ""
var next_step = false

func _ready():
	set_process(true)

func _process(delta):
	pass

func _on_area_input_event( viewport, event, shape_idx ):
	if event.is_action_pressed("ui_left_click"):
		next_step = true

var i = 0 # incremento de caracteres
var j = 0 # incremento para frase
var last_step  = false # último paso para cambiar a la proxima escena

func _on_Timer_timeout():
	_update_text()
	
	if i < intro_text[j].length():
		i += 1
	
	_next_step()
	
	if last_step and next_step:
		get_tree().change_scene("res://scenes/menu.tscn")
		
	
func _next_step():
	if next_step and j < intro_text.size() - 1:
		next_step = false
		j += 1
		i = 0
		current_text = ""
		
		if j == intro_text.size() - 1:
			music.select_music("first_intro")
			last_step = true
		
func _update_text():
	if i < intro_text[j].length() and j < intro_text.size():
		current_text += intro_text[j][i]
		txt.set_text(current_text)