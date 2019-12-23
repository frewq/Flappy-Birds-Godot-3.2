extends StaticBody2D

onready var extremo_derecha_abajo = get_node("extremo_derecha_abajo")
onready var camara = utils.get_nodo_principal().get_node("camara")

func _ready():
	add_to_group(juego.GRUPO_SUELOS)
	pass

func _process(delta):
	if camara == null: return
	
	if extremo_derecha_abajo.get_global_position().x <= camara.get_total_pos().x:
		queue_free()
		emit_signal("tree_exited")
	pass
