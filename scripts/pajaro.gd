extends RigidBody2D

func _ready():
	set_linear_velocity(Vector2(50, linear_velocity.y))
	pass

func _process(delta):
#	print(rad2deg(rotation))
	if rad2deg(rotation) < -30:
		set_rotation(deg2rad(-30))
		set_angular_velocity(0)
		
	if linear_velocity.y > 0:
		set_angular_velocity(3)
	pass
	
func aletear():
	set_linear_velocity(Vector2(linear_velocity.x, -150))
	set_angular_velocity(-3)
	pass
	
func _input(event):
	if Input.is_action_just_pressed("aletear"):
		aletear()
	pass
