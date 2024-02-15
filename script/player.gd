extends CharacterBody3D

@export var mov_speed = 7
@export var fall_acceleration = 300
@export var jump_height = 10000


func _physics_process(delta):	
	var direction = Vector3.ZERO

	#Left Right
	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1

	var target_velocity = Vector3.ZERO

	#Ground Velocity
	target_velocity.x = direction.x * mov_speed

	#Vertical Velocity
	if not is_on_floor():
		target_velocity.y = target_velocity.y - (fall_acceleration * delta)

	#Jump
	if is_on_floor() and Input.is_action_just_pressed("move_jump"):
		target_velocity.y = delta * jump_height

	velocity = target_velocity
	move_and_slide()
