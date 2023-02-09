extends MeshInstance

var eng_rotation_speed = 0
var engine_on = false
var momentum = false
var idle = 0.5
func _process(delta):
	rotate_object_local(Vector3(0, 1, 0), -deg2rad(eng_rotation_speed))
	if Input.is_action_just_pressed("engine_start"):
		engine_on = true
		if engine_on == true:
			eng_rotation_speed = eng_rotation_speed + 1
	if Input.is_action_pressed("ui_up"):
		eng_rotation_speed = eng_rotation_speed + 0.1
		momentum = false
		if eng_rotation_speed >= 4.5:
			eng_rotation_speed = 4.5
	#if its released it will decrease gradually
	if	Input.is_action_just_released("ui_up"):
		momentum = true
	#decrease engine speed till until it reaches one
	if momentum == true:
		eng_rotation_speed = eng_rotation_speed - 0.1
		if eng_rotation_speed <= idle:
			momentum = false
			eng_rotation_speed = idle
	#if Input.is_action_pressed("ui_down"):
		#eng_rotation_speed = eng_rotation_speed - 1
	if Input.is_action_just_pressed("engine_shutdown"):
		engine_on = false
		eng_rotation_speed = 0
