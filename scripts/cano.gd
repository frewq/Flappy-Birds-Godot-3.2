extends StaticBody2D

onready var derecha = get_node("derecha")
onready var camara = utils.get_nodo_principal().get_node("camara")

func _ready():
	pass

func _process(delta):
	if camara == null: return
	
	if derecha.get_global_position().x <= camara.get_total_pos().x:
		queue_free()
	pass
