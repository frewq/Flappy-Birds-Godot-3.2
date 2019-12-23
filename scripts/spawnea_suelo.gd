extends Node2D

const escena_suelo = preload("res://scenes/suelo.tscn")
const SUELO_WIDTH = 168
const CANTIDAD_PARA_LLENAR_VISTA = 2

func _ready():
	for i in range(CANTIDAD_PARA_LLENAR_VISTA):
		spawnear_y_mover()
	pass

#evita que a veces el suelo no aparezca
func spawnear_y_mover():
	spawnea_suelo()
	siguiente_posicion()

func spawnea_suelo():
	var nuevo_suelo = escena_suelo.instance()
	nuevo_suelo.set_position(get_position())
	nuevo_suelo.connect("tree_exited", self, "spawnear_y_mover")
	get_node("contenedor").add_child(nuevo_suelo)
	pass

func siguiente_posicion():
	set_position(get_position() + Vector2(SUELO_WIDTH, 0))
	pass
