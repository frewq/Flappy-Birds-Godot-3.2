extends RigidBody2D

onready var state = VolarState.new(self)

var rapidez = 50

const STATE_VOLANDO = 0
const STATE_ALETEANDO = 1
const STATE_HIT = 2
const STATE_SUELO = 3

signal state_cambio

func _ready():
	
	connect("body_entered",self, "_on_cuerpo_entra")
	pass

func _process(delta):
	state.update(delta)
	
	pass
	
func _input(event):
	state.input(event)
	pass
	
func _on_cuerpo_entra(otro_cuerpo):
	if state.has_method("on_cuerpo_entra"):
		state.on_cuerpo_entra(otro_cuerpo)
	pass
	
func set_state(nuevo_state):
	state.salir()
	
	if nuevo_state == STATE_VOLANDO:
		state = VolarState.new(self)
	elif nuevo_state == STATE_ALETEANDO:
		state = AletearState.new(self)
	elif nuevo_state == STATE_HIT:
		state = HitState.new(self)
	elif nuevo_state == STATE_SUELO:
		nuevo_state = SueloState.new(self)
	pass
	
	emit_signal("state_cambio",self)

func get_state():
	if state is VolarState:
		return  STATE_VOLANDO
	elif state is AletearState:
		return STATE_ALETEANDO
	elif state is HitState:
		return STATE_HIT
	elif state is SueloState:
		return STATE_SUELO
	pass

#-----------------------------------------------------

class VolarState:
	var pajaro
	var escala_gravedad_antigua
	
	func _init(pajaro):
		self.pajaro = pajaro
		pajaro.get_node("AnimationPlayer").play("volar")
		pajaro.set_linear_velocity(Vector2(pajaro.rapidez, pajaro.linear_velocity.y))
		
		escala_gravedad_antigua = pajaro.get_gravity_scale()
		pajaro.set_gravity_scale(0)
		pass
	
	func update(delta):
		pass
	
	func input(event):
		pass
		
	func salir():
		pajaro.set_gravity_scale(escala_gravedad_antigua)
		pajaro.get_node("AnimationPlayer").stop()
		pajaro.get_node("AnimatedSprite").set_position(Vector2(0,0))
		pass

#-----------------------------------------------------

class AletearState:
	var pajaro
	
	func _init(pajaro):
		self.pajaro = pajaro
		
		pajaro.set_linear_velocity(Vector2(pajaro.rapidez, pajaro.linear_velocity.y))
		aletear()
		pass
	
	func update(delta):
		if rad2deg(pajaro.rotation) < -30:
			pajaro.set_rotation(deg2rad(-30))
			pajaro.set_angular_velocity(0)
		
		if pajaro.linear_velocity.y > 0:
			pajaro.set_angular_velocity(3)
		pass
	
	func input(event):
		if Input.is_action_just_pressed("aletear"):
			aletear()
		pass
	
	func on_cuerpo_entra(otro_cuerpo):
		if otro_cuerpo.is_in_group(juego.GRUPO_CANOS):
			pajaro.set_state(pajaro.STATE_HIT)
		elif otro_cuerpo.is_in_group(juego.GRUPO_SUELOS):
			pajaro.set_state(pajaro.STATE_SUELO)
		pass
	
	func aletear():
		pajaro.set_linear_velocity(Vector2(pajaro.linear_velocity.x, -150))
		pajaro.set_angular_velocity(-3)
		pajaro.get_node("AnimationPlayer").play("aletear")
		pass
		
	func salir():
		pass
		

#-----------------------------------------------------

class HitState:
	var pajaro
	
	func _init(pajaro):
		self.pajaro = pajaro
		pajaro.set_linear_velocity(Vector2(0, 0))
		pajaro.set_angular_velocity(2)
		
		var otro_cuerpo = pajaro.get_colliding_bodies()[0]
		pajaro.add_collision_exception_with(otro_cuerpo)
		
		pass
	
	func update(delta):
		pass
	
	func input(event):
		
		pass
		
	func on_cuerpo_entra(otro_cuerpo):
		if otro_cuerpo.is_in_group(juego.GRUPO_SUELOS):
			pajaro.set_state(pajaro.STATE_SUELO)
		pass
		
	func salir():
		pass	

#-----------------------------------------------------

class SueloState:
	var pajaro
	
	func _init(pajaro):
		self.pajaro = pajaro
		pajaro.set_linear_velocity(Vector2(0, 0))
		pajaro.set_angular_velocity(0)
		pass
	
	func update(delta):
		pass
	
	func input(event):
		pass
		
	func salir():
		pass
