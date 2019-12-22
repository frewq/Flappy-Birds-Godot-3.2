extends StaticBody2D

onready var extremo_derecha_abajo = get_node("extremo_derecha_abajo")
onready var camara = utils.get_nodo_principal().get_node("camara")

signal destruido

func _ready():
	pass

func _process(delta):
	if camara == null: return
	
	if extremo_derecha_abajo.get_global_position().x <= camara.get_total_pos().x:
		queue_free()
		emit_signal("destruido")
	pass
