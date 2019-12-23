extends Node

const GRUPO_CANOS = "canos"
const GRUPO_SUELOS = "suelos"
const GRUPO_PAJAROS = "pajaros"

var puntaje_mejor = 0 setget _set_puntaje_mejor
var puntaje_actual = 0 setget _set_puntaje_actual

signal puntaje_mejor_cambio
signal puntaje_actual_cambio

func _ready():
	state_manager.connect("stage_cambio", self, "_on_stage_cambio")
	pass

func _on_stage_cambio():
	puntaje_actual = 0
	pass

func _set_puntaje_mejor(nuevo_valor):
	puntaje_mejor = nuevo_valor
	emit_signal("puntaje_mejor_cambio")
	pass

func _set_puntaje_actual(nuevo_valor):
	puntaje_actual = nuevo_valor
	emit_signal("puntaje_actual_cambio")
	pass