extends VehicleBody

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var max_torque = 200
var max_rpm = 500
onready var eng_mesh = get_node("engineBlock/flyWheel")
var rpm = 0
var clutch = 0
onready var tr_mesh = get_node("transmission")
var instrumentCluster

# Called when the node enters the scene tree for the first time.
func _ready():
	instrumentCluster = get_node("instrumentCluster")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#engine
	var eng_rotation_speed = eng_mesh.eng_rotation_speed
	if eng_rotation_speed == 1:
		print("engine started!!!")
	#transmission
	var tr_rotation_speed = tr_mesh.tr_rotation_speed
	var current_gear = tr_mesh.current_gear
	print("current gear = ",tr_rotation_speed)
	#dif
	var dif = tr_rotation_speed * eng_rotation_speed
	#clutch
	if Input.is_action_just_released("clutch"):
		clutch = 1
	if Input.is_action_just_pressed("clutch"):
		clutch = 0
	print ("clutch = ",clutch)
	steering = lerp(steering, Input.get_axis("ui_right","ui_left") * 0.4, 5 * delta)
	var acceleration = eng_rotation_speed
	var rpm = $rr.get_rpm()
	$rr.engine_force = tr_rotation_speed*((eng_rotation_speed*dif)*clutch)
	rpm = $rl.get_rpm()
	$rl.engine_force = tr_rotation_speed*((eng_rotation_speed*dif)*clutch)
	#gearing
	if rpm < 30 && current_gear == 2:
		print("engine stalled!")
		eng_rotation_speed = 0
		clutch = 0
	#
	elif rpm < 250 && current_gear == 3:
		print("engine stalled!")
		eng_rotation_speed = 0
		clutch = 0
	#brakes?
	if Input.is_action_pressed("ui_down"):
		rpm = rpm - 1
	#changing camera
	if Input.is_action_pressed("changeCamera"):
		get_node("Camera").set_current(true)
	elif Input.is_action_pressed("lookback"):
		get_node("Camera2").set_current(true)
	elif Input.is_action_pressed("cockpitView"):
		get_node("Camera3").set_current(true)
	instrumentCluster.text = str ("eng speed = ", eng_rotation_speed,
								"\ntr speed = ", tr_rotation_speed,
								"\nclutch = ", clutch,
								"\ndifferential = ", dif,
								"\nacceleration = ", acceleration,
								"\nrpm = ", rpm)
