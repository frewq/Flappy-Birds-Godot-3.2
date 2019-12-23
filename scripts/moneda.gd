extends Area2D

func _ready():
	connect("body_entered", self, "_on_entra_cuerpo")
	pass

func _on_entra_cuerpo(otro_cuerpo):
	if otro_cuerpo.is_in_group(juego.GRUPO_PAJAROS):
		juego.puntaje_actual += 1
		sounds.get_node("sfx_point").play()
	pass
