extends Node

func _ready():
	pass

func get_nodo_principal():
	var nodo_raiz = get_tree().get_root()
	return nodo_raiz.get_child((nodo_raiz.get_child_count()-1))
	pass

func get_digitos(numero):
	var str_numero = str(numero)
	var digitos = []
	
	for i in range(str_numero.length()):
		digitos.append(str_numero[i].to_int())
	
	return digitos
	pass
