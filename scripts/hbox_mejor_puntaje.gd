extends HBoxContainer

const sprite_numero = [
	preload("res://sprites/number_middle_0.png"),
	preload("res://sprites/number_middle_1.png"),
	preload("res://sprites/number_middle_2.png"),
	preload("res://sprites/number_middle_3.png"),
	preload("res://sprites/number_middle_4.png"),
	preload("res://sprites/number_middle_5.png"),
	preload("res://sprites/number_middle_6.png"),
	preload("res://sprites/number_middle_7.png"),
	preload("res://sprites/number_middle_8.png"),
	preload("res://sprites/number_middle_9.png")
]


func _ready():
	juego.connect("puntaje_mejor_cambio",self,"on_puntaje_mejor_cambio")
	set_numero(juego.puntaje_mejor)
	pass
	
func on_puntaje_mejor_cambio():
	set_numero(juego.puntaje_mejor)
	pass

func set_numero(numero):
	for hijo in get_children():
		hijo.queue_free()
	
	for digito in utils.get_digitos(numero):
		var texture_frame = TextureRect.new()
		texture_frame.set_texture(sprite_numero[digito])
		add_child(texture_frame)
	pass
