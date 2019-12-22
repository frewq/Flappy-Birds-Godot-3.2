extends Camera2D

onready var pajaro = utils.get_nodo_principal().get_node("pajaro")

func _ready():
	pass

func _process(delta):
	set_position(Vector2(pajaro.position.x, position.y))

func get_total_pos():
	return get_position() + get_offset()
	pass
