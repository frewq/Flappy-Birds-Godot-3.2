extends CanvasLayer

const STAGE_GAME = "res://stages/game_stage.tscn"
const STAGE_MENU = "res://stages/menu_principal.tscn"

var esta_cambiando = false

signal stage_cambio

func _ready():
	layer = 0
	pass

func cambiar_nivel(stage_path):
	if esta_cambiando: return
	
	esta_cambiando = true
	layer = 20
	get_tree().get_root().set_disable_input(true)
	
	# fade to black
	$anim.play("fade_in")
	yield(get_node("anim"), "animation_finished")
	
	# change stage
	get_tree().change_scene(stage_path)
	emit_signal("stage_cambio")
	
	# fade from black
	$anim.play("fade_out")
	yield(get_node("anim"), "animation_finished")
	
	layer = 0
	esta_cambiando = false
	get_tree().get_root().set_disable_input(false)
	pass

