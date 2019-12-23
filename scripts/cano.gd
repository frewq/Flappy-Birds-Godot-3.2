extends StaticBody2D

onready var derecha = get_node("derecha")
onready var camara = utils.get_nodo_principal().get_node("camara")

signal exit_tree

func _ready():
	add_to_group(juego.GRUPO_CANOS)
	pass

func _process(delta):
	if camara == null: return
	
	if derecha.get_global_position().x <= camara.get_total_pos().x:
		queue_free()
		emit_signal("exit_tree")
	pass
