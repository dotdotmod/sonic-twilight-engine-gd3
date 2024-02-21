extends KinematicBody

export var player_id := "_p1"
export var acceleration := 10.0
export var decceleration := 0.2

var run_speed : float
export var max_run_speed := 100

var active_speed : float
var max_active_speed : float
var gravity_calculation : Vector3

onready var model_core = $model_core

export var default_down_vec := Vector3(0, -1, 0)

func _physics_process(delta):
	var true_velocity : Vector3
	var raw_input_direction = Vector3( Input.get_action_strength("move_rightways" + player_id) - Input.get_action_strength("move_leftways" + player_id)
	, 0, Input.get_action_strength("move_backward" + player_id) - Input.get_action_strength("move_forward" + player_id) )
	var rotated_input_dir = raw_input_direction.rotated(+model_core.transform.basis.y, model_core.rotation.y)
	if not raw_input_direction:
		run_speed += acceleration * delta
	else:
		run_speed -= 2 * delta
	
	run_speed = clamp(run_speed, 0, max_run_speed)
	active_speed = run_speed
	
	if not rotated_input_dir == Vector3():
		true_velocity = rotated_input_dir * active_speed
	else:
		true_velocity = lerp(true_velocity, Vector3(), decceleration)
	
	move_and_slide(true_velocity, Vector3.UP)
