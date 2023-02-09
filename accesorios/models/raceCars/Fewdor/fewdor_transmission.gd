extends MeshInstance

var tr_rotation_speed = 0
var gear_ratios = [0 , 0.5, 1.0, 1.3]
var current_gear = 0
func _process(delta):
	rotate_object_local(Vector3(0, 1, 0), -deg2rad(tr_rotation_speed))
	if Input.is_action_just_pressed("shift_up"):
		current_gear = current_gear + 1
		if current_gear > 3:
			current_gear = 3
		tr_rotation_speed = gear_ratios[current_gear]
	print(tr_rotation_speed)
	if Input.is_action_just_pressed("shift_down"):
		current_gear = current_gear - 1
		tr_rotation_speed = gear_ratios[current_gear]
		if current_gear < 0:
			current_gear = 0
