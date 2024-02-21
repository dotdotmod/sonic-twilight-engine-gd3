extends KinematicBody

var player_id := "_p1"

var run_speed : float
var max_run_speed : float

var active_speed : float
var max_active_speed : float

export var default_down_vec : Vector3

func _physics_process(delta):

	var raw_input_direction = Vector3( Input.get_action_strength("move_backward" + player_id), 0, Input.get_action_strength("move_backwards" + player_id) - Input.get_action_strength("move_forward" + player_id) )
	var rotated_input_dir = raw_input_direction.rotated()
