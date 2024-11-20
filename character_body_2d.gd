extends CharacterBody2D

@onready var player = $Sprite2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const MAX_JUMP_Y = -1000
const MIN_JUMP_Y = -300

var direction = 1
var jump_start = 0
var is_charging = false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle charged jump
	if Input.is_action_just_pressed("up") and is_on_floor():
		jump_start = Time.get_ticks_msec()/1000.0
		is_charging = true
	if Input.is_action_just_released("up") and is_on_floor() and is_charging:
		velocity.y = get_jump_force((Time.get_ticks_msec()/1000)-jump_start)
		is_charging = false

	
	if Input.is_action_just_pressed("left"):
		direction = -1
		player.flip_h = true

	if Input.is_action_just_pressed("right"):
		direction = 1
		player.flip_h = false

	move_and_slide()

#finding jump velcity for charged jump
func get_jump_force(time):
	return max(MIN_JUMP_Y+ (time*MIN_JUMP_Y), MAX_JUMP_Y)