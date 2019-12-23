extends Node2D

const escena_cano = preload("res://scenes/cano.tscn")
const ALTURA_SUELO = 56
const CANO_WIDTH = 26
const OFFSET_X = 65
const OFFSET_Y = 55
const CANTIDAD_PARA_LLENAR_PANTALLA = 3

func _ready():
	var pajaro = utils.get_nodo_principal().get_node("pajaro")
	if pajaro:
		pajaro.connect("state_cambio", self,"_on_pajaro_state_cambia", [], CONNECT_ONESHOT)
	pass
	
func _on_pajaro_state_cambia(pajaro):
	if pajaro.get_state() == pajaro.STATE_ALETEANDO:
		iniciar()
	pass
	
func iniciar():
	posisicion_inicial()
	
	for i in range(CANTIDAD_PARA_LLENAR_PANTALLA):
		spawnear_y_mover()
	pass
	
func posisicion_inicial():
	randomize()
	
	var pos_inicial = Vector2()
	pos_inicial.x = get_viewport_rect().size.x + CANO_WIDTH/2
	pos_inicial.y = rand_range(0 + OFFSET_Y, get_viewport_rect().size.y - ALTURA_SUELO - OFFSET_Y)
	
	var camara = utils.get_nodo_principal().get_node("camara")
	if camara:
		pos_inicial.x += camara.get_total_pos().x
	
	
	set_position(pos_inicial)
	pass

func spawnear_y_mover():
	spawnear_cano()
	siguiente_posicion()
	pass

func spawnear_cano():
	var nuevo_cano = escena_cano.instance()
	nuevo_cano.set_position(get_position())
	nuevo_cano.connect("tree_exited", self, "spawnear_y_mover")
	get_node("contenedor").add_child(nuevo_cano)
	pass

func siguiente_posicion():
	randomize()
	
	var pos_siguiente = get_position()
	pos_siguiente.x += CANO_WIDTH/2 + OFFSET_X + CANO_WIDTH/2
	pos_siguiente.y = rand_range(0 + OFFSET_Y, get_viewport_rect().size.y - ALTURA_SUELO - OFFSET_Y)
	set_position(pos_siguiente)
	pass
