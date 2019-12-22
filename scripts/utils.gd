extends Node

func _ready():
	pass

func get_nodo_principal():
	var nodo_raiz = get_tree().get_root()
	return nodo_raiz.get_child((nodo_raiz.get_child_count()-1))
	pass
