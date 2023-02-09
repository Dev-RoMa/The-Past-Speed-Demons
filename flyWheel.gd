extends KinematicBody

var rot_speed = 0.1
var rotate = Quat()

func _process(delta):
	rotate = rotate * Quat(Vector3(0, 1, 0), rot_speed)
	self.rotate = rotate
